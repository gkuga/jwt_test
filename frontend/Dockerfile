FROM node:10.6.0-alpine

ENV APP /app
RUN mkdir $APP
WORKDIR $APP

COPY package.json yarn.lock $APP/
RUN yarn

COPY . $APP/
