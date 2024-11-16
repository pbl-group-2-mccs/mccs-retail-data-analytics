DROP TABLE IF EXISTS `benefits`;
DROP TABLE IF EXISTS `training_and_development`;
DROP TABLE IF EXISTS `attendance`;
DROP TABLE IF EXISTS `payroll`;
DROP TABLE IF EXISTS `employee`;
DROP TABLE IF EXISTS `work_orders`;
DROP TABLE IF EXISTS `quality_control`;
DROP TABLE IF EXISTS `machinery`;
DROP TABLE IF EXISTS `material_requirements`;
DROP TABLE IF EXISTS `production_plan`;
DROP TABLE IF EXISTS `training_and_development`;
DROP TABLE IF EXISTS `attendance`;
DROP TABLE IF EXISTS `payroll`;
DROP TABLE IF EXISTS `employee`;
DROP TABLE IF EXISTS `work_orders`;
DROP TABLE IF EXISTS `quality_control`;
DROP TABLE IF EXISTS `machinery`;
DROP TABLE IF EXISTS `material_requirements`;
DROP TABLE IF EXISTS `production_plan`;
DROP TABLE IF EXISTS `demand_forecast`;
DROP TABLE IF EXISTS `shipment`;
DROP TABLE IF EXISTS `supplier`;
DROP TABLE IF EXISTS `purchase_order`;
DROP TABLE IF EXISTS `inventory`;
DROP TABLE IF EXISTS `financial_report`;
DROP TABLE IF EXISTS `assets`;
DROP TABLE IF EXISTS `budget`;
DROP TABLE IF EXISTS `transaction`;
DROP TABLE IF EXISTS `account`;
DROP TABLE IF EXISTS `market_research`;
DROP TABLE IF EXISTS `campaign`;
DROP TABLE IF EXISTS `sales_contract`;
DROP TABLE IF EXISTS `sales_opportunity`;
DROP TABLE IF EXISTS `customer`;


CREATE TABLE user_info (
    user_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    login_id VARCHAR(20) NOT NULL,
    login_password VARCHAR(12) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(department_id)
) ENGINE = InnoDB;

CREATE TABLE department (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES user_info(user_id)
) ENGINE = InnoDB;

CREATE TABLE permission (
    permission_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    department_id INT NOT NULL,
    table_permission VARCHAR(100) NOT NULL,
    FOREIGN KEY (department_id) REFERENCES department(department_id)
) ENGINE = InnoDB;

CREATE TABLE customer (
    customer_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone_number VARCHAR(15),
    address TEXT,
    purchase_history TEXT,
    loyalty_tier ENUM('Bronze', 'Silver', 'Gold', 'Platinum')
) ENGINE = InnoDB;

CREATE TABLE sales_order (
    sales_order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    status ENUM('Pending', 'Shipped', 'Delivered') NOT NULL DEFAULT 'Pending',
    created_by INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (created_by) REFERENCES Users(user_id)
) ENGINE = InnoDB;

CREATE TABLE sales_order_item (
    so_item_id INT AUTO_INCREMENT PRIMARY KEY,
    sales_order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    subtotal DECIMAL(10, 2) GENERATED ALWAYS AS (quantity * unit_price) STORED,
    FOREIGN KEY (sales_order_id) REFERENCES SalesOrders(sales_order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
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
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (warehouse_id) REFERENCES Warehouses(warehouse_id)
) ENGINE = InnoDB;

CREATE TABLE warehouse (
    warehouse_id INT AUTO_INCREMENT PRIMARY KEY,
    warehouse_name VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(255),
    capacity INT
) ENGINE = InnoDB;

CREATE TABLE purchase_order (
    purchase_order_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    status ENUM('Pending', 'Completed', 'Canceled') NOT NULL DEFAULT 'Pending',
    created_by INT,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id),
    FOREIGN KEY (created_by) REFERENCES Users(user_id)
) ENGINE = InnoDB;

