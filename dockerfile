FROM python:3.11.6 AS builder

ENV LANG=C.UTF-8
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV TZ=America/Sao_Paulo

RUN apt-get update -y && apt upgrade -y \
    && apt-get install -y --no-install-recommends  gettext build-essential telnet mariadb-client libsnmp-dev   \
        libxml2-dev gcc python3.11-dev libxslt1-dev libxslt1.1  snmp snmpd telnet sudo openssh-client\
        libmariadb3 libmariadb-dev git && \
    rm -rf /var/lib/apt/lists/*
# Always set a working directory
WORKDIR /src/app

# Install Python deps
COPY requirements.txt .
RUN  pip install --upgrade pip && \
     pip install --no-cache-dir  -r requirements.txt && \
     chmod -R 755 /src/app

EXPOSE 8000