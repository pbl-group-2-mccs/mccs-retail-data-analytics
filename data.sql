

-- Sales and Marketing -------------------------------------------------------------

DELETE FROM customer;
ALTER TABLE customer AUTO_INCREMENT = 1001;

INSERT INTO `customer` (`name`, `contact`, `purchase_history`, `loyalty_tier`)
VALUES
('Alice Johnson', 'alice.johnson@email.com', '3 purchases', 'Gold'),
('Bob Smith', 'bob.smith@email.com', '5 purchases', 'Platinum'),
('Charlie Brown', 'charlie.brown@email.com', '1 purchase', 'Silver');

DELETE FROM sales_opportunity;
ALTER TABLE sales_opportunity AUTO_INCREMENT = 1001;

INSERT INTO `sales_opportunity` (`stage`, `expected_value`, `customer_interest`)
VALUES
('Initial Contact', 1000.00, TRUE),
('Negotiation', 5000.00, TRUE),
('Closed', 10000.00, FALSE);

DELETE FROM sales_contract;
ALTER TABLE sales_contract AUTO_INCREMENT = 1001;

INSERT INTO `sales_contract` (`details`, `amount`, `status`)
VALUES
('Contract for Q1 product distribution', 12000.00, 'Signed'),
('Annual contract for electronics supply', 50000.00, 'Pending'),
('One-time contract for emergency supply', 7000.00, 'Completed');

DELETE FROM campaign;
ALTER TABLE campaign AUTO_INCREMENT = 1001;

INSERT INTO `campaign` (`type`, `start_date`, `end_date`, `KPIs`)
VALUES
('Email Marketing', '2024-11-01', '2024-11-30', 'Open Rate, Click Rate'),
('Social Media', '2024-10-01', '2024-10-31', 'Engagement Rate, Followers'),
('Webinar', '2024-09-01', '2024-09-15', 'Attendance, Conversion Rate');

DELETE FROM market_research;

INSERT INTO `market_research` (`segment_data`, `competitor_analysis`, `trend_analysis`)
VALUES
('Demographic: 18-35, high purchasing power', 'Competitor A leading with 40% market share', 'Increased interest in eco-friendly products'),
('Demographic: 40-60, moderate purchasing power', 'Competitor B gaining traction in mid-range products', 'Growing trend towards home automation'),
('Demographic: 18-25, students and young professionals', 'Competitor C dominates entry-level products', 'Rise in subscription-based services');


-- Finance / Accounting --------------------------------------------------------------

DELETE FROM account;
ALTER TABLE account AUTO_INCREMENT = 1001;

INSERT INTO `account` (`account_code`, `account_name`, `account_type`)
VALUES
('101', 'Cash', 'Asset'),
('201', 'Accounts Payable', 'Liability'),
('301', 'Revenue', 'Equity');

DELETE FROM transaction;
ALTER TABLE transaction AUTO_INCREMENT = 1001;

INSERT INTO `transaction` (`date`, `amount`, `type`)
VALUES
('2024-11-10', 100.00, 'Expense'),
('2024-11-11', 500.00, 'Revenue'),
('2024-11-12', 50.00, 'Expense');

DELETE FROM budget;

INSERT INTO `budget` (`department_budget`, `project_budget`, `approval_status`)
VALUES
(250000.00, 150000.00, 'Approved'),
(300000.00, 100000.00, 'Pending'),
(400000.00, 200000.00, 'Rejected');

DELETE FROM assets;
ALTER TABLE assets AUTO_INCREMENT = 1001;

INSERT INTO `assets` (`type`, `value`, `depreciation_info`)
VALUES
('Building', 1000000.00, 'Depreciates 2% annually'),
('Machinery', 500000.00, 'Depreciates 5% annually'),
('Vehicles', 200000.00, 'Depreciates 10% annually');

DELETE FROM financial_report;

INSERT INTO `financial_report` (`income_statement`, `balance_sheet`, `cash_flow_statement`)
VALUES
('Net income of $500,000', 'Assets: $2,000,000, Liabilities: $1,000,000', 'Operating cash flow: $400,000'),
('Net income of $200,000', 'Assets: $1,500,000, Liabilities: $800,000', 'Operating cash flow: $250,000'),
('Net income of $700,000', 'Assets: $2,500,000, Liabilities: $1,200,000', 'Operating cash flow: $600,000');


-- Supplier ---------------------------------------------------------------------------

DELETE FROM inventory;
ALTER TABLE inventory AUTO_INCREMENT = 1001;

INSERT INTO `inventory` (`item_name`, `quantity`, `location`, `status`)
VALUES
('Steel Rods', 500, 'Warehouse A', 'Available'),
('Copper Wires', 200, 'Warehouse B', 'Low Stock'),
('Plastic Sheets', 1000, 'Warehouse C', 'Available');

DELETE FROM purchase_order;
ALTER TABLE purchase_order AUTO_INCREMENT = 1001;

INSERT INTO `purchase_order` (`supplier_name`, `order_date`, `amount`, `shipping_status`)
VALUES
('ABC Supplies', '2024-11-01', 15000.00, 'Shipped'),
('Global Metals', '2024-10-25', 20000.00, 'Pending'),
('Tech Plastics', '2024-11-10', 10000.00, 'Delivered');

