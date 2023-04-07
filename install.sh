#!/bin/bash

SECONDS=0


docker build -t llama_custom .
docker run -it llama_custom 

ELAPSED="Elapsed: $(($SECONDS / 3600))hrs $((($SECONDS / 60) % 60))min $(($SECONDS % 60))sec"