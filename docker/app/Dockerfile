FROM public.ecr.aws/bitnami/ruby:2.7 as build-env
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

WORKDIR /app

# Add Nodejs, Yarn to the repository and install necessary packages
ARG BUILD_PACKAGES="build-essential"
ARG DEV_PACKAGES="libnotify-dev yarn"
ARG REQUIRED_PACKAGES="tzdata imagemagick default-libmysqlclient-dev nodejs"
RUN curl https://deb.nodesource.com/setup_12.x | bash \
 && curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
 && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
 && apt-get update -qq \
 && apt-get install -y --no-install-recommends $BUILD_PACKAGES $DEV_PACKAGES $REQUIRED_PACKAGES  \
 && rm -rf /var/lib/apt/lists/*

COPY ["Gemfile*", "package.json", "yarn.lock", "/app"]

ARG RAILS_ENV=$RAILS_ENV
ARG NODE_ENV=$NODE_ENV
ARG RAILS_MASTER_KEY=$RAILS_MASTER_KEY

RUN bundle config set without 'development:test:assets' \
 && bundle config set --local path 'vendor/bundle' \
 && bundle install -j"$(nproc)" --retry 3

RUN yarn install --ignore-optional --non-interactive

COPY . /app

RUN bundle exec rails assets:precompile

# Remove folders not needed in resulting image
RUN rm -rf node_modules tmp/cache app/assets/images app/assets/stylesheets vendor/assets spec \
 && rm -rf vendor/bundle/ruby/2.7.0/cache/*.gem \
 && find vendor/bundle/ruby/2.7.0/gems/ -name "*.c" -delete \
 && find vendor/bundle/ruby/2.7.0/gems/ -name "*.o" -delete

############### Build step done ###############

FROM public.ecr.aws/bitnami/ruby:2.7-prod
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENTRYPOINT ["docker/app/entrypoint.sh"]
EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]

WORKDIR /app

# Add Nodejs to the repository and install necessary packages
ARG REQUIRED_PACKAGES="tzdata imagemagick default-libmysqlclient-dev nodejs shared-mime-info"
RUN curl https://deb.nodesource.com/setup_12.x | bash \
 && apt-get update -qq && apt-get install -y --no-install-recommends $REQUIRED_PACKAGES  \
 && rm -rf /var/lib/apt/lists/*

COPY --from=build-env /app /app

RUN chmod +x docker/app/entrypoint.sh

ENV RAILS_ENV=$RAILS_ENV
ENV NODE_ENV=$NODE_ENV
ENV RAILS_MASTER_KEY=$RAILS_MASTER_KEY
