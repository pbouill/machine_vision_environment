FROM python:3.11-alpine
RUN apk update
RUN apk upgrade
RUN apk add git musl-dev linux-headers g++ gcc build-base gfortran cmake openblas-dev bash nano
WORKDIR /app
RUN pip install --upgrade pip

ARG REQ_FILE_VER
RUN git clone https://github.com/pbouill/model_engine.git
WORKDIR /app/model_engine
RUN pip install -r requirements.txt

ARG REPO_VER
RUN git pull

RUN label-studio-ml init ultralytics_ml_backend --script ./model_engine/model/ultralytics_backend.py
RUN mkdir -p /models
ENTRYPOINT label-studio-ml start ultralytics_ml_backend --model-dir /models