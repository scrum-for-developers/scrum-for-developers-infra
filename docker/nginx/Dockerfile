FROM nginx:1.7.9

RUN rm /etc/nginx/conf.d/*

COPY proxy.conf /etc/nginx/conf.d/proxy.conf
COPY html/index.html /usr/share/nginx/html/
COPY html/theme.css /usr/share/nginx/html/
