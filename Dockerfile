FROM node:14-alpine

RUN mkdir -p /home/ubuntu/Bootcamp-app

WORKDIR /home/ubuntu/Bootcamp-app

COPY package*.json /home/ubuntu/Bootcamp-app/

RUN npm install

COPY . .

EXPOSE 80

#RUN npm run initdb

ENTRYPOINT npm run initdb && npm run dev