#bin/bash

echo "Usage: launchLama.sh domain_file problem_file time_relaxed_search(s) agent_decomp?(y/n) launch_hard_temp_constraints?(h)"

echo "removing past files"
rm -rf step_*
rm -f end_state
rm -f current_constraints
rm -f agent*.groups
rm -f all.groups
rm -f final_plan.txt
rm -f output.sas
rm -f all.groups
rm -f test.groups
rm -f *.log


start=`date +%s.%N`

if [ "$5" = "h" ]; then
  echo "Launching with HARD temporal constraints"
  HARD_CONST=h
else
  echo "Launching with SOFT temporal constraints"
fi

echo "Launching Translate"
python3 pddl2-SAS-translate/translate.py $1 $2 $3 $4> translate.log

echo "Launching Preprocess"
for folder in step_*
do
	if [ "step_0" = "$folder" ]; then
		files_dir_prepro="step_0/"output_agent*.sas
		echo "Preprocess and search will be launched for step_0"
		for file in $files_dir_prepro
		do
			echo "Launching preprocess for $file"
			preprocess/preprocess $file >> prepros.log
		done

		command="mv output_preproagent* $folder"
		`$command`

		files_dir_search="step_0/"output_preproagent*
		n_search=0
		for file in $files_dir_search
		do
			if [ "0" -eq "$n_search" ]; then
				echo "Launching search WITHOUT constraints WITHOUT init state for $file"
				timeout 30s search/search wlFi $file >> search_"$folder"_"$n_search"_l.log

				FILE=step_0/output_preproagent0.1
        if test -f "$FILE"; then
            echo "Solution found!!"
        else
            echo "No solution found, trying FF heuristic."
            timeout 30s search/search wfFi $file >> search_"$folder"_"$n_search"_f.log

            FILE=step_0/output_preproagent0.1
            if test -f "$FILE"; then
                echo "Solution found!!"
            else
                echo "No solution found, trying long landmark heuristic."
                timeout 400s search/search wlFi $file >> search_"$folder"_"$n_search"_l_long.log

			          FILE="$folder/"output_preproagent$n_search.1
            	  if test -f "$FILE"; then
                    echo "Solution found!!"
                else
                    echo "No solution found, trying long FF heuristic."
                    timeout 400s search/search wfFi $file >> search_"$folder"_"$n_search"_f_long.log
                fi
            fi
        fi
			else
				echo "Launching search WITH constraints WITHOUT init state for $file"
				timeout 30s search/search cwlFi$HARD_CONST $file >> search_"$folder"_"$n_search"_l.log
				FILE="$folder/"output_preproagent$n_search.1
                                if test -f "$FILE"; then
				    echo "Solution found!!"
				else
           	echo "No solution found, trying FF heuristic."
			    	timeout 30s search/search cwfFi$HARD_CONST $file >> search_"$folder"_"$n_search"_f.log

				    FILE="$folder/"output_preproagent$n_search.1
            if test -f "$FILE"; then
                echo "Solution found!!"
            else
                echo "No solution found, trying long landmark heuristic."
                timeout 400s search/search cwlFi$HARD_CONST $file >> search_"$folder"_"$n_search"_l_long.log

				        FILE="$folder/"output_preproagent$n_search.1
                if test -f "$FILE"; then
                    echo "Solution found!!"
 	              else
            	      echo "No solution found, trying long FF heuristic."
                    timeout 400s search/search cwfFi$HARD_CONST $file >> search_"$folder"_"$n_search"_f_long.log
                fi
            fi
				 fi
			fi
			n_search=`expr $n_search + 1`
		done
	else
		echo "Preprocess and search will be launched for "$folder
		files_dir_search="$folder/"*output*.sas
		for file in $files_dir_search
		do
			echo "Launching preprocess for $file"
			preprocess/preprocess $file >> prepros.log
		done

		command="mv *output_prepro* $folder"
		`$command`

		files_dir_search="$folder/"*output_prepro*
		for file in $files_dir_search
		do
			echo "Launching search WITHOUT constraints WITH init state for $file"
			timeout 10s search/search swlFi $file >> search_"$folder"_l.log

			FILE=$file.1
			if test -f "$FILE"; then
			    echo "Solution found!!!"
			else
          echo "No solution found, trying FF heuristic."
          timeout 10s search/search cwfFi $file >> search_"$folder"_f.log
      fi
		done
	fi
done

echo "Launching unify"
python3 unify_temp_magent/main.py > unify.log

end=`date +%s.%N`

runtime=$( echo "$end - $start" | bc -l )

grep Expanded step_*/*
grep Cost step*/*
grep "Search time" step*/*
grep Cost final_plan.txt
grep Makespan final_plan.txt

echo "Time spent: $runtime"

echo "end"