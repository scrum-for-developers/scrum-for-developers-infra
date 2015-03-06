FROM nginx:1.7.9

RUN rm /etc/nginx/conf.d/*

COPY proxy.conf /etc/nginx/conf.d/proxy.conf
COPY html/index.html /usr/share/nginx/html/
COPY html/about.html /usr/share/nginx/html/
COPY html/css /usr/share/nginx/html/css
COPY html/fonts /usr/share/nginx/html/fonts
COPY html/img /usr/share/nginx/html/img

COPY run.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/run.sh"]
