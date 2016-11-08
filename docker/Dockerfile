FROM mesosphere/mesos:1.0.1-2.0.93.ubuntu1404

RUN apt-get update && \
    apt-get install -y software-properties-common
RUN add-apt-repository ppa:openjdk-r/ppa
RUN apt-get update && \
    apt-get install --yes \
    openjdk-8-jdk\
    wget \
    tar

# hadoop config
ENV HADOOP_CONF_DIR /etc/hadoop
ADD ./conf/hadoop/hdfs-site.xml /etc/hadoop/hdfs-site.xml
ADD ./conf/hadoop/core-site.xml /etc/hadoop/core-site.xml
ADD ./conf/hadoop/mesos-site.xml /etc/hadoop/mesos-site.xml

# java
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
RUN update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

## TO BE REMOVED ONCE CROSSDATA-ZEPPELIN HAS BEEN DEPLOYED IN MAVEN CENTRAL
###########################################################################
RUN add-apt-repository ppa:andrei-pozolotin/maven3

RUN apt-get update && \
	apt-get install --yes \
	git \
	maven3

RUN git clone https://github.com/jjlopezm/crossdata.git
WORKDIR /crossdata
RUN git checkout ZeppelinIntegration
RUN mvn install -DskipUTs -DskipITs
WORKDIR /
############################################################################

# zeppelin
RUN wget http://www.apache.org/dist/zeppelin/zeppelin-0.6.2/zeppelin-0.6.2-bin-all.tgz
RUN tar xzvf zeppelin-0.6.2-bin-all.tgz
WORKDIR /zeppelin-0.6.2-bin-all
ADD zeppelin-env.sh conf/zeppelin-env.sh

RUN rm /zeppelin-0.6.2-bin-all.tgz

ADD docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
