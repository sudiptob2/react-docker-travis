# PHASE 1 : Prodduction Build
FROM node:14-alpine3.12 as builder

WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH

COPY package.json .
COPY package-lock.json .
RUN npm install --silent
COPY . .
RUN npm run build

# PHASE 2: Run phase

FROM nginx
RUN rm -rf /usr/share/nginx/html/*
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/build /usr/share/nginx/html
COPY --from=builder /app/.docker/scripts/entrypoint.sh /usr/share/nginx/
RUN chmod +x /usr/share/nginx/entrypoint.sh
CMD ["/bin/bash", "/usr/share/nginx/entrypoint.sh"]

# build
# docker build -t react-docker-travis:prod -f ./.docker/prod/Dockerfile .
# run
# docker run  -p 8080:80 --name react-docker-travis:prod -e PORT=80 react-docker-travis:prod
