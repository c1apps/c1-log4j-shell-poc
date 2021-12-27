FROM tomcat:8.0.36-jre8

RUN rm -rf /usr/local/tomcat/webapps/*
ADD https://files.trendmicro.com/products/CloudOne/ApplicationSecurity/1.0.2/agent-java/trend_app_protect-4.4.6.jar /usr/local/tomcat/lib/trend_app_protect.jar
ENV TREND_AP_LOG_LEVEL "DEBUG"
ENV CATALINA_OPTS "${CATALINA_OPTS} -javaagent:/usr/local/tomcat/lib/trend_app_protect.jar"
ADD target/log4shell-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080 
CMD ["catalina.sh", "run"]
