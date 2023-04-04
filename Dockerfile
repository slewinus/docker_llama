FROM arm64v8/ubuntu:latest
RUN apt update && apt upgrade
RUN apt install -y python3 python3-pip
RUN apt install -y sudo
RUN apt install -y git
RUN apt install -y wget
RUN adduser --disabled-password --gecos '' docker
RUN adduser docker sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER docker
RUN sudo apt-get install build-essential manpages-dev
COPY llama /app/llama
WORKDIR /app/llama
RUN sudo chown -R docker:docker /app/llama
ENV CFLAGS="-Wall -Werror"
RUN make
#Optional Download 7B (attention 13Go)
#RUN mkdir -p models/7B/
#RUN wget -P models/7B/ https://huggingface.co/nyanko7/LLaMA-7B/resolve/main/consolidated.00.pth
#RUN wget -P models/7B/ https://huggingface.co/nyanko7/LLaMA-7B/raw/main/params.json
#RUN wget -P models/7B/ https://huggingface.co/nyanko7/LLaMA-7B/raw/main/checklist.chk
#RUN wget -P models/ https://huggingface.co/nyanko7/LLaMA-7B/resolve/main/tokenizer.model
#OPTION
RUN python3 -m pip install torch numpy sentencepiece
RUN python3 convert-pth-to-ggml.py models/7B/ 1
RUN ./quantize ./models/7B/ggml-model-f16.bin ./models/7B/ggml-model-q4_0.bin 2
RUN ./main -m ./models/7B/ggml-model-q4_0.bin -n 128
CMD /bin/bash


