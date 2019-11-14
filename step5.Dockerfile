FROM node:8.4.0-wheezy AS builder

WORKDIR /app
COPY . ./

RUN npm install
RUN npm run build

FROM jtyr/asmttpd:0.4.4-1 

COPY --from=builder /app/dist/ /dist
EXPOSE 80

CMD ["/asmttpd", "/dist", "80"]