CREATE TABLE purchase_order_item (
    po_item_id INT AUTO_INCREMENT PRIMARY KEY,
    purchase_order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    subtotal DECIMAL(10, 2) GENERATED ALWAYS AS (quantity * unit_price) STORED,
    FOREIGN KEY (purchase_order_id) REFERENCES PurchaseOrders(purchase_order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
) ENGINE = InnoDB;



CREATE TABLE financial_transaction (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_type ENUM('Purchase', 'Sale', 'Refund') NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    transaction_date DATE NOT NULL,
    reference_id INT,
    status ENUM('Pending', 'Completed', 'Failed') NOT NULL DEFAULT 'Pending'
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
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
) ENGINE = InnoDB;


CREATE TABLE `sales_opportunity` (
    `opportunity_id` INT UNSIGNED AUTO_INCREMENT,
    `stage` VARCHAR(50) NOT NULL,
    `expected_value` DECIMAL(15, 2) NOT NULL,
    `customer_interest` TEXT,
    PRIMARY KEY (`opportunity_id`)
) ENGINE = InnoDB;

CREATE TABLE `sales_contract` (
    `contract_id` INT UNSIGNED AUTO_INCREMENT,
    `details` TEXT NOT NULL,
    `amount` DECIMAL(15, 2) NOT NULL,
    `status` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`contract_id`)
) ENGINE = InnoDB;

CREATE TABLE `campaign` (
    `campaign_id` INT UNSIGNED AUTO_INCREMENT,
    `type` VARCHAR(50) NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE NOT NULL,
    `KPIs` TEXT,
    PRIMARY KEY (`campaign_id`)
) ENGINE = InnoDB;

CREATE TABLE `market_research` (
    `segment_data` TEXT,
    `competitor_analysis` TEXT,
    `trend_analysis` TEXT
) ENGINE = InnoDB;

-- Finance / Accounting -------------------------------------------------------------

CREATE TABLE `account` (
    `account_code` VARCHAR(20) PRIMARY KEY,
    `account_name` VARCHAR(100) NOT NULL,
    `account_type` VARCHAR(50) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE `transaction` (
    `transaction_id` INT UNSIGNED AUTO_INCREMENT,
    `date` DATE NOT NULL,
    `amount` DECIMAL(15, 2) NOT NULL,
    `type` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`transaction_id`)
) ENGINE = InnoDB;

CREATE TABLE `budget` (
    `department_budget` DECIMAL(15, 2),
    `project_budget` DECIMAL(15, 2),
    `approval_status` VARCHAR(50) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE `assets` (
    `asset_id` INT UNSIGNED AUTO_INCREMENT,
    `type` VARCHAR(50) NOT NULL,
    `value` DECIMAL(15, 2) NOT NULL,
    `depreciation_info` TEXT,
    PRIMARY KEY (`asset_id`)
) ENGINE = InnoDB;

CREATE TABLE `financial_report` (
    `income_statement` TEXT,
    `balance_sheet` TEXT,
    `cash_flow_statement` TEXT
) ENGINE = InnoDB;

-- Supplier -------------------------------------------------------------

CREATE TABLE `inventory` (
    `inventory_id` INT UNSIGNED AUTO_INCREMENT,
    `item_name` VARCHAR(100) NOT NULL,
    `quantity` INT NOT NULL,
    `location` VARCHAR(100) NOT NULL,
    `status` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`inventory_id`)
) ENGINE = InnoDB;

CREATE TABLE `purchase_order` (
    `order_id` INT UNSIGNED AUTO_INCREMENT,
    `supplier_name` VARCHAR(100) NOT NULL,
    `order_date` DATE NOT NULL,
    `amount` DECIMAL(15, 2) NOT NULL,
    `shipping_status` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`order_id`)
) ENGINE = InnoDB;

