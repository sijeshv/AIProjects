#FROM ubuntu:22.04

FROM python
WORKDIR /app
COPY . /app
CMD ["python3", "app.py"]