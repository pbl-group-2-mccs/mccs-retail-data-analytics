

/* Dashboard Page ------------------------------------------------------------------ */
INSERT INTO customer (customer_name, email, phone_number, address, purchase_history, loyalty_tier)
VALUES 
    ('John Doe', 'johndoe@example.com', '123-456-7890', '123 Main St, Springfield', 'Order123,Order124', 'Gold'),
    ('Jane Smith', 'janesmith@example.com', '987-654-3210', '456 Elm St, Shelbyville', 'Order125', 'Silver'),
    ('Alice Brown', 'alicebrown@example.com', '555-123-4567', '789 Oak St, Capital City', NULL, 'Bronze');

INSERT INTO sales_order (customer_id, order_date, total_amount, delivery_status, created_by)
VALUES 
    (1, '2024-11-20', 250.00, 'Pending', 101),
    (2, '2024-11-19', 150.00, 'Shipped', 102),
    (3, '2024-11-18', 300.00, 'Delivered', 101);

/* Visualization Page ------------------------------------------------------------------ */
INSERT INTO marketing_campaign (campaign_name, start_date, end_date, budget, target_audience, status)
VALUES 
    ('Holiday Sale', '2024-11-01', '2024-12-31', 5000.00, 'Loyal Customers', 'Ongoing'),
    ('Spring Discount', '2024-03-01', '2024-04-30', 3000.00, 'New Customers', 'Planned'),
    ('Flash Sale', '2024-10-15', '2024-10-20', 2000.00, 'All Customers', 'Completed');

INSERT INTO customer_feedback (customer_id, feedback_date, feedback_text, rating)
VALUES 
    (1, '2024-11-10', 'Great deals during the holiday sale!', 5),
    (2, '2024-10-17', 'Flash sale was too short.', 3),
    (3, '2024-11-15', 'Loved the discounts.', 4);

/* Data Management Page ------------------------------------------------------------------ */
INSERT INTO product_category (category_name)
VALUES 
    ('Electronics'),
    ('Home Appliances'),
    ('Furniture');

INSERT INTO product (product_name, category_id, unit_price, stock_quantity)
VALUES 
    ('Smartphone', 1, 699.99, 50),
    ('Microwave', 2, 120.00, 30),
    ('Office Chair', 3, 85.50, 20);

INSERT INTO warehouse (warehouse_name, location, capacity)
VALUES 
    ('Main Warehouse', '123 Industrial Rd, Springfield', 5000),
    ('Backup Warehouse', '456 Storage Ln, Shelbyville', 2000);

INSERT INTO inventory (product_id, warehouse_id, quantity)
VALUES 
    (1, 1, 40),
    (2, 1, 25),
    (3, 2, 15);