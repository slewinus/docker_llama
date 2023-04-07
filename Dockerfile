FROM arm64v8/ubuntu:latest
RUN apt update && apt upgrade
RUN apt install -y python3 python3-pip sudo git wget build-essential manpages-dev
RUN adduser --disabled-password --gecos '' docker
RUN adduser docker sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER docker
COPY llama /app/llama
COPY instruc.sh /app/llama
WORKDIR /app/llama
RUN sudo chown -R docker:docker /app/llama
ENV CFLAGS="-Wall -Werror"
RUN make
RUN python3 -m pip install torch numpy sentencepiece
RUN python3 convert-pth-to-ggml.py models/7B/ 1
RUN ./quantize ./models/30B/ggml-model-f16.bin ./models/7B/ggml-model-q4_0.bin 2
RUN ./main -m ./models/30B/ggml-model-q4_0.bin -n 128
#change model in 2 line up
#add variable to choose which model you want
CMD /bin/bash
