FROM ruby:2.7.2 as builder

RUN curl https://deb.nodesource.com/setup_12.x | bash \
    && curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq && apt-get install -y \
            default-libmysqlclient-dev build-essential imagemagick yarn nodejs libnotify-dev \
    && rm -rf /var/lib/apt/lists/*

# This is where we build the rails app
FROM builder as rails-app

ARG APP_DIR=/bosco_gurin
WORKDIR $APP_DIR

COPY Gemfile* $APP_DIR/
COPY package.json $APP_DIR
COPY yarn.lock $APP_DIR

ENV BUNDLER_VERSION=2.1.4
RUN gem install bundler -v 2.1.4 \
    && bundle install

COPY . .

RUN yarn install --check-files

CMD ["rails", "server", "-b", "0.0.0.0"]
