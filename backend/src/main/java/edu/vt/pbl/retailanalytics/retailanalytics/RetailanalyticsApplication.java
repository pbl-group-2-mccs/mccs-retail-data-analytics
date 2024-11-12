package edu.vt.pbl.retailanalytics.retailanalytics;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
public class RetailanalyticsApplication {

	public static void main(String[] args) {
		SpringApplication.run(RetailanalyticsApplication.class, args);
	}

}