CREATE TABLE `supplier` (
    `supplier_id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `contact` VARCHAR(100) NOT NULL,
    `rating` INT,
    PRIMARY KEY (`supplier_id`)
) ENGINE = InnoDB;

CREATE TABLE `shipment` (
    `shipment_id` INT UNSIGNED AUTO_INCREMENT,
    `status` VARCHAR(50) NOT NULL,
    `origin` VARCHAR(100) NOT NULL,
    `destination` VARCHAR(100) NOT NULL,
    `expected_arrival` DATE NOT NULL,
    PRIMARY KEY (`shipment_id`)
) ENGINE = InnoDB;

CREATE TABLE `demand_forecast` (
    `item_demand` TEXT,
    `demand_by_period` TEXT,
    `forecasted_volume` DECIMAL(15, 2)
) ENGINE = InnoDB;

-- Production -------------------------------------------------------------

CREATE TABLE `production_plan` (
    `production_id` INT UNSIGNED AUTO_INCREMENT,
    `product_name` VARCHAR(100) NOT NULL,
    `schedule` DATE NOT NULL,
    `quantity` INT NOT NULL,
    PRIMARY KEY (`production_id`)
) ENGINE = InnoDB;

CREATE TABLE `material_requirements` (
    `material_id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `required_quantity` INT NOT NULL,
    `supply_status` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`material_id`)
) ENGINE = InnoDB;

CREATE TABLE `machinery` (
    `machinery_id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `maintenance_schedule` DATE NOT NULL,
    `status` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`machinery_id`)
) ENGINE = InnoDB;

CREATE TABLE `quality_control` (
    `inspection_id` INT UNSIGNED AUTO_INCREMENT,
    `results` TEXT NOT NULL,
    `defect_rate` FLOAT NOT NULL,
    `corrective_actions` TEXT,
    PRIMARY KEY (`inspection_id`)
) ENGINE = InnoDB;

CREATE TABLE `work_orders` (
    `work_order_id` INT UNSIGNED AUTO_INCREMENT,
    `assigned_employee` INT UNSIGNED,
    `time` DATETIME NOT NULL,
    `status` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`work_order_id`),
    FOREIGN KEY (`assigned_employee`) REFERENCES `employee`(`employee_id`)
) ENGINE = InnoDB;

-- Human Resources -------------------------------------------------------------

CREATE TABLE `employee` (
    `employee_id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `position` VARCHAR(100) NOT NULL,
    `department` VARCHAR(100) NOT NULL,
    `employment_status` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`employee_id`)
) ENGINE = InnoDB;

CREATE TABLE `payroll` (
    `payroll_id` INT UNSIGNED AUTO_INCREMENT,
    `base_salary` DECIMAL(15, 2) NOT NULL,
    `tax_deductions` DECIMAL(15, 2) NOT NULL,
    `bonuses` DECIMAL(15, 2),
    `final_pay` DECIMAL(15, 2) NOT NULL,
    `employee_id` INT UNSIGNED,
    PRIMARY KEY (`payroll_id`),
    FOREIGN KEY (`employee_id`) REFERENCES `employee`(`employee_id`)
) ENGINE = InnoDB;

CREATE TABLE `attendance` (
    `employee_id` INT UNSIGNED,
    `clock_in_time` DATETIME NOT NULL,
    `clock_out_time` DATETIME,
    `leave_info` TEXT,
    `hours_worked` FLOAT,
    PRIMARY KEY (`employee_id`, `clock_in_time`),
    FOREIGN KEY (`employee_id`) REFERENCES `employee`(`employee_id`)
) ENGINE = InnoDB;

CREATE TABLE `training_and_development` (
    `training_id` INT UNSIGNED AUTO_INCREMENT,
    `title` VARCHAR(100) NOT NULL,
    `duration` FLOAT NOT NULL,
    `assessment_scores` FLOAT,
    PRIMARY KEY (`training_id`)
) ENGINE = InnoDB;

CREATE TABLE `benefits` (
    `benefit_type` VARCHAR(50) NOT NULL,
    `benefit_amount` DECIMAL(15, 2) NOT NULL,
    `provision_date` DATE NOT NULL,
    `employee_id` INT UNSIGNED,
    PRIMARY KEY (`benefit_type`, `employee_id`),
    FOREIGN KEY (`employee_id`) REFERENCES `employee`(`employee_id`)
) ENGINE = InnoDB;