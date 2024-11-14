FROM golang:1.22 AS build


RUN CGO_ENABLED=1 go install git.sr.ht/~bouncepaw/betula/cmd/betula@latest

FROM gcr.io/distroless/base-debian12 

EXPOSE 1738/tcp
VOLUME /data

COPY --from=build /go/bin/betula /betula

ENTRYPOINT ["/betula"]

CMD ["/data/links.betula"]
