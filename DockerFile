FROM tomcat:10.1-jdk21

COPY target/Medicine.java-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/Medicine.java.war

EXPOSE 8080

CMD ["catalina.sh", "run"]