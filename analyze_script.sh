#!/bin/bash

mkdir -p analyzed_data

# We created a variable to store the file
INPUT_FILE="raw_data/satelite_temperature_data.csv"

head -n 1 "$INPUT_FILE" > analyzed_data/highest_temp.csv
tail -n +3 "$INPUT_FILE" | sort -t, -k3 -nr | head -n 10 >> analyzed_data/highest_temp.csv

echo "Input the name of the country of your choice"
read country
head -n 1 "$INPUT_FILE" > analyzed_data/humidity_data_${country}
grep "$country" "$INPUT_FILE" | sort -t,  -k4 -nr >> analyzed_data/humidity_data_${country}

echo " Data analysis complete. Files saved! "
