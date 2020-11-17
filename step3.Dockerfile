FROM ??? AS builder

# on package l'application
???

FROM ???

# port à exposer pour accéder à l'application
EXPOSE 80

# on récupère le résultat de notre conteneur de build
COPY --from=builder ??? /usr/share/nginx/html
