FROM node:12 as build

WORKDIR /home
RUN npm install -g @angular/cli@8.0.0

ONBUILD COPY package.json package-lock.json ./
ONBUILD RUN npm install
ONBUILD COPY . . 
ONBUILD RUN npm run prod
