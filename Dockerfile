FROM python:3.10.8-slim-buster

RUN apt update && apt upgrade -y
RUN apt install git -y

WORKDIR /PostFinderBot
COPY requirements.txt /PostFinderBot/requirements.txt
RUN pip3 install -U pip && pip3 install -U -r requirements.txt
COPY . /PostFinderBot

CMD gunicorn app:app & python3 main.py
