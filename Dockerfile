FROM openjdk:19-jdk-alpine
MAINTAINER yashgo@hcl.com

RUN mkdir /opt/tomcat/
WORKDIR /opt/tomcat

RUN apk update
RUN apk add vim
RUN apk add curl

RUN curl -O https://archive.apache.org/dist/tomcat/tomcat-10/v10.1.4/bin/apache-tomcat-10.1.4.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-10.1.4/* /opt/tomcat/.

RUN java -version

WORKDIR /opt/tomcat/webapps
COPY firstdemo.war /opt/tomcat/webapps/

EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]