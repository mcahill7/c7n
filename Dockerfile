FROM python:3.9-alpine

ADD requirements.txt .
RUN apk add --no-cache bash git libgit2 \
    && apk add --no-cache --virtual .build-deps build-base libffi-dev libgit2-dev \
    && python -m pip install --upgrade pip \
    && python -m pip install --upgrade pipenv \
    && python -m pip install -r requirements.txt \
    && apk del .build-deps \
    && rm requirements.txt \
    && rm -rf ~/.cache/pip \
    && adduser c7n -S -h /home/c7n

USER c7n
WORKDIR /home/c7n
CMD ["cloudcustodian", "version"]