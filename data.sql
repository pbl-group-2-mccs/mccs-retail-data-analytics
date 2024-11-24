-- Insert dummy data into user_info table
INSERT INTO user_info (username, password_hash, role, email) VALUES
('admin1', 'hashed_password_1', 'Administrator', 'admin1@example.com'),
('admin2', 'hashed_password_2', 'Administrator', 'admin2@example.com'),
('user1', 'hashed_password_3', 'Non-Administrator', 'user1@example.com'),
('user2', 'hashed_password_4', 'Non-Administrator', 'user2@example.com');

-- Insert dummy data into customer table
INSERT INTO customer (customer_name, email, phone_number, address, purchase_history, loyalty_tier) VALUES
('John Doe', 'john.doe@example.com', '123-456-7890', '123 Elm St, Springfield', 'Order1, Order2', 'Gold'),
('Jane Smith', 'jane.smith@example.com', '234-567-8901', '456 Oak St, Springfield', 'Order3', 'Silver'),
('Alice Johnson', 'alice.j@example.com', '345-678-9012', '789 Pine St, Springfield', 'Order4, Order5', 'Bronze'),
('Bob Brown', 'bob.brown@example.com', '456-789-0123', '101 Maple St, Springfield', 'Order6', 'Platinum');

-- Insert a large amount of dummy data into sales_order table for September 2023
INSERT INTO sales_order (customer_id, order_date, total_amount, created_by) VALUES
(1, '2023-09-01', 150.00, 3),
(2, '2023-09-02', 200.00, 4),
(3, '2023-09-03', 350.00, 3),
(4, '2023-09-04', 400.00, 4),
(1, '2023-09-05', 250.00, 3),
(2, '2023-09-06', 300.00, 4),
(3, '2023-09-07', 450.00, 3),
(4, '2023-09-08', 500.00, 4),
(1, '2023-09-09', 550.00, 3),
(2, '2023-09-10', 600.00, 4),
(3, '2023-09-11', 650.00, 3),
(4, '2023-09-12', 700.00, 4),
(1, '2023-09-13', 750.00, 3),
(2, '2023-09-14', 800.00, 4),
(3, '2023-09-15', 850.00, 3),
(4, '2023-09-16', 900.00, 4),
(1, '2023-09-17', 950.00, 3),
(2, '2023-09-18', 1000.00, 4),
(3, '2023-09-19', 1050.00, 3),
(4, '2023-09-20', 1100.00, 4),
(1, '2023-09-21', 1150.00, 3),
(2, '2023-09-22', 1200.00, 4),
(3, '2023-09-23', 1250.00, 3),
(4, '2023-09-24', 1300.00, 4),
(1, '2023-09-25', 1350.00, 3),
(2, '2023-09-26', 1400.00, 4),
(3, '2023-09-27', 1450.00, 3),
(4, '2023-09-28', 1500.00, 4),
(1, '2023-09-29', 1550.00, 3),
(2, '2023-09-30', 1600.00, 4);