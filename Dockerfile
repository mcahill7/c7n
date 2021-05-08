FROM python:3.9-alpine

ARG BUILD_DATE
ARG VCS_REF
ARG C7N_VERSION

LABEL org.opencontainers.image.title="bdwyertech/c7n" \
      org.opencontainers.image.version=$C7N_VERSION \
      org.opencontainers.image.description="For running Cloud Custodian ($C7N_VERSION) within a CI Environment" \
      org.opencontainers.image.authors="Brian Dwyer <bdwyertech@github.com>" \
      org.opencontainers.image.url="https://hub.docker.com/r/bdwyertech/c7n" \
      org.opencontainers.image.source="https://github.com/bdwyertech/docker-c7n.git" \
      org.opencontainers.image.revision=$VCS_REF \
      org.opencontainers.image.created=$BUILD_DATE \
      org.label-schema.name="bdwyertech/c7n" \
      org.label-schema.description="For running Cloud Custodian ($C7N_VERSION) within a CI Environment" \
      org.label-schema.url="https://hub.docker.com/r/bdwyertech/c7n" \
      org.label-schema.vcs-url="https://github.com/bdwyertech/docker-c7n.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE

ENV PYTHONUNBUFFERED 1

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

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
USER c7n
WORKDIR /home/c7n
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["custodian"]