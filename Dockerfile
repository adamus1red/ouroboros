FROM python:3.11.5-alpine
LABEL maintainers="dirtycajunrice,circa10a,adamus1red"

ENV TZ UTC

WORKDIR /app

COPY /requirements.txt /setup.py /ouroboros /README.md /app/

RUN apk add --no-cache tzdata && \
    apk add --no-cache --virtual .build-deps libretls-dev musl-dev libffi-dev gcc cargo && \
    pip install --no-cache-dir -r requirements.txt && \
    apk del .build-deps

COPY /pyouroboros /app/pyouroboros

RUN pip install --no-cache-dir .

ENTRYPOINT ["ouroboros"]
