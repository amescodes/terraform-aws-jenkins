FROM nginx:alpine
LABEL maintainer="ames"

COPY website /website
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
