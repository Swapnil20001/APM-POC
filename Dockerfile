FROM openjdk:8-jdk-alpine
ENV ELASTIC_APM_VERSION "1.36.0"
RUN wget -O /apm-agent.jar https://search.maven.org/remotecontent?filepath=co/elastic/apm/elastic-apm-agent/$ELASTIC_APM_VERSION/elastic-apm-agent-$ELASTIC_APM_VERSION.jar
COPY target/javalin-student-1.0-SNAPSHOT.jar  /app.jar
EXPOSE 8080
# CMD ["java -javaagent:/apm-agent.jar -Delastic.apm.server_urls=http://apm-server.log.svc.cluster.local:8200 -Delastic.apm.service_name=spring-boot-simple -jar app.jar"]
# CMD java -javaagent:/apm-agent.jar -Delastic.apm.service_name=spacecraft-dev-3 -Delastic.apm.server_urls=http://apm-server.log.svc.cluster.local:8200 -jar app.jar
CMD java -jar -javaagent:/apm-agent.jar -Delastic.apm.service_name=spacecraft-dev-3 -Delastic.apm.server_urls=http://apm-server.log.svc.cluster.local:8200  app.jar

