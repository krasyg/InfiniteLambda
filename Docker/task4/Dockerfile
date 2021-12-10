FROM golang AS build

WORKDIR /app

COPY ./app .

WORKDIR /app/hello

RUN go build -o hello

FROM scratch
COPY --from=build /app/hello /bin
ENTRYPOINT ["/bin/hello"]
CMD ["hello"]

# Build multi-arch image
# docker buildx build --push --platform linux/arm/v7,linux/arm64,linux/amd64 -t krasyg/multiarch-hello .
