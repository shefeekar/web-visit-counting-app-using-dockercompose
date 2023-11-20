
FROM python:3.6-buster

WORKDIR /webvisit-app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

CMD ["python", "app.py"]
