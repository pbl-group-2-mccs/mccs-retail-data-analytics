// src/test/java/edu/vt/pbl/retailanalytics/config/TestConfig.java
// test configuration class
package edu.vt.pbl.retailanalytics.config;

import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.boot.test.web.client.TestRestTemplate;

@TestConfiguration
public class TestConfig {
    @Bean
    public TestRestTemplate testRestTemplate() {
        return new TestRestTemplate();
    }
}