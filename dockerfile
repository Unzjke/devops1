FROM tomcat:8
RUN apt update -y
RUN apt install default-jdk maven git -y 
RUN git clone https://github.com/yankils/hello-world.git
RUN cd hello-world/ && mvn package
RUN ls -a hello-world/target
RUN cp hello-world/target/hello-1.0.war /var/lib/tomcat9/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]