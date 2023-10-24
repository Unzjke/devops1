FROM tomcat:7
RUN apt update -y
RUN apt install default-jdk maven git -y 
RUN git clone https://github.com/yankils/hello-world.git
RUN cd hello-world/ && mvn package
RUN cp hello-world/webapp/target/webapp.war $TOMCAT_HOME/webapps
EXPOSE 8080
CMD ["catalina.sh", "run"]