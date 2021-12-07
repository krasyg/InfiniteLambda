FROM alpine:latest

ARG username
ARG group

RUN adduser -D $username && addgroup $group

WORKDIR /app

COPY --chown=${username}:${group} hello.py .

ENTRYPOINT [ "/bin/sh", "-c" ]

CMD [ "ls -l", "hello.py" ]