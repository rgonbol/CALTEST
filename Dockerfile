# Usa la imagen base de Ubuntu 14.04
FROM ubuntu:20.04

# Actualiza el sistema e instala Java 8
RUN apt-get update && apt-get install -y openjdk-8-jdk

# Descarga e instala Tomcat 8
RUN apt-get install -y wget
RUN wget http://archive.apache.org/dist/tomcat/tomcat-8/v8.5.61/bin/apache-tomcat-8.5.61.tar.gz
RUN tar -xzvf apache-tomcat-8.5.61.tar.gz -C /opt
RUN mv /opt/apache-tomcat-8.5.61 /opt/tomcat
RUN rm apache-tomcat-8.5.61.tar.gz

# Descarga la última versión de Jenkins en formato .war
RUN wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war -O /opt/tomcat/webapps/jenkins.war

# Expone el puerto 8080
EXPOSE 8080

# Arranca Tomcat y despliega Jenkins
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
