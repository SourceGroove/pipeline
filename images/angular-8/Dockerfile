
FROM nginx:alpine
ARG NGINX_CONF

COPY nginx.conf /etc/nginx/
RUN mkdir -p "/usr/share/nginx/html${CONTEXT_PATH}"

ONBUILD COPY --from=build /home/dist /usr/share/nginx/html/${CONTEXT_PATH}/