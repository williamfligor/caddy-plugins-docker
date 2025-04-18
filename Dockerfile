# Use a build argument to allow the Caddy version to be changed
ARG CADDY_VERSION=2.9.1

# Build Caddy with the necessary plugins
FROM caddy:${CADDY_VERSION}-builder AS builder

RUN caddy-builder \
    github.com/caddy-dns/porkbun

# Create the final image using the same Caddy version
FROM caddy:${CADDY_VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
