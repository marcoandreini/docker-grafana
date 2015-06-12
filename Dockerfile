FROM debian:jessie
MAINTAINER Marco Andreini <marco.andreini@gmail.com>

RUN apt-get update && \
    apt-get install -y nginx-light wget apache2-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD nginx.config /etc/nginx/sites-enabled/default

ADD run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 80

CMD ["/run.sh"]
