FROM openjdk:8-jdk

LABEL maintainer="alessandrov87 (https://github.com/AlessandroVaccarino)"

# Set default Zookeeper host and Zookeeper Manager version
ENV ZK_HOSTS=localhost:2181
ENV KM_VERSION=2.0.0.2

# Install https and sbt
RUN apt-get update && \
    apt-get -y install apt-transport-https
RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list && \
    apt-key adv --keyserver hkps://keyserver.ubuntu.com:443 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823 && \
    apt-get update && \
    apt-get -y install sbt

RUN mkdir -p /tmp && \
    cd /tmp && \
    wget https://github.com/yahoo/kafka-manager/archive/${KM_VERSION}.tar.gz && \
    tar xxf ${KM_VERSION}.tar.gz && \
    cd /tmp/kafka-manager-${KM_VERSION} && \
    sbt clean dist && \
    unzip  -d / ./target/universal/kafka-manager-${KM_VERSION}.zip && \
    rm -fr /tmp/${KM_VERSION} /tmp/kafka-manager-${KM_VERSION}

WORKDIR /kafka-manager-${KM_VERSION}

EXPOSE 9000
ENTRYPOINT ["./bin/kafka-manager","-Dconfig.file=conf/application.conf"]