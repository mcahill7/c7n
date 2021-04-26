FROM python:3.9-alpine

RUN python -m pip install --upgrade pip \
    && python -m pip install --upgrade c7n \
    && python -m pip install --upgrade c7n_azure \
    && python -m pip install --upgrade c7n_gcp \
    && adduser c7n -S -h /home/c7n

USER c7n
WORKDIR /home/c7n
CMD ["custodian run --output-dir=. policy.yml"]