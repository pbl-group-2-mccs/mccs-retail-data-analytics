package edu.vt.pbl.retailanalytics.container;

import org.testcontainers.containers.MySQLContainer;
import org.testcontainers.junit.jupiter.Container;
import org.testcontainers.junit.jupiter.Testcontainers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.nio.file.Files;
import java.nio.file.Paths;

@Testcontainers
public abstract class MySQLTestContainer {
    @Container
    static MySQLContainer<?> mySQLContainer = new MySQLContainer<>("mysql:8.0")
            .withDatabaseName("test_db")
            .withUsername("test")
            .withPassword("test");

    static {
        mySQLContainer.start();
        setupDatabase();
    }

    private static void setupDatabase() {
        try (Connection connection = DriverManager.getConnection(
                mySQLContainer.getJdbcUrl(), 
                mySQLContainer.getUsername(), 
                mySQLContainer.getPassword())) {
            
            // Load and execute create-tables.sql
            String createTablesSql = new String(Files.readAllBytes(Paths.get("backend/init-scripts/create-tables.sql")));
            try (Statement statement = connection.createStatement()) {
                statement.execute(createTablesSql);
            }

            // Load and execute load_data.sql
            String loadDataSql = new String(Files.readAllBytes(Paths.get("backend/init-scripts/load_data.sql")));
            try (Statement statement = connection.createStatement()) {
                statement.execute(loadDataSql);
            }
        } catch (SQLException | IOException e) {
            throw new RuntimeException("Failed to set up the database", e);
        }
    }
}