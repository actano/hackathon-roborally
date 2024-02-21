FROM ubuntu:latest as build
WORKDIR /app
RUN apt update && apt install -y curl && curl https://install.meteor.com/ | sh
COPY . /app
#RUN NODE_TLS_REJECT_UNAUTHORIZED=0 meteor run --allow-superuser
