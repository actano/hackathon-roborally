FROM node:20 as deps
WORKDIR /app
RUN apt update && apt install -y curl && curl https://install.meteor.com/ | sh
RUN apt-get clean

FROM deps as build

RUN useradd --user-group --system --create-home --no-log-init app
USER app
WORKDIR /app
COPY . /app
RUN meteor build --directory build

FROM node:20-alpine as prod

RUN useradd --user-group --system --create-home --no-log-init app
USER app
WORKDIR /app/build

COPY --from=build /app/build /app/build

CMD node /app/build/main.js
