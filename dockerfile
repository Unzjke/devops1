FROM tomcat:7
RUN apt update -y
RUN apt install default-jdk maven git -y 
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd boxfuse-sample-java-war-hello/ && mvn package
RUN cp /usr/local/tomcat/boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]