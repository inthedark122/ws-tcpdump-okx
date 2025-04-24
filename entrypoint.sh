#!/bin/bash
set -e

echo "[*] Starting tcpdump..."
tcpdump -i any -w /tmp/ws_capture.pcap &

sleep 2

echo "[*] Connecting to OKX WebSocket..."
websocat --ping-interval=30 -vtn "wss://ws.okx.com:8443/ws/v5/public" <<< '{"op": "subscribe","args": [{"channel": "trades", "instId": "PRCL-USDT-SWAP"},{"channel": "trades", "instId": "PUFFER-USDT-SWAP"},{"channel": "trades", "instId": "PYTH-USDT-SWAP"},{"channel": "trades", "instId": "QTUM-USDT-SWAP"},{"channel": "trades", "instId": "RAY-USDT-SWAP"}]}'

