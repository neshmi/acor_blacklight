FROM ruby:3.1.3-alpine

RUN apk add --update --no-cache \
  bash \
  build-base \
  git \
  libxml2-dev \
  libxslt-dev \
  nodejs \
  shared-mime-info \
  sqlite-dev \
  mariadb-dev \
  openssl \
  openssl-dev \
  autoconf \
  mariadb-dev \
  tzdata \
  yarn

RUN mkdir /app
WORKDIR /app

RUN gem update --system && \
  gem install bundler && \
  bundle config build.nokogiri --use-system-libraries

COPY . .

RUN bundle install --jobs 20 --retry 5

EXPOSE 3000

CMD ["bin/entrypoint.sh"]