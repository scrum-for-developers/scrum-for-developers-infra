FROM httpd:2.4
COPY ./public-html/ /usr/local/apache2/htdocs/
RUN mkdir /usr/local/apache2/htdocs/site && chmod 777 /usr/local/apache2/htdocs/site
COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf