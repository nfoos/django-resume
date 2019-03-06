FROM  python:3.7.2-alpine3.9

ARG UID=1000
ARG GID=1000
ARG USER=app

RUN addgroup -g $GID $USER && \
    adduser -u $UID -h /opt/$USER -G $USER -D $USER

WORKDIR /opt/$USER

COPY requirements.txt ./
RUN pip3 install --no-cache-dir --upgrade pip -r requirements.txt

COPY . .
RUN chown -R $USER:$USER .

USER $USER
ENV PYTHONUNBUFFERED 1
