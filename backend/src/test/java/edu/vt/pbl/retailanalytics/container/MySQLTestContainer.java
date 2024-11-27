// src/test/java/edu/vt/pbl/retailanalytics/container/MySQLTestContainer.java
// base test container class for database integration tests
package edu.vt.pbl.retailanalytics.container;

import org.testcontainers.containers.MySQLContainer;
import org.testcontainers.junit.jupiter.Container;
import org.testcontainers.junit.jupiter.Testcontainers;

@Testcontainers
public abstract class MySQLTestContainer {
    @Container
    static MySQLContainer<?> mySQLContainer = new MySQLContainer<>("mysql:8.0")
            .withDatabaseName("test_db")
            .withUsername("test")
            .withPassword("test");

    static {
        mySQLContainer.start();
    }
}