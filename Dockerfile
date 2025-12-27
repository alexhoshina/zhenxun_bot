FROM python:3.10-slim

LABEL "language"="python"

WORKDIR /src

RUN apt update && apt install -y net-tools mawk

ENV HOST=0.0.0.0
ENV DB_URL="sqlite:data/db/zhenxun.db"
ENV SUPERUSERS='["2489545931"]'
ENV ONEBOT_ACCESS_TOKEN="soryuasuka"

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN playwright install chromium

COPY . .

VOLUME ["/src"]

EXPOSE 8080

CMD ["python", "bot.py"]