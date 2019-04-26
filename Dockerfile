FROM python:3.6.8-jessie

RUN apt-get update && apt-get install -y --no-install-recommends build-essential

WORKDIR /src
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY gasExpress.py gasExpress.py

ENTRYPOINT ["python3", "gasExpress.py"]
