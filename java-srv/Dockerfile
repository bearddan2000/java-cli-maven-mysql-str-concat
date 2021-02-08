FROM openjdk:11-jdk

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        maven

ARG USER_HOME_DIR="/root"

ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"

COPY mvn-entrypoint.sh /usr/local/bin/mvn-entrypoint.sh
COPY settings-docker.xml /usr/share/maven/ref/

VOLUME "$USER_HOME_DIR/.m2"

VOLUME "$USER_HOME_DIR/log"

ENTRYPOINT ["/usr/local/bin/mvn-entrypoint.sh"]

WORKDIR $USER_HOME_DIR

COPY ./bin/ $USER_HOME_DIR

CMD ["mvn", "clean", "install", "compile", "package", "exec:java"]
