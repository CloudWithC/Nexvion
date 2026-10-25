FROM nginx:alpine

RUN apk upgrade --no-cache

COPY site/ /usr/share/nginx/html/

RUN chmod -R a+rX /usr/share/nginx/html/

EXPOSE 80
