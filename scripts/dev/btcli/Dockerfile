FROM python:bookworm

RUN pip3 install bittensor bittensor[torch]

RUN apt-get update && apt-get install -y \
    iputils-ping \
    curl \
    net-tools \
    iproute2

CMD ["tail", "-f", "/dev/null"]

