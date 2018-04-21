FROM java:8-alpine
MAINTAINER Your Name <you@example.com>

ADD target/uberjar/pulap.jar /pulap/app.jar

EXPOSE 3000

CMD ["java", "-jar", "/pulap/app.jar"]
