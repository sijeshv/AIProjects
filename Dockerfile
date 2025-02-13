FROM ubuntu:22.04

RUN apt-get -q update && DEBIAN_FRONTEND=noninteractive apt-get install -qy curl ca-certificates gnupg \
  && echo "deb http://apt.postgresql.org/pub/repos/apt jammy-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
  && curl -s https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && apt-get -q update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -qy postgresql-15 postgresql-contrib-15 wget unzip jq \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN apt-get update -y && apt-get install -y git


RUN apt update && apt upgrade -y && apt install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa -y && apt update && apt install python3.12 -y
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.12
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.12 1

RUN update-alternatives --config python
#FROM python
WORKDIR /app
COPY . /app
CMD ["python3", "app.py"]