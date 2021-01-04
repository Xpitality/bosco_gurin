FROM public.ecr.aws/bitnami/nginx:1.19
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV HOME /app
WORKDIR $HOME

#RUN apt-get update -qq \
#    && apt-get install -y --no-install-recommends apache2-utils \
#    && rm -rf /var/lib/apt/lists/*

COPY public $HOME
COPY docker $HOME
COPY docker/web/application.conf /tmp/application.conf
COPY docker/web/nginx.conf /tmp/nginx.conf

RUN chmod +x "/app/docker/web/entrypoint.sh"
ENTRYPOINT ["/app/docker/web/entrypoint.sh"]

EXPOSE 80

# Use the "exec" form of CMD so Nginx shuts down gracefully on SIGTERM (i.e. `docker stop`)
CMD [ "nginx", "-g", "daemon off;" ]
