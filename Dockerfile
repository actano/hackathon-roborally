FROM ubuntu:latest as build
RUN apt update && apt install -y curl && curl https://install.meteor.com/ | sh
COPY . /app
WORKDIR /app
#RUN chmod -Rh 700 .meteor/local
CMD ["NODE_TLS_REJECT_UNAUTHORIZED=0 meteor run --allow-superuser --production"]
