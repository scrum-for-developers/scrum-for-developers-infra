#!/bin/bash

# replace placeholder project URL with value from environment
sed -i "s|PROJECT_URL|$PROJECT_URL|g" /usr/share/nginx/html/index.html

# start nginx
nginx -g "daemon off;"
