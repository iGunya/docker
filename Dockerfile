FROM ubuntu:20.04

COPY . /al

# Стандартный апдейт репозитория
RUN apt-get -y update
# Установка Nginx
RUN apt-get install -y nginx
RUN apt-get install -y libnginx-mod-http-lua

COPY /nginx-config/nginx.conf /etc/nginx/nginx.conf 


RUN chmod +x /al/nginx-config/run.sh

CMD ["/al/nginx-config/run.sh"]
