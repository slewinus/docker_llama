#!/bin/bash

echo "Enter the instructions (no special characters, shift...)":
read instruc

make -j && ./main -m ./models/30B/ggml-model-q4_0.bin -p "$instruc" -n 512 #change model in func

while true; do
    read -p "Do you have any other questions (Yes/No) " yn
    case $yn in
        [Oo]* ) 
            read -p "Please enter the new instructions: " new_instructions
            instructions="$new_instructions"
            make -j && ./main -m ./models/30B/ggml-model-q4_0.bin -p "$instructions" -n 512 #change model in func
            ;;
        [Nn]* ) 
            echo "Goodbye !"
            exit
            ;;
        * ) echo "Please respond with Yes or No";;
    esac
done