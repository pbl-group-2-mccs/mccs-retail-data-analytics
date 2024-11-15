-- Reset and Insert Data for Customer
DELETE FROM customer;
ALTER TABLE customer AUTO_INCREMENT = 1001;

INSERT INTO `customer` (`name`, `contact`, `purchase_history`, `loyalty_tier`)
VALUES
('Alice Johnson', 'alice.johnson@email.com', '3 purchases', 'Gold'),
('Bob Smith', 'bob.smith@email.com', '5 purchases', 'Platinum'),
('Charlie Brown', 'charlie.brown@email.com', '1 purchase', 'Silver');

-- Reset and Insert Data for Sales Opportunity
DELETE FROM sales_opportunity;
ALTER TABLE sales_opportunity AUTO_INCREMENT = 1001;

INSERT INTO `sales_opportunity` (`stage`, `expected_value`, `customer_interest`)
VALUES
('Initial Contact', 1000.00, TRUE),
('Negotiation', 5000.00, TRUE),
('Closed', 10000.00, FALSE);

-- Reset and Insert Data for Campaign
DELETE FROM campaign;
ALTER TABLE campaign AUTO_INCREMENT = 1001;

INSERT INTO `campaign` (`type`, `start_date`, `end_date`, `KPIs`)
VALUES
('Email Marketing', '2024-11-01', '2024-11-30', 'Open Rate, Click Rate'),
('Social Media', '2024-10-01', '2024-10-31', 'Engagement Rate, Followers'),
('Webinar', '2024-09-01', '2024-09-15', 'Attendance, Conversion Rate');

-- Reset and Insert Data for Account
DELETE FROM account;
ALTER TABLE account AUTO_INCREMENT = 1001;

INSERT INTO `account` (`account_code`, `account_name`, `account_type`)
VALUES
('101', 'Cash', 'Asset'),
('201', 'Accounts Payable', 'Liability'),
('301', 'Revenue', 'Equity');

-- Reset and Insert Data for Transaction
DELETE FROM transaction;
ALTER TABLE transaction AUTO_INCREMENT = 1001;

INSERT INTO `transaction` (`date`, `amount`, `type`)
VALUES
('2024-11-10', 100.00, 'Expense'),
('2024-11-11', 500.00, 'Revenue'),
('2024-11-12', 50.00, 'Expense');

-- Reset and Insert Data for Production Plan
DELETE FROM production_plan;
ALTER TABLE production_plan AUTO_INCREMENT = 1001;

INSERT INTO `production_plan` (`product_name`, `schedule`, `quantity`)
VALUES
('Widget A', '2024-11-15', 1000),
('Widget B', '2024-11-20', 500),
('Widget C', '2024-11-25', 2000);

-- Reset and Insert Data for Material Requirements
DELETE FROM material_requirements;
ALTER TABLE material_requirements AUTO_INCREMENT = 1001;

INSERT INTO `material_requirements` (`name`, `required_quantity`, `supply_status`)
VALUES
('Steel', 1000, 'Available'),
('Plastic', 500, 'Out of Stock'),
('Copper', 200, 'Available');

-- Reset and Insert Data for Employee
DELETE FROM employee;
ALTER TABLE employee AUTO_INCREMENT = 1001;

INSERT INTO `employee` (`name`, `position`, `department`, `employment_status`)
VALUES
('John Doe', 'Manager', 'Sales', 'Active'),
('Jane Smith', 'Analyst', 'Finance', 'Active'),
('Jim Bean', 'Technician', 'Production', 'Inactive');

-- Reset and Insert Data for Payroll
DELETE FROM payroll;
ALTER TABLE payroll AUTO_INCREMENT = 1001;

INSERT INTO `payroll` (`base_salary`, `tax_deductions`, `bonuses`, `final_pay`)
VALUES
(50000.00, 5000.00, 2000.00, 47000.00),
(60000.00, 6000.00, 3000.00, 57000.00),
(40000.00, 4000.00, 1000.00, 37000.00);