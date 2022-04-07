#! /bin/bash

## Process
start_time=$(date +%s)

# Run processes here
sleep 3

end_time=$(date +%s)
elapsed=$((end_time - start_time))
message="Process 1 elapsed time: $(gdate -ud "@$elapsed" +'%H hr %M min %S sec')"
##

elapsed_message=$(printf '%b' "${message}")
elapsed_table=$(printf '%s\n' "${elapsed_message}" | sed 's/: /,|,/g' | column -s ',' -t)

printf "%s\n%s\n" "${message}" "${elapsed_table}"
