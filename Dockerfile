FROM openjdk:17-jdk-slim-buster AS builder

ARG APP_NAME=demo-one-api
ARG APP_VERSION=0.0.1-SNAPSHOT

COPY ./ /app
WORKDIR /app
RUN chmod +x ./mvnw

RUN ./mvnw clean package

From eclipse-temurin:17.0.3_7-jre

ENV ARTIFACT_NAME=demo-one-api-0.0.1-SNAPSHOT \
    JAVA_TOOL_OPTIONS=-Duser.timezone="Europe/Madrid" \
    TZ=CET-1CEST,M3.5.0,M10.5.0/3

COPY --from=builder /app/target/demo-one-api-0.0.1-SNAPSHOT.jar /app/demo-one-api-0.0.1-SNAPSHOT.jar

RUN addgroup one \
    && adduser --system --shell /bin/sh --no-create-home --ingroup one one \
    && mkdir /logs \
    && chown one:one /logs \
    && chmod a+rw /logs

RUN chown one:one -R /app

USER one

WORKDIR /app

EXPOSE 8081

ENTRYPOINT java -jar ./demo-one-api-0.0.1-SNAPSHOT.jar