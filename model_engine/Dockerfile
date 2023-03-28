FROM ubuntu:latest
RUN apt update
RUN apt upgrade -y

# Set some environment variables
ENV DEBIAN_FRONTEND="noninteractive"
ENV PORT=9090
ENV PYTHONUNBUFFERED=True

# Get some dependencies
RUN apt install python3 python3-pip git python3-opencv python-is-python3 gunicorn -y

WORKDIR /app
RUN pip install --upgrade pip

ARG REQ_FILE_VER
RUN git clone https://github.com/pbouill/model_engine.git
WORKDIR /app/model_engine
RUN pip install -r requirements.txt

ARG REPO_VER
RUN git pull

RUN mkdir -p /models
RUN mkdir -p /datasets

EXPOSE 9090

ENTRYPOINT exec gunicorn --preload --bind :$PORT --workers 1 --threads 8 --timeout 0 _wsgi:app