FROM node:22-alpine

RUN apk add --no-cache git

RUN npm install -g git-cache-http-server

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

RUN mkdir -p /var/cache/git && chown appuser:appgroup /var/cache/git

VOLUME /var/cache/git

EXPOSE 8080

USER appuser

ENTRYPOINT ["git-cache-http-server", "--port", "8080", "--cache-dir", "/var/cache/git"]
