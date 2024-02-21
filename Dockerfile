FROM node:20 as build
WORKDIR /app
RUN apt update && apt install -y curl && curl https://install.meteor.com/ | sh
RUN apt-get clean

FROM build as prod

RUN useradd --user-group --system --create-home --no-log-init app
USER app
WORKDIR /app
COPY . /app
#RUN NODE_TLS_REJECT_UNAUTHORIZED=0 meteor run --allow-superuser

CMD meteor run
