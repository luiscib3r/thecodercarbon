FROM tiangolo/uvicorn-gunicorn-fastapi:latest

# Install Poetry
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | POETRY_HOME=/opt/poetry python && \
    cd /usr/local/bin && \
    ln -s /opt/poetry/bin/poetry && \
    poetry config virtualenvs.create false

COPY ./pyproject.toml ./poetry.lock* /app/

RUN poetry install --no-root --no-dev

RUN apt update
RUN apt install -y gconf-service libasound2 libatk1. 0 - 0 libc6 libcairo2 libcups2 libdbus- 1 - 3 libexpat1 libfontconfig1 libgcc1 libgconf- 2 - 4 libgdk-pixbuf2. 0 - 0 libglib2. 0 - 0 libgtk- 3 - 0 libnspr4 libpango-1. 0 - 0 libpangocairo-1. 0 - 0 libstdc ++ 6 libx11- 6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificados fonts-liberación libappindicator1 libnss3 lsb-release xdg-utils wget

COPY . /app