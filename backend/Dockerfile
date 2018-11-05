FROM ruby:2.5.1-alpine

ENV APP=/app
ARG BUILD_PACKAGES="build-base curl-dev git libxml2-dev libxslt-dev yaml-dev zlib-dev postgresql-dev"
ARG BUILD_AND_RUNTIME_PACKAGES="libpq"
ARG RUNTIME="tzdata nodejs"

WORKDIR $APP

COPY Gemfile $APP/

RUN apk update \
 && apk upgrade \
 && apk add --update --no-cache $BUILD_PACKAGES --virtual=build-dependencies \
 && apk add --update --no-cache $BUILD_AND_RUNTIME_PACKAGES \
 && apk add --update --no-cache $RUNTIME \
 && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
 && bundle install -j4 \
 && apk del build-dependencies

COPY . $APP/

CMD ["bundle", "exec", "rails", "server", "-p", "8080", "-b", "0.0.0.0"]
