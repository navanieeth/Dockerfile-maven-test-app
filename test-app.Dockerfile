FROM maven:3.6.3-jdk-8 as build
ARG version
ARG giturl
WORKDIR /testapp
RUN git clone -b ${version} ${giturl} app && \
    mvn -f /testapp/app/pom.xml clean package

FROM openjdk:8u282-jre as final
ARG artifactid
ARG version
ENV artifact ${artifactid}-${version}.jar
WORKDIR /testapp
COPY --from=build /testapp/app/target/${artifact} /testapp
EXPOSE 8080
CMD ["java -jar ${artifact}"]