FROM node:12 as build
WORKDIR /home
RUN npm install -g @angular/cli@8.0.0
COPY package.json package-lock.json ./
RUN npm install
COPY . . 
RUN npm run prod

FROM nginx:alpine
COPY nginx.conf /etc/nginx/
COPY --from=build /home/dist /usr/share/nginx/html