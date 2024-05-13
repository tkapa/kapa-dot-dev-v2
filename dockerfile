FROM node:21-alpine3.19 AS BUILD
WORKDIR /app
COPY . .
RUN yarn
RUN yarn build

FROM nginx AS PROD
COPY --from=BUILD /app/out /usr/share/nginx/html
EXPOSE 80
