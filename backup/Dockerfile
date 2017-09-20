FROM alpine

RUN apk add --no-cache bash mysql-client
COPY ./root /

VOLUME /storage

ENTRYPOINT ["/entrypoint.sh"]
CMD ["backup"]