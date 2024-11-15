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


-- Sales and Marketing -------------------------------------------------------------

CREATE TABLE `customer` (
    `customer_id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `contact` VARCHAR(100) NOT NULL,
    `purchase_history` TEXT,
    `loyalty_tier` VARCHAR(50),
    PRIMARY KEY (`customer_id`)
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