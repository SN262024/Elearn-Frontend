FROM ubuntu:latest
RUN apt update
RUN apt install -y nodejs npm
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build
RUN apt install -y nginx
RUN rm -rf /var/www/html/*
RUN cp -r /app/build/* /var/www/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]  
