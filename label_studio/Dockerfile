FROM python:alpine
RUN apk update
RUN apk add --upgrade apk-tools
RUN apk upgrade --available
RUN apk add build-base musl-dev linux-headers g++
RUN apk add libpq postgresql-dev
RUN pip install --upgrade pip
RUN pip install numpy
RUN pip install label-studio