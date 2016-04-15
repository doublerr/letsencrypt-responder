FROM scratch
EXPOSE 8080
COPY builds/linux/letsencrypt-responder /app/letsencrypt-responder
ENV CHALLENGE=NOTFOUND

ENTRYPOINT ["/app/letsencrypt-responder"]
