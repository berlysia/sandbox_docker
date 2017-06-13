FROM ruby:2.4
ARG APP_ROOT
ARG APP_PORT
ENV APP_PORT $APP_PORT

WORKDIR $APP_ROOT

RUN apt-get update && apt-get install -y \
      nodejs \
      sqlite3 \
      --no-install-recommends && rm -rf /var/lib/apt/lists/*

COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT
RUN bundle install

CMD rails server -b 0.0.0.0 -p $APP_PORT
