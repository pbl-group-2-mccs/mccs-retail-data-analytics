
DELETE FROM user_info;
ALTER TABLE user_info AUTO_INCREMENT = 1001;
INSERT INTO user_info (first_name, last_name, login_id, login_password, department_id)
VALUES
('John', 'Doe', 'john.doe', 'password123', 1),
('Jane', 'Smith', 'jane.smith', 'securePass', 2),
('Alice', 'Johnson', 'alice.j', 'alice2024', 3),
('Bob', 'Brown', 'bob.brown', 'bob@123', 4),
('Emily', 'Clark', 'emily.c', 'emily2023', 5);

DELETE FROM department;
ALTER TABLE department AUTO_INCREMENT = 1001;
INSERT INTO department (department_name, manager_id)
VALUES
('Sales and Marketing', NULL),
('Finance and Accounting', NULL),
('Supplier Management', NULL),
('Production', NULL),
('Human Resources', NULL);

UPDATE department
SET manager_id = (SELECT user_id FROM user_info WHERE login_id = 'john.doe') WHERE department_name = 'Sales and Marketing';

DELETE FROM permission;
ALTER TABLE permission AUTO_INCREMENT = 1001;
INSERT INTO permission (department_id, table_permission)
VALUES
(1, 'customer, marketing_campaign, customer_feedback, sales_order, sales_order_item'),
(2, 'financial_transaction, purchase_order, sales_order'),
(3, 'supplier, purchase_order, purchase_order_item'),
(4, 'inventory, warehouse, product'),
(5, 'employee');

DELETE FROM customer_feedback;
ALTER TABLE customer_feedback AUTO_INCREMENT = 1001;
INSERT INTO customer_feedback (customer_id, feedback_date, feedback_text, rating)
VALUES
(1, '2024-11-01', 'Great service and fast delivery!', 5),
(2, '2024-11-10', 'Product quality was below expectations.', 2),
(3, '2024-11-15', 'Customer support was helpful and resolved my issue.', 4);

DELETE FROM sales_order;
ALTER TABLE sales_order AUTO_INCREMENT = 1001;
INSERT INTO sales_order (customer_id, order_date, total_amount, delivery_status, created_by)
VALUES
(1, '2024-11-05', 150.00, 'Pending', 2),
(2, '2024-11-08', 300.00, 'Shipped', 3),
(3, '2024-11-12', 450.00, 'Delivered', 4);

DELETE FROM sales_order_item;
ALTER TABLE sales_order_item AUTO_INCREMENT = 1001;
INSERT INTO sales_order_item (sales_order_id, product_id, quantity, unit_price)
VALUES
(1001, 1, 2, 50.00),
(1001, 2, 1, 100.00),
(1002, 3, 4, 75.00),
(1003, 4, 5, 90.00);

DELETE FROM customer;
ALTER TABLE customer AUTO_INCREMENT = 1001;
INSERT INTO customer (customer_name, email, phone_number, address, purchase_history, loyalty_tier)
VALUES
('Alice Johnson', 'alice.johnson@email.com', '123-456-7890', '123 Main St', '3 orders', 'Gold'),
('Bob Smith', 'bob.smith@email.com', '555-987-6543', '456 Elm St', '5 orders', 'Platinum');

DELETE FROM marketing_campaign;
ALTER TABLE marketing_campaign AUTO_INCREMENT = 1001;
INSERT INTO marketing_campaign (campaign_name, start_date, end_date, budget, target_audience, status)
VALUES
('Holiday Sale 2024', '2024-12-01', '2024-12-31', 50000.00, 'All customers', 'Planned');

DELETE FROM purchase_order;
ALTER TABLE purchase_order AUTO_INCREMENT = 1001;
INSERT INTO purchase_order (supplier_id, order_date, total_amount, status, created_by)
VALUES
(1, '2024-11-10', 3000.00, 'Pending', 3),
(2, '2024-11-12', 4500.00, 'Completed', 4);

DELETE FROM purchase_order_item;
ALTER TABLE purchase_order_item AUTO_INCREMENT = 1001;
INSERT INTO purchase_order_item (purchase_order_id, product_id, quantity, unit_price)
VALUES
(1001, 1, 10, 50.00),
(1001, 2, 5, 100.00),
(1002, 3, 20, 75.00);

DELETE FROM financial_transaction;
ALTER TABLE financial_transaction AUTO_INCREMENT = 1001;
INSERT INTO financial_transaction (transaction_type, amount, transaction_date, status)
VALUES
('Sale', 1500.00, '2024-11-10', 'Completed'),
('Purchase', 2000.00, '2024-11-11', 'Pending');

DELETE FROM supplier;
ALTER TABLE supplier AUTO_INCREMENT = 1001;
INSERT INTO supplier (supplier_name, contact_name, phone_number, email, address)
VALUES
('ABC Supplies', 'John Manager', '111-222-3333', 'abc@supplier.com', '789 Industrial Rd'),
('Global Metals', 'Mary Lead', '444-555-6666', 'global@metals.com', '101 Commerce Dr');

DELETE FROM inventory;
ALTER TABLE inventory AUTO_INCREMENT = 1001;
INSERT INTO inventory (product_id, warehouse_id, quantity)
VALUES
(1, 101, 50),
(2, 102, 30),
(3, 103, 100);

DELETE FROM warehouse;
ALTER TABLE warehouse AUTO_INCREMENT = 1001;
INSERT INTO warehouse (warehouse_name, location, capacity)
VALUES
('Main Warehouse', '123 Logistics Ave', 5000),
('Backup Warehouse', '456 Storage St', 2000);

DELETE FROM employee;
ALTER TABLE employee AUTO_INCREMENT = 1001;
INSERT INTO employee (first_name, last_name, date_of_birth, email, phone_number, department_id, position, salary, date_hired)
VALUES
('Hannah', 'Lee', '1990-05-12', 'hannah.lee@email.com', '123-555-6789', 1, 'Marketing Specialist', 60000.00, '2020-01-15'),
('Kevin', 'Nguyen', '1985-08-20', 'kevin.nguyen@email.com', '987-654-3210', 2, 'Accountant', 70000.00, '2018-03-01');