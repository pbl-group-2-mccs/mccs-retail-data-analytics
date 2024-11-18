-- USER -------------------------------------------------

CREATE TABLE user_info (
    user_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    login_id VARCHAR(20) NOT NULL,
    login_password VARCHAR(12) NOT NULL,
    department_id INT
) ENGINE = InnoDB;


CREATE TABLE department (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    manager_id INT
) ENGINE = InnoDB;

ALTER TABLE user_info ADD CONSTRAINT fk_department FOREIGN KEY (department_id)
REFERENCES department(department_id);

ALTER TABLE department ADD CONSTRAINT fk_manager FOREIGN KEY (manager_id)
REFERENCES user_info(user_id);

CREATE TABLE permission (
    permission_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    department_id INT NOT NULL,
    table_permission VARCHAR(100) NOT NULL,
    FOREIGN KEY (department_id) REFERENCES department(department_id)
) ENGINE = InnoDB;

-- Tables accessible to each department ------------------------------------------
-- Sales and Marketing	: customer, marketing_campaign, customer_feedback, 		--
-- 						  sales_order, sales_order_item							--
-- Finance/Accounting	: financial_transaction, purchase_order, sales_order	--
-- Supplier				: supplier, purchase_order, purchase_order_item			--
-- Production			: inventory, warehouse, product							--
-- Human Resources (HR)	: employee

CREATE TABLE customer (
    customer_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone_number VARCHAR(15),
    address TEXT,
    purchase_history TEXT,
    loyalty_tier ENUM('Bronze', 'Silver', 'Gold', 'Platinum')
) ENGINE = InnoDB;

CREATE TABLE marketing_campaign (
    campaign_id INT AUTO_INCREMENT PRIMARY KEY,
    campaign_name VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    budget DECIMAL(10, 2),
    target_audience TEXT,
    status ENUM('Planned', 'Ongoing', 'Completed', 'Canceled') NOT NULL DEFAULT 'Planned'
) ENGINE = InnoDB;

CREATE TABLE customer_feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    feedback_date DATE NOT NULL,
    feedback_text TEXT NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
) ENGINE = InnoDB;

CREATE TABLE sales_order (
    sales_order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    delivery_status ENUM('Pending', 'Shipped', 'Delivered') NOT NULL DEFAULT 'Pending',
    created_by INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (created_by) REFERENCES user_info(user_id)
) ENGINE = InnoDB;

CREATE TABLE sales_order_item (
    sales_item_id INT AUTO_INCREMENT PRIMARY KEY,
    sales_order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    subtotal DECIMAL(10, 2) GENERATED ALWAYS AS (quantity * unit_price) STORED,
    FOREIGN KEY (sales_order_id) REFERENCES sales_order(sales_order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
) ENGINE = InnoDB;

CREATE TABLE purchase_order (
    purchase_order_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    status ENUM('Pending', 'Completed', 'Canceled') NOT NULL DEFAULT 'Pending',
    created_by INT,
    FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id),
    FOREIGN KEY (created_by) REFERENCES user_info(user_id)
) ENGINE = InnoDB;

CREATE TABLE purchase_order_item (
    purchase_item_id INT AUTO_INCREMENT PRIMARY KEY,
    purchase_order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    subtotal DECIMAL(10, 2) GENERATED ALWAYS AS (quantity * unit_price) STORED,
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(purchase_order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
) ENGINE = InnoDB;

CREATE TABLE financial_transaction (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_type ENUM('Purchase', 'Sale', 'Refund') NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    transaction_date DATE NOT NULL,
    reference_id INT,
    status ENUM('Pending', 'Completed', 'Failed') NOT NULL DEFAULT 'Pending'
) ENGINE = InnoDB;

CREATE TABLE product (
	product_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category_id INT,
    unit_price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0,
    FOREIGN KEY (category_id) REFERENCES product_category(category_id)
) ENGINE = InnoDB;

CREATE TABLE product_category (
	category_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE supplier (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    contact_name VARCHAR(100),
    phone_number VARCHAR(20),
    email VARCHAR(100),
    address TEXT
) ENGINE = InnoDB;

CREATE TABLE inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    warehouse_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouse(warehouse_id)
) ENGINE = InnoDB;

CREATE TABLE warehouse (
    warehouse_id INT AUTO_INCREMENT PRIMARY KEY,
    warehouse_name VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(255),
    capacity INT
) ENGINE = InnoDB;

CREATE TABLE employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(20),
    department_id INT,
    position VARCHAR(50),
    salary DECIMAL(10, 2) NOT NULL,
    date_hired DATE NOT NULL,
    FOREIGN KEY (department_id) REFERENCES ㅇepartment(department_id)
) ENGINE = InnoDB;