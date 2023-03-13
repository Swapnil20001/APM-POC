FROM openjdk:8-jdk-alpine
ENV ELASTIC_APM_VERSION "1.8.0"
RUN wget -O /apm-agent.jar https://search.maven.org/remotecontent?filepath=co/elastic/apm/elastic-apm-agent/$ELASTIC_APM_VERSION/elastic-apm-agent-$ELASTIC_APM_VERSION.jar
COPY target/spring-boot-websocket-0.0.1-SNAPSHOT.jar  /app.jar
EXPOSE 8080
