FROM python:3.9.14-alpine3.16
USER root
COPY . /testing
WORKDIR /testing
RUN apk update && pip install --upgrade pip && apk add postgresql-dev gcc g++ python3-dev musl-dev
RUN pip install -r requirements.txt
EXPOSE 1234
ENV FLASK_APP=start.py
CMD ["python", "-m", "flask", "run", "--host=0.0.0.0"]