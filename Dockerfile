FROM python:3.9.0-alpine

LABEL maintainers="dirtycajunrice,circa10a,adamus1red"

ENV TZ UTC

WORKDIR /app

COPY /requirements.txt /setup.py /ouroboros /README.md /app/

RUN apk add --no-cache tzdata && \
    pip install --no-cache-dir -r requirements.txt

COPY /pyouroboros /app/pyouroboros

RUN pip install --no-cache-dir .

ENTRYPOINT ["ouroboros"]
