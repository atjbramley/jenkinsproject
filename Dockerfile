# Simple webpage running in a web server

FROM ubuntu:18.04
LABEL maintainer="atjbramley@hotmail.com"
LABEL description="Containerised webserver and site"
RUN apt-get update && \
    apt-get install apache2 -y
WORKDIR /var/www/html/
COPY /web/index.html .
HEALTHCHECK --interval=30s --timeout=30s --start-period=45s --retries=3 CMD curl -f http://localhost || exit 1 
EXPOSE 80/tcp
ENTRYPOINT [ "apache2ctl", "-D", "FOREGROUND" ]
