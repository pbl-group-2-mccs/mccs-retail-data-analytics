CREATE TABLE IF NOT EXISTS app_user
(
    id         bigint auto_increment primary key,
    first_name varchar(100) not null,
    last_name  varchar(100) not null,
    login      varchar(100) not null,
    password   varchar(100) not null
);

CREATE TABLE IF NOT EXISTS customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15),
    address_line1 VARCHAR(255),
    address_line2 VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),  -- For analytics based on state
    zip_code VARCHAR(10),
    country VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS inventory (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    product_line VARCHAR(100),  -- For analyzing sales performance by product line
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,  -- Price per unit
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS sales_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL,
    status ENUM('Pending', 'Completed', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS sales_order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,  -- Price at the time of sale
    FOREIGN KEY (order_id) REFERENCES sales_order(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES inventory(product_id) ON DELETE CASCADE
);
