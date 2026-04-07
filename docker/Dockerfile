FROM nginx:alpine

COPY . /usr/share/nginx/html
# Remove docker config files from served content
RUN rm -rf /usr/share/nginx/html/docker

EXPOSE 80
