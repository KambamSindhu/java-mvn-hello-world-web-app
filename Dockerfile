# Use an official Tomcat image as the base image
FROM tomcat:9.0

# Remove the default ROOT application
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy your web application to the Tomcat webapps directory
COPY ./target/*.war /usr/local/tomcat/webapps/ROOT.war
