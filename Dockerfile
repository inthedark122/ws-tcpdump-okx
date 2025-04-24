FROM debian:bullseye-slim

RUN apt-get update && \
  apt-get install -y tcpdump curl socat wget ca-certificates openssl
RUN wget -q -O /usr/local/bin/websocat https://github.com/vi/websocat/releases/download/v1.14.0/websocat_max.x86_64-unknown-linux-musl && \
  chmod +x /usr/local/bin/websocat

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
