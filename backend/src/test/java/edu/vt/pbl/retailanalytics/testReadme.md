# Test Coverage
## Backend

### Project Setup
---
1. Ensure your project has the correct dependencies in `build.gradle`:
```gradle
plugins {
    id 'java'
    id 'org.springframework.boot' version '3.3.5'
    id 'io.spring.dependency-management' version '1.1.6'
    id 'jacoco'  // For test coverage reporting
}

dependencies {
    // Test dependencies
    testImplementation 'org.springframework.boot:spring-boot-starter-test'
    testImplementation 'org.springframework.security:spring-security-test'
    testImplementation 'org.testcontainers:junit-jupiter:1.17.3'
    testImplementation 'org.testcontainers:mysql:1.17.3'
    testRuntimeOnly 'org.junit.platform:junit-platform-launcher'
}

test {
    useJUnitPlatform()
    finalizedBy jacocoTestReport
}

jacocoTestReport {
    dependsOn test
    reports {
        xml.required = true
        csv.required = false
        html.outputLocation = layout.buildDirectory.dir('jacocoHtml')
    }
}
```

2. Configure MySQL in `compose.yaml` for development:
```yaml
services:
  mysql:
    image: 'mysql:8.0'
    platform: linux/x86_64
    environment:
      - 'MYSQL_DATABASE=mydatabase'
      - 'MYSQL_USER=myuser'
      - 'MYSQL_PASSWORD=secret'
      - 'MYSQL_ROOT_PASSWORD=verysecret'
    ports:
      - '3308:3306'
```

### Running Tests
---
1. Navigate to your project directory
2. Run the tests:
```bash
./gradlew test
```
3. View test coverage report:
```bash
open build/jacocoHtml/index.html  # macOS
xdg-open build/jacocoHtml/index.html  # Linux
start build/jacocoHtml/index.html  # Windows
```

### Test Coverage
---
The tests cover three main areas:

1. Authentication (AuthControllerTest)
   - Login functionality
   - Registration functionality
   - Error handling for invalid credentials
   - Error handling for duplicate users
   - JWT token generation

2. Inventory Management (InventoryControllerTest)
   - Get all inventory items
   - Get inventory by ID
   - Create new inventory
   - Update existing inventory
   - Delete inventory
   - Error handling for not found items

3. Sales Order Management (SalesOrderControllerTest)
   - Get all sales orders
   - Get orders by time period
   - Create new sales order
   - Relationship handling between orders and items

### Test Implementation Details
---
1. Mock MVC Testing
   - Uses `@AutoConfigureMockMvc` for testing controllers
   - Simulates HTTP requests without starting a server
   - Validates response status codes and content

2. Database Testing
   - Uses TestContainers for MySQL integration tests
   - Configures test database properties dynamically
   - Ensures database operations work as expected

3. Security Testing
   - Tests authentication flows
   - Validates token generation and validation
   - Tests secured endpoints

4. Data Transfer Objects (DTOs)
   - Tests proper mapping between entities and DTOs
   - Validates request/response structures
   - Ensures proper data transformation

### Test Structure
---
Each test class follows a consistent pattern:
1. Setup with `@SpringBootTest` and `@AutoConfigureMockMvc`
2. Dependency injection of required components
3. Helper methods for creating test data
4. Individual test methods for each functionality
5. Proper mocking of dependencies using `@MockBean`

### Common Test Patterns
---
1. Success Cases
   - Verify correct status codes (200, 201, etc.)
   - Validate response content
   - Check proper data transformation

2. Error Cases
   - Verify proper error status codes (400, 401, 404, etc.)
   - Validate error messages
   - Test boundary conditions

3. Data Validation
   - Test required fields
   - Validate data constraints
   - Check relationship integrity

### Results
---
Test results can be found in:
- HTML Coverage Report: `build/jacocoHtml/index.html`
- Test Results: `build/reports/tests/test/index.html`
- XML Reports: `build/test-results/test/`