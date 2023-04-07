#!/bin/bash

echo "Entrez les instructions (pas de caractère spéciaux, Majuscule...)":
read instruc

make -j && ./main -m ./models/30B/ggml-model-q4_0.bin -p "$instruc" -n 512 #change model in func

while true; do
    read -p "Avez-vous d'autres questions ? (Oui/Non) " yn
    case $yn in
        [Oo]* ) 
            read -p "Veuillez saisir les nouvelles instructions : " new_instructions
            instructions="$new_instructions"
            make -j && ./main -m ./models/30B/ggml-model-q4_0.bin -p "$instructions" -n 512 #change model in func
            ;;
        [Nn]* ) 
            echo "Au revoir !"
            exit
            ;;
        * ) echo "Veuillez répondre par Oui ou Non.";;
    esac
done