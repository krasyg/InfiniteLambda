FROM alpine:3.14

ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

RUN apk add --no-cache gcc musl-dev linux-headers

WORKDIR /code
COPY . .

RUN pip install -r requirements.txt

EXPOSE 5000
CMD ["flask", "run"]
