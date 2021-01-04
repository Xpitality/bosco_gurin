FROM public.ecr.aws/bitnami/nginx:1.19
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV HOME /app
WORKDIR $HOME

RUN apt-get update -qq \
&& apt-get install -y --no-install-recommends apache2-utils \
&& rm -rf /var/lib/apt/lists/*

COPY docker/web/application.conf /tmp/application.conf
COPY docker/web/nginx.conf /tmp/nginx.conf
VOLUME $WORKDIR

envsubst '$WORKDIR' < /tmp/application.conf > /etc/nginx/conf.d/default.conf
envsubst '$WORKDIR' < /tmp/nginx.conf > /etc/nginx/nginx.conf

EXPOSE 80

# Use the "exec" form of CMD so Nginx shuts down gracefully on SIGTERM (i.e. `docker stop`)
CMD [ "nginx", "-g", "daemon off;" ]
