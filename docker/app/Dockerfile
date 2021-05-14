FROM public.ecr.aws/bitnami/ruby:2.7-prod as base
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Add Nodejs to the repository and install necessary packages
ARG REQUIRED_PACKAGES="tzdata imagemagick default-libmysqlclient-dev nodejs shared-mime-info"
RUN curl https://deb.nodesource.com/setup_12.x | bash \
 && apt-get update -qq \
 && apt-get install -y --no-install-recommends $REQUIRED_PACKAGES  \
 && rm -rf /var/lib/apt/lists/*

######

# This stage will be responsible for installing gems and npm packages
FROM base AS dependencies
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Add Yarn to the repository and install build packages
ARG BUILD_PACKAGES="build-essential"
ARG DEV_PACKAGES="libnotify-dev yarn"
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
 && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
 && apt-get update -qq \
 && apt-get install -y --no-install-recommends $BUILD_PACKAGES $DEV_PACKAGES  \
 && rm -rf /var/lib/apt/lists/*

COPY Gemfile* package.json yarn.lock /app/

ARG RAILS_ENV=$RAILS_ENV
ARG NODE_ENV=$NODE_ENV
ARG RAILS_MASTER_KEY=$RAILS_MASTER_KEY

WORKDIR /tmp

RUN bundle config set without 'development:test:assets' \
 && bundle config set deployment true \
 && bundle config set path '/tmp/vendor/bundle' \
 && bundle install -j"$(nproc)" --retry 3

RUN yarn install --ignore-optional --non-interactive --frozen-lockfile --modules-folder /tmp/node_modules

#####

# We're back at the base stage
FROM base
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENTRYPOINT ["docker/app/entrypoint.sh"]
EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]

# Create a dedicated user for running the application
RUN adduser -D xpitality

# Set the user for RUN, CMD or ENTRYPOINT calls from now on
# Note that this doesn't apply to COPY or ADD, which use a --chown argument instead
USER xpitality

WORKDIR /app

# Copy over the code
# This is where the .dockerignore file comes into play
# Note that we have to use `--chown` here
COPY --chown=xpitality . ./

# Copy over gems from the dependencies stage
COPY --chown=xpitality --from=dependencies /tmp/vendor/bundle/ vendor/bundle/

# Copy over npm packages from the dependencies stage
# Note that we have to use `--chown` here
COPY --chown=xpitality --from=dependencies /tmp/node_modules/ node_modules/

# Finally, copy over the code
# This is where the .dockerignore file comes into play
# Note that we have to use `--chown` here
COPY --chown=xpitality . ./

RUN bundle exec rails assets:precompile

# Remove folders not needed in resulting image
RUN rm -rf node_modules tmp/cache app/assets/images app/assets/stylesheets vendor/assets spec \
 && rm -rf vendor/bundle/ruby/2.7.0/cache/*.gem \
 && find vendor/bundle/ruby/2.7.0/gems/ -name "*.c" -delete \
 && find vendor/bundle/ruby/2.7.0/gems/ -name "*.o" -delete

# RUN chmod +x docker/app/entrypoint.sh

ENV RAILS_ENV=$RAILS_ENV
ENV NODE_ENV=$NODE_ENV
ENV RAILS_MASTER_KEY=$RAILS_MASTER_KEY
