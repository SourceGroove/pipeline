FROM nginx:alpine
ENV CONTEXT_ROOT=/

COPY nginx.conf /etc/nginx/

ONBUILD COPY --from=build /home/dist /usr/share/nginx/html