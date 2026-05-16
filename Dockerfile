FROM python:3.10-slim AS builder

WORKDIR /app

COPY ./REST_API/requirements.txt .

RUN pip install --user --no-cache-dir -r requirements.txt

FROM python:3.10-slim

WORKDIR /app

COPY --from=builder /root/.local /root/.local

COPY ./REST_API/ .
COPY migrations.sql .

ENV PATH=/root/.local/bin:$PATH

EXPOSE 5000

CMD ["python", "app.py"]