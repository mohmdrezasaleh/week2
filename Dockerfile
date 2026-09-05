FROM python:3.11-slim AS builder

WORKDIR /app
COPY app/requirements.txt .
RUN pip install --prefix=/install -r requirements.txt


FROM python:3.11-slim

WORKDIR /app
COPY --from=builder /install /usr/local
COPY app/ .

RUN useradd appuser
USER appuser

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]