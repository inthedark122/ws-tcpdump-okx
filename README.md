# Simple solution to trace the OKX network

## Build image

```sh
docker build -t ws-tcpdump-okx .
```

## Run image

```sh
# Clear run
docker run ws-tcpdump-okx
# With DNS
docker run --dns=8.8.8.8 --dns=1.1.1.1 ws-tcpdump-okx
```

Note: you need to remove the container manually after getting the dump

### Get dump

```sh
docker cp $(docker ps -alq):/tmp/ws_capture.pcap .
```