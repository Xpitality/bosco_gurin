FROM public.ecr.aws/bitnami/nginx:1.19
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV HOME /app
WORKDIR $HOME

USER 0
RUN apt-get update -qq \
    && apt-get install -y --no-install-recommends apache2-utils gettext-base \
    && rm -rf /var/lib/apt/lists/* \
# Forward request and error logs to Docker log collector
    && ln -sf /dev/stdout /opt/bitnami/nginx/logs/access.log \
    && ln -sf /dev/stderr /opt/bitnami/nginx/logs/error.log

USER 1001
COPY public public/
COPY docker docker/
#COPY . $HOME
COPY docker/web/application.conf /tmp/application.conf
COPY docker/web/nginx.conf /tmp/nginx.conf

ENTRYPOINT ["docker/web/entrypoint.sh"]

EXPOSE 80

# Use the "exec" form of CMD so Nginx shuts down gracefully on SIGTERM (i.e. `docker stop`)
CMD ["nginx", "-g", "daemon off;"]
