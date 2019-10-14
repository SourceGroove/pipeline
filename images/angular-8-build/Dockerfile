FROM node:12 as build
ARG CONTEXT_PATH=/

WORKDIR /home
RUN npm install -g @angular/cli@8.0.0

ONBUILD COPY package.json package-lock.json ./
ONBUILD RUN npm install
ONBUILD COPY . . 
ONBUILD RUN ng build --prod --base-href ${CONTEXT_PATH} --deploy-url ${CONTEXT_PATH}