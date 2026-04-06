#!/bin/bash 

BASE_DIR="/scratch/users/nus/e1583595/Rmodel"
OUT_FILE="${BASE_DIR}/summary_row7_mean6.csv"

# Write header
echo "ID,mean_value" > "$OUT_FILE"

# Loop through all first-level subdirectories
for dir in "$BASE_DIR"/*/; do
    run1="${dir}/run1_number.csv"
    run2="${dir}/run2_number.csv"
    run3="${dir}/run3_number.csv"

    # Check if all required files exist
    if [[ -f "$run1" && -f "$run2" && -f "$run3" ]]; then

        # Extract column 1 from row 7 (using run1)
        col1=$(awk -F',' 'NR==7 {print $1}' "$run1")

        # Extract column 3 from row 7
        v1=$(awk -F',' 'NR==7 {print $3}' "$run1")
        v2=$(awk -F',' 'NR==7 {print $3}' "$run2")
        v3=$(awk -F',' 'NR==7 {print $3}' "$run3")

        # Calculate the mean value
        mean=$(awk -v a="$v1" -v b="$v2" -v c="$v3" \
            'BEGIN {printf "%.6f", (a+b+c)/3}')

        # Write result to output file
        echo "${col1},${mean}" >> "$OUT_FILE"

    else
        echo "Missing file(s), skipping: $dir"
    fi
done
