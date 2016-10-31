FROM java:8

MAINTAINER delivery-engineering@netflix.com

ENV DECK_HOST deck
ENV ORCA_HOST orca
ENV FRONT50_HOST front50
ENV CLOUDDRIVER_HOST clouddriver
ENV ROSCO_HOST rosco
ENV REDIS_HOST redis

COPY . workdir/

WORKDIR workdir

RUN GRADLE_USER_HOME=cache ./gradlew buildDeb -x test

RUN dpkg -i ./gate-web/build/distributions/*.deb

CMD ["/opt/gate/bin/gate"]
