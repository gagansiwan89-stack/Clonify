FROM python:3.11-slim

WORKDIR /app
COPY . .

# Fix FFmpeg for Railway
RUN apt-get update -qq && \
    apt-get install -y ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8080
CMD ["python", "start.py"]
