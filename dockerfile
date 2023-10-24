FROM tomcat:latest
RUN apt update -y
RUN apt install default-jdk maven git -y 
RUN git clone https://github.com/yankils/hello-world.git
RUN cd hello-world/ && mvn pac
EXPOSE 8080
RUN cp -R  /usr/local/tomcat/webapps.dist/*  /usr/local/tomcat/webapps
COPY ./*.war /usr/local/tomcat/webapps
CMD ["catalina.sh", "run"]