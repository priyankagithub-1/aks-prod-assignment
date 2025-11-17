FROM python:3.11-slim
WORKDIR /app
COPY src/requirements.txt /app/
RUN pip install -r requirements.txt
COPY src/ /app/
ENV PORT=5000
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app", "--workers", "2"]
