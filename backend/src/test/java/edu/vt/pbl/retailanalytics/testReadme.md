# Test Coverage
--------------------------------------------------------------------------------
## Backend
--------------------------------------------------------------------------------
### Gradle Config (Skip if having version of build.gradle the same with develop branch)
--------------------------------------------------------------------------------
Ensure your _build.gradle_ file includes the necessary dependencies for testing:
```
plugins {
    id 'org.springframework.boot' version '3.2.0'
    id 'io.spring.dependency-management' version '1.1.4'
    id 'java'
}

java {
    sourceCompatibility = '17'
}

dependencies {
    // Essential for testing
    testImplementation 'org.springframework.boot:spring-boot-starter-test'    
    testImplementation 'org.springframework.security:spring-security-test'    
    testImplementation 'org.testcontainers:junit-jupiter:1.17.3'            
    testImplementation 'org.testcontainers:mysql:1.17.3'                    

    // Required by tests because they're used in the main code being tested
    implementation 'org.springframework.boot:spring-boot-starter-data-jpa'   
    implementation 'org.springframework.boot:spring-boot-starter-security'   
    implementation 'org.springframework.boot:spring-boot-starter-web'         
    runtimeOnly 'com.mysql:mysql-connector-j'                                
}

test {
    useJUnitPlatform()
    // For better test output visibility
    testLogging {
        events "passed", "skipped", "failed"
    }
}
```
### Running Tests
--------------------------------------------------------------------------------
1. Navigate to your project directory
2. Run `./gradlew test`
### Function
--------------------------------------------------------------------------------
These tests cover:
- CRUD operations for inventory
- Database integration testing
- Security with mock users
- Repository layer functionality
The tests use:
- TestContainers for database testing
- MockMvc for controller testing
- @DataJpaTest for repository testing
- Spring Security Test for authentication/authorization testing
### Results
--------------------------------------------------------------------------------
The test results will be available in:
- HTML report: 
build/reports/tests/test/index.html 
- XML report: 
build/test-results/test/
- Console Output: (if adding _testLogging_ configuration in build.gradle)
```
test {
    testLogging {
        events "passed", "skipped", "failed"
    }
}
```