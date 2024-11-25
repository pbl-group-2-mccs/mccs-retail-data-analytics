/* User Information Table */
CREATE TABLE user_info (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('Administrator', 'Non-Administrator') NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
) ENGINE = InnoDB;

/* Sales Order Table */
CREATE TABLE sales_order (
    sales_order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    created_by INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (created_by) REFERENCES user_info(user_id)
) ENGINE = InnoDB;

/* Customer Table */
CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(15),
    address TEXT,
    purchase_history TEXT,
    loyalty_tier ENUM('Bronze', 'Silver', 'Gold', 'Platinum')
) ENGINE = InnoDB;