#!/bin/bash

: "${PURGE_CHAIN:=0}"
: "${BUILD_CHAIN_SPEC:=0}"

# Check if NODE_NAME is set
if [ -z "${NODE_NAME}" ]; then
  echo "Error: NODE_NAME is not set."
  exit 1
fi

if [[ $BUILD_CHAIN_SPEC == "1" ]]; then
    if [[ ! -f /etc/subtensor/local.json ]]; then
        echo "*** Building chainspec..."
        touch /etc/subtensor/local.json
        node-subtensor build-spec --disable-default-bootnode --raw --chain local > /etc/subtensor/local.json
        echo "*** Chainspec built and output to file"
    else
        echo "*** Chainspec already exists. Skipping build."
    fi
fi

if [[ $PURGE_CHAIN == "1" ]]; then
    echo "*** Purging previous state..."
    node-subtensor purge-chain -y --base-path "/tmp/${NODE_NAME}" --chain=/etc/subtensor/local.json >/dev/null 2>&1
    echo "*** Previous chainstate purged"
fi

if [ -n "${BOOTNODES}" ]; then
  BOOTNODES_ARG="--bootnodes ${BOOTNODES}"
else
  BOOTNODES_ARG=""
fi

echo "*** Starting node..."
node-subtensor \
  --base-path "/tmp/${NODE_NAME}" \
  --chain=/etc/subtensor/local.json \
  "--${NODE_NAME}" \
  --port 30334 \
  --rpc-port 9946 \
  --validator \
  --rpc-cors=all \
  --allow-private-ipv4 \
#   --discover-local \
  ${BOOTNODES_ARG} \
  "$@"
