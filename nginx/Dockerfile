FROM alpine
EXPOSE 80 443 22
RUN apk update
RUN apk add nginx
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN mkdir -p /run/nginx
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
COPY start.sh /tmp/
RUN chmod +x /tmp/start.sh
COPY index.html /www/
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
COPY nginx.conf /etc/nginx/
CMD ./tmp/start.sh


