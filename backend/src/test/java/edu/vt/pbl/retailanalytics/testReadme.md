# Test Coverage
## Backend

### Gradle Config (Skip if having version of build.gradle the same with develop branch)
---
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
---
1. Navigate to your project directory
2. Run `./gradlew test`

### Function
---
The Tests Cover:
1. CRUD Operations for Inventory
    - Create: The createProduct() method in InventoryControllerTest tests the creation of a new product.
    - Read: The getAllProducts() and getProductById() methods in InventoryControllerTest test retrieving products.
    - Update: The updateProduct() method in InventoryControllerTest tests updating an existing product.
    - Delete: The deleteProduct() method in InventoryControllerTest tests deleting a product.
2. Database Integration Testing
    - The MySQLTestContainer class sets up a MySQL database using TestContainers, allowing for integration tests that interact with a real database instance. This is utilized in both InventoryControllerTest and InventoryRepositoryTest.
3. Security with Mock Users
    - The @WithMockUser(roles = "ADMIN") annotation in the controller tests simulates an authenticated user with the role of "ADMIN", allowing you to test security aspects of the API endpoints.
4. Repository Layer Functionality
    - The InventoryRepositoryTest class tests the repository layer by verifying that products can be saved and retrieved correctly from the database.

The Tests Use:
1. TestContainers: 
    - Used in MySQLTestContainer to create a real MySQL database for integration testing.
2. MockMvc: 
    - Used in InventoryControllerTest to perform HTTP requests and assert responses without starting a full HTTP server.
3. @DataJpaTest: 
    - Used in InventoryRepositoryTest to configure an in-memory database for testing JPA repositories.
4. Spring Security Test: 
    - Used in InventoryControllerTest to test security features by simulating authenticated users.

### Results
---
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