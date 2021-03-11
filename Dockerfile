FROM python:alpine3.8
LABEL maintainer="devopshq" \
      version="0.1.0"

# hadolint ignore=DL3013
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir virtualenv && \
    adduser -D artifactory
USER artifactory
WORKDIR /home/artifactory
COPY --chown=artifactory:artifactory . .
RUN virtualenv . && bin/python setup.py install
ENTRYPOINT ["/home/artifactory/bin/artifactory-cleanup"]