DELETE FROM supplier;
ALTER TABLE supplier AUTO_INCREMENT = 1001;

INSERT INTO `supplier` (`name`, `contact`, `rating`)
VALUES
('ABC Supplies', 'abc@supplier.com', 5),
('Global Metals', 'info@globalmetals.com', 4),
('Tech Plastics', 'support@techplastics.com', 4);

DELETE FROM shipment;
ALTER TABLE shipment AUTO_INCREMENT = 1001;

INSERT INTO `shipment` (`status`, `origin`, `destination`, `expected_arrival`)
VALUES
('In Transit', 'New York', 'Los Angeles', '2024-11-20'),
('Delivered', 'San Francisco', 'Chicago', '2024-11-10'),
('Pending', 'Houston', 'Miami', '2024-11-25');

DELETE FROM demand_forecast;

INSERT INTO `demand_forecast` (`item_demand`, `demand_by_period`, `forecasted_volume`)
VALUES
('High demand for steel rods in Q1', 'January: 1000, February: 1200, March: 1100', 3300.00),
('Moderate demand for copper wires in Q2', 'April: 500, May: 600, June: 700', 1800.00),
('Low demand for plastic sheets in Q3', 'July: 200, August: 150, September: 100', 450.00);

-- Production --------------------------------------------------------------------------

DELETE FROM production_plan;
ALTER TABLE production_plan AUTO_INCREMENT = 1001;

INSERT INTO `production_plan` (`product_name`, `schedule`, `quantity`)
VALUES
('Widget A', '2024-11-15', 1000),
('Widget B', '2024-11-20', 500),
('Widget C', '2024-11-25', 2000);

DELETE FROM material_requirements;
ALTER TABLE material_requirements AUTO_INCREMENT = 1001;

INSERT INTO `material_requirements` (`name`, `required_quantity`, `supply_status`)
VALUES
('Steel', 1000, 'Available'),
('Plastic', 500, 'Out of Stock'),
('Copper', 200, 'Available');

DELETE FROM machinery;
ALTER TABLE machinery AUTO_INCREMENT = 1001;

INSERT INTO `machinery` (`name`, `maintenance_schedule`, `status`)
VALUES
('CNC Machine', '2024-12-01', 'Operational'),
('3D Printer', '2024-11-20', 'Under Maintenance'),
('Welding Machine', '2024-12-15', 'Operational');

DELETE FROM quality_control;
ALTER TABLE quality_control AUTO_INCREMENT = 1001;

INSERT INTO `quality_control` (`results`, `defect_rate`, `corrective_actions`)
VALUES
('Pass', 2.5, 'Adjusted welding temperature'),
('Fail', 5.8, 'Replaced faulty components'),
('Pass', 1.2, 'No actions required');

DELETE FROM work_order;
ALTER TABLE work_order AUTO_INCREMENT = 1001;

INSERT INTO `work_order` (`assigned_employee`, `time`, `status`)
VALUES
('John Smith', '2024-11-16 10:00:00', 'Completed'),
('Jane Doe', '2024-11-17 14:00:00', 'Pending'),
('Chris Evans', '2024-11-18 09:00:00', 'In Progress');


-- Human Resources -----------------------------------------------------------------------

DELETE FROM employee;
ALTER TABLE employee AUTO_INCREMENT = 1001;

INSERT INTO `employee` (`name`, `position`, `department`, `employment_status`)
VALUES
('John Doe', 'Manager', 'Sales', 'Active'),
('Jane Smith', 'Analyst', 'Finance', 'Active'),
('Jim Bean', 'Technician', 'Production', 'Inactive');

DELETE FROM payroll;
ALTER TABLE payroll AUTO_INCREMENT = 1001;

INSERT INTO `payroll` (`base_salary`, `tax_deductions`, `bonuses`, `final_pay`)
VALUES
(50000.00, 5000.00, 2000.00, 47000.00),
(60000.00, 6000.00, 3000.00, 57000.00),
(40000.00, 4000.00, 1000.00, 37000.00);

DELETE FROM attendance;
ALTER TABLE attendance AUTO_INCREMENT = 1001;

INSERT INTO `attendance` (`clock_in_time`, `clock_out_time`, `leave_info`, `hours_worked`)
VALUES
('2024-11-15 09:00:00', '2024-11-15 17:00:00', 'None', 8),
('2024-11-14 08:30:00', '2024-11-14 16:30:00', 'None', 8),
('2024-11-13 09:00:00', '2024-11-13 17:00:00', 'Sick Leave', 0);

DELETE FROM training_and_development;
ALTER TABLE training_and_development AUTO_INCREMENT = 1001;

INSERT INTO `training_and_development` (`title`, `duration`, `assessment_scores`)
VALUES
('Leadership Training', '3 Days', 85),
('Technical Skills Workshop', '5 Days', 90),
('Diversity and Inclusion Seminar', '1 Day', 80);

DELETE FROM benefits;
ALTER TABLE benefits AUTO_INCREMENT = 1001;

INSERT INTO `benefits` (`benefit_type`, `benefit_amount`, `provision_date`)
VALUES
('Health Insurance', 2000.00, '2024-01-01'),
('Retirement Plan', 1500.00, '2024-06-01'),
('Wellness Stipend', 500.00, '2024-12-01');