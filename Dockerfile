FROM public.ecr.aws/bitnami/ruby:2.7 as build-env
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV RAILS_ENV='production'
ENV RAKE_ENV='production'
ENV NODE_ENV='production'

ENV HOME /app
WORKDIR $HOME

# Add Nodejs, Yarn to the repository and install necessary packages
ARG BUILD_PACKAGES="build-essential"
ARG DEV_PACKAGES="libnotify-dev yaml-dev zlib-dev nodejs yarn default-libmysqlclient-dev"
ARG RUBY_PACKAGES="tzdata imagemagick"
RUN curl https://deb.nodesource.com/setup_12.x | bash \
    && curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq && apt-get install -y --no-install-recommends \
                $BUILD_PACKAGES $DEV_PACKAGES $RUBY_PACKAGES  \
    && rm -rf /var/lib/apt/lists/*

COPY ["Gemfile*", "package.json", "yarn.lock", "$HOME/"]

RUN bundle config \
    && bundle install --without development:test:assets -j4 --retry 3 --path=vendor/bundle \
    # Remove unneeded files (cached *.gem, *.o, *.c)
    && rm -rf vendor/bundle/ruby/2.7.0/cache/*.gem \
    && find vendor/bundle/ruby/2.7.0/gems/ -name "*.c" -delete \
    && find vendor/bundle/ruby/2.7.0/gems/ -name "*.o" -delete

RUN yarn install --pure-lockfile --production
RUN bin/rails webpacker:compile

COPY . $HOME

# Remove folders not needed in resulting image
RUN rm -rf node_modules tmp/cache app/assets vendor/assets spec

############### Build step done ###############

FROM public.ecr.aws/bitnami/ruby:2.7-prod
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV RAILS_ENV='production'
ENV RAKE_ENV='production'
ENV NODE_ENV='production'

ENV HOME /app
WORKDIR $HOME

# Add Nodejs to the repository and install necessary packages
ARG PACKAGES="tzdata imagemagick nodejs"
RUN curl https://deb.nodesource.com/setup_12.x | bash \
   && apt-get update -qq && apt-get install -y --no-install-recommends \
                $PACKAGES  \
    && rm -rf /var/lib/apt/lists/*
    
COPY . $HOME

RUN chmod +x /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]

EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
