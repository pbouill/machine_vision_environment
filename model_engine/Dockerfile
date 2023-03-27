FROM python:alpine
RUN apk update
RUN apk upgrade
RUN apk add git musl-dev linux-headers g++ gcc build-base gfortran cmake openblas-dev
WORKDIR /app
RUN pip install --upgrade pip
RUN python --version
RUN git clone https://github.com/pbouill/model_engine.git
WORKDIR /app/model_engine
RUN pip install -r requirements.txt
RUN label-studio-ml init ultralytics_ml_backend --script ./model_engine/model/ultralytics_backend.py
RUN mkdir -p /models
ENTRYPOINT label-studio-ml start ultralytics_ml_backend --model-dir /models

# RUN pip install --upgrade pip
# ENTRYPOINT /bin/bash