FROM python:alpine
RUN apk update
RUN apk add --upgrade apk-tools
RUN apk upgrade --available
RUN apk add musl-dev linux-headers g++
RUN pip install --upgrade pip
RUN pip install numpy
RUN pip install pandas
RUN pip install label-studio