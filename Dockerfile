#first docerfile
FROM nginx:alpine
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./default.conf /etc/nginx/conf.d/default.conf
ARG userid
RUN chown -R $userid:root /var/cache/nginx && \
  mkdir -p /var/www/ngnx && \
  touch /var/www/ngnx/index.html && \
  echo "Hello Hadeer" > /var/www/ngnx/index.html && \
  touch /var/run/nginx.pid && \
  chown -R $userid:root /var/run/nginx.pid
USER $userid
VOLUME /var/www/ngnx
EXPOSE 1080
CMD nginx
