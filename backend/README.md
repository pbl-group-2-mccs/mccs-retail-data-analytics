# Retail Analytics Application

## Overview
The Retail Analytics Application is a Spring Boot-based RESTful web service designed to manage sales orders, inventory, and user authentication for a retail business. It provides endpoints for user registration, login, inventory management, and sales visualization.

## Features
- User authentication (login and registration)
- Inventory management (CRUD operations)
- Sales order management
- Sales data visualization by region and date
- CORS support for cross-origin requests

## Technologies Used
- Java
- Spring Boot
- Spring Security
- JPA (Java Persistence API)
- Hibernate
- RDB (Relational Database)
- Lombok
- Swagger for API documentation

## Getting Started

### Prerequisites
- Java 17
- Gradle
- RDB (e.g., MySQL, PostgreSQL, etc.)
- An IDE (e.g., IntelliJ IDEA)

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/pbl-group-2-mccs/mccs-retail-data-analytics.git
   cd <mccs-retail-data-analytics>
   ```

2. **Set up the database**:
    - Create a new database in your RDB server.
    - Update the  `application.yml` file with your database connection details.

   Example `application.properties` for MySQL:
   ```properties
   spring.datasource.url=jdbc:mysql://localhost:3306/your_database_name
   spring.datasource.username=your_username
   spring.datasource.password=your_password
   spring.jpa.hibernate.ddl-auto=update
   ```

   Example `application.properties` for PostgreSQL:
   ```properties
   spring.datasource.url=jdbc:postgresql://localhost:5432/your_database_name
   spring.datasource.username=your_username
   spring.datasource.password=your_password
   spring.jpa.hibernate.ddl-auto=update
   ```

3. **Build the project**:
   Use Gradle to build the project:
   ```bash
   ./gradlew build
   ```

4. **Run the application**:
   You can run the application use the command line:
   ```bash
   ./gradlew bootRun
   ```

### API Endpoints
-http://localhost:8000/swagger-ui/index.html
    - 200

#### User Authentication
- **Login**: `POST /login`
    - Request Body: `{ "login": "user_login", "password": "user_password" }`
    - Response: User details with a token.

- **Register**: `POST /register`
    - Request Body: `{ "login": "new_user_login", "password": "new_user_password" }`
    - Response: Created user details with a token.

#### Inventory Management
- **Get All Inventory**: `GET /api/inventory`
- **Create Inventory**: `POST /api/inventory`
    - Request Body: Inventory object.
- **Get Inventory by ID**: `GET /api/inventory/{id}`
- **Update Inventory**: `PUT /api/inventory/{id}`
    - Request Body: Updated inventory object.
- **Delete Inventory**: `DELETE /api/inventory/{id}`

#### Sales Visualization
- **Sales by Region**: `GET /api/visualization/sales-by-region`
- **Sales by Date**: `GET /api/visualization/sales-by-date`

### CORS Configuration
The application is configured to allow CORS requests from `http://localhost:3000`. Adjust the CORS settings in `WebConfig.java` if you need to allow requests from different origins.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


