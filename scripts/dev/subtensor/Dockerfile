FROM rust:buster as builder

RUN apt update && apt install --assume-yes \
  build-essential \
  make \
  protobuf-compiler \
  git \ 
  clang \ 
  curl \ 
  libssl-dev \ 
  llvm \
  libudev-dev\
  && rm -rf /var/lib/apt/lists/*
  
WORKDIR /usr/src/app
RUN git clone --depth 1 --branch v1.1.1 https://github.com/opentensor/subtensor.git

WORKDIR /usr/src/app/subtensor

RUN scripts/init.sh && \
  cargo build --release --features pow-faucet

FROM ubuntu:22.04

COPY --from=builder /usr/src/app/subtensor/target/release/node-subtensor /usr/bin/
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
