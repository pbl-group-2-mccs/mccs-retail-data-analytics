# Getting Started
# Database setup
### Start docker from your local machine
### Start Mysql Database from docker

<code>   docker-compose -f compose.yaml up</code>

### Connect to Mysql Database from a SQL client, for example DBeaver

Please using the following URL for database connection. 
<code>jdbc:mysql://localhost:61047/mydatabase?allowPublicKeyRetrieval=true</code>

# How to build project
<code>./gradlew build</code>

# How to run project locally
<code>./gradlew bootRun</code>

### Reference Documentation
For further reference, please consider the following sections:

* [Official Gradle documentation](https://docs.gradle.org)
* [Spring Boot Gradle Plugin Reference Guide](https://docs.spring.io/spring-boot/3.3.5/gradle-plugin)
* [Create an OCI image](https://docs.spring.io/spring-boot/3.3.5/gradle-plugin/packaging-oci-image.html)
* [Spring Boot DevTools](https://docs.spring.io/spring-boot/3.3.5/reference/using/devtools.html)
* [Spring Web](https://docs.spring.io/spring-boot/3.3.5/reference/web/servlet.html)
* [Spring Security](https://docs.spring.io/spring-boot/3.3.5/reference/web/spring-security.html)
* [Spring Data JPA](https://docs.spring.io/spring-boot/3.3.5/reference/data/sql.html#data.sql.jpa-and-spring-data)
* [Validation](https://docs.spring.io/spring-boot/3.3.5/reference/io/validation.html)
* [Docker Compose Support](https://docs.spring.io/spring-boot/3.3.5/reference/features/dev-services.html#features.dev-services.docker-compose)

### Guides
The following guides illustrate how to use some features concretely:

* [Building a RESTful Web Service](https://spring.io/guides/gs/rest-service/)
* [Serving Web Content with Spring MVC](https://spring.io/guides/gs/serving-web-content/)
* [Building REST services with Spring](https://spring.io/guides/tutorials/rest/)
* [Securing a Web Application](https://spring.io/guides/gs/securing-web/)
* [Spring Boot and OAuth2](https://spring.io/guides/tutorials/spring-boot-oauth2/)
* [Authenticating a User with LDAP](https://spring.io/guides/gs/authenticating-ldap/)
* [Accessing Data with JPA](https://spring.io/guides/gs/accessing-data-jpa/)
* [Accessing data with MySQL](https://spring.io/guides/gs/accessing-data-mysql/)
* [Validation](https://spring.io/guides/gs/validating-form-input/)

### Additional Links
These additional references should also help you:

* [Gradle Build Scans – insights for your project's build](https://scans.gradle.com#gradle)

### Docker Compose support
This project contains a Docker Compose file named `compose.yaml`.
In this file, the following services have been defined:

* mysql: [`mysql:latest`](https://hub.docker.com/_/mysql)

Please review the tags of the used images and set them to the same as you're running in production.

