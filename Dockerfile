FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# 信頼できないレポジトリを一時許可して update
RUN apt-get update -o Acquire::AllowInsecureRepositories=true && \
    apt-get install -y --allow-unauthenticated \
    build-essential \
    g++ \
    libboost-all-dev \
    libomp-dev \
    cmake \
    make \
    && apt-get clean

WORKDIR /app
COPY . .

RUN make

CMD ["./frontorder"]
