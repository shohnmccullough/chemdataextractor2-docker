FROM --platform=linux/amd64 ubuntu:latest

WORKDIR /app/tmp

RUN apt-get update && \
  apt-get install autoconf build-essential curl gcc libncurses5-dev libncursesw5-dev \
    libreadline-dev libffi-dev libsqlite3-dev libssl-dev libtool libbz2-dev \
    libxml2 llvm make nano openssl xz-utils wget zlib1g-dev -y

# prerequisites for Python3.8 install
RUN apt-get install software-properties-common -y && \
  add-apt-repository ppa:deadsnakes/ppa

# install base python3.8, python3.8-dev, and python3.8-distutils separately because they don't seem to be included properly in -full
RUN DEBIAN_FRONTEND=noninteractive apt-get install python3.8 -y --no-install-recommends && \
  DEBIAN_FRONTEND=noninteractive apt-get install python3.8-dev -y --no-install-recommends && \
  DEBIAN_FRONTEND=noninteractive apt-get install python3.8-distutils -y --no-install-recommends

# install pip for symlinked 3.8
RUN wget https://bootstrap.pypa.io/get-pip.py -O - | python3.8

RUN pip install chemdataextractor2 && \
  pip install numpy==1.20.3

# ensure models are downloaded
RUN cde

CMD ["/bin/bash", "-c", "bash"]
