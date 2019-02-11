FROM oraclelinux:7-slim

WORKDIR /usr

RUN yum install -y wget tar gzip

RUN wget -q https://github.com/oracle/graal/releases/download/vm-1.0.0-rc12/graalvm-ce-1.0.0-rc12-linux-amd64.tar.gz && tar xzf graalvm-ce-1.0.0-rc12-linux-amd64.tar.gz

ENV GRAALVM_PKG=/usr/graalvm-ce-1.0.0-rc12-linux-amd64.tar.gz \
    JAVA_HOME=/usr/graalvm-ce-1.0.0-rc12/jdk \
    PATH=/usr/graalvm-ce-1.0.0-rc12/bin:$PATH

# ADD $GRAALVM_PKG /usr/

RUN yum -y install gcc; \
    yum -y install zlib-devel;  \
    alternatives --install /usr/bin/java  java  $JAVA_HOME/bin/java  20000 && \
    alternatives --install /usr/bin/javac javac $JAVA_HOME/bin/javac 20000 && \
    alternatives --install /usr/bin/jar   jar   $JAVA_HOME/bin/jar   20000
