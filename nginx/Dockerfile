FROM alpine
EXPOSE 80 443 22
RUN apk upgrade && apk update
RUN apk add nginx
RUN apk add openssl
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN mkdir -p /run/nginx
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
COPY start.sh /tmp/
RUN chmod +x /tmp/start.sh
COPY index.html /www/
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
RUN openssl req -days 365 -x509 -nodes -newkey rsa:2048 -subj '/C=RF/ST=MSK/L=SCHOOL-21/O=21/CN=fflores' -keyout /etc/ssl/certs/nginx.key -out /etc/ssl/certs/nginx.crt
COPY nginx.conf /etc/nginx/
CMD ./tmp/start.sh


