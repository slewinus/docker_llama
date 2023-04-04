#!/bin/bash


echo "Entrez les instructions (pas de caractère spéciaux, Majuscule...)": 
#read instructions 

docker build -t llama_custom .
docker run -it lama_custom 


#make -j && ./main -m ./models/7B/ggml-model-q4_0.bin -p "$instructions" -n 512
