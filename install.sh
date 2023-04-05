#!/bin/bash

docker build -t llama_custom .
docker run -it llama_custom 

