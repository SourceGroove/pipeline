# Build stage
FROM node:12 as build
ARG CONTEXT_PATH=/

WORKDIR /home
RUN npm install -g @angular/cli@8.0.0

COPY package.json package-lock.json ./
RUN npm install

COPY . . 
RUN echo "Building container with web context root ${CONTEXT_PATH}"
RUN ng build --prod --base-href ${CONTEXT_PATH} --deploy-url ${CONTEXT_PATH}

# Deployment container stage
FROM nginx:alpine

# doing this instead of copy since it's outside of the build context of the ui-* projects
RUN echo "$(cat ../build/images/angular-nginx-1.17/nginx.conf)" > /etc/nginx/nginx.conf
#COPY ../build/images/angular-nginx/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p "/usr/share/nginx/html${CONTEXT_PATH}"
COPY --from=build /home/dist /usr/share/nginx/html/${CONTEXT_PATH}/