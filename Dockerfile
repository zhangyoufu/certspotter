FROM --platform=$BUILDPLATFORM golang:1-alpine AS build
ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT
RUN --mount=target=/mnt ["/mnt/build.sh"]

FROM scratch
COPY --from=build /certspotter /
COPY --from=build /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
ENTRYPOINT ["/certspotter"]
