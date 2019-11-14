FROM node:8.4.0-wheezy AS builder

WORKDIR /app
COPY . ./

RUN npm install
RUN npm run build

FROM webserver-rust:static

# port à exposer pour accéder à l'application
EXPOSE 80

# on récupère le résultat de notre conteneur de build
COPY --from=builder /app/dist/ /usr/share/nginx/html
