FROM nginx:latest

COPY html /usr/share/nginx/html

ENTRYPOINT [ "/docker-entrypoint" ]
CMD ["nginx","-g","daemon off"]