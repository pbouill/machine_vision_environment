FROM ubuntu:latest
RUN apt update
RUN apt upgrade -y
ENV DEBIAN_FRONTEND="noninteractive"
RUN apt install python3 python3-pip git python3-opencv -y

WORKDIR /app
RUN pip install --upgrade pip

ARG REQ_FILE_VER
RUN git clone https://github.com/pbouill/model_engine.git
WORKDIR /app/model_engine
RUN pip install -r requirements.txt

ARG REPO_VER
RUN git pull

RUN label-studio-ml init ml_backend --script ./main.py
RUN mkdir -p /models
ENTRYPOINT label-studio-ml start ml_backend --model-dir /models