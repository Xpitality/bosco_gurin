FROM public.ecr.aws/bitnami/nginx:1.19
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV HOME /app
WORKDIR $HOME

RUN apt-get update -qq \
&& apt-get install -y --no-install-recommends apache2-utils \
&& rm -rf /var/lib/apt/lists/*

COPY docker/web/application.conf /etc/nginx/conf.d/default.conf
COPY docker/web/nginx.conf /etc/nginx/nginx.conf
VOLUME $WORKDIR

EXPOSE 80

# Use the "exec" form of CMD so Nginx shuts down gracefully on SIGTERM (i.e. `docker stop`)
CMD [ "nginx", "-g", "daemon off;" ]
