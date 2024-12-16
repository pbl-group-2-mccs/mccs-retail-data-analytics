from faker import Faker
import random
from datetime import datetime

fake = Faker()

# Number of records to generate
num_customers = 50
num_products = 100
num_orders = 1000

# Product line-specific names
product_names_by_line = {
    'Electronics': ['Smartphone', 'Laptop', 'Headphones', 'Smartwatch', 'Tablet'],
    'Home & Garden': ['Lawn Mower', 'Blender', 'Vacuum Cleaner', 'Grill', 'Lamp'],
    'Toys': ['Action Figure', 'Board Game', 'Doll', 'Puzzle', 'Toy Car'],
    'Clothing': ['T-shirt', 'Jeans', 'Jacket', 'Sneakers', 'Socks']
}

# Generate customers
customers = []
for _ in range(num_customers):
    phone_number = f"{random.randint(1000000000, 9999999999)}"
    customers.append((
        f"('{fake.name()}', '{fake.email()}', '{phone_number}', "
        f"'{fake.street_address()}', '{fake.city()}', '{fake.state()}', "
        f"'{fake.zipcode()}', 'USA')"
    ))

# Generate products
products = []
for _ in range(num_products):
    product_line = random.choice(list(product_names_by_line.keys()))
    product_name = random.choice(product_names_by_line[product_line])
    products.append((
        f"('{product_name}', "
        f"'{product_line}', "
        f"{random.randint(1, 200)}, "
        f"{round(random.uniform(5.0, 100.0), 2)})"
    ))

# Generate orders
orders = []
for _ in range(num_orders):
    customer_id = random.randint(1, num_customers)
    # Random date between 2022-01-01 and 2024-12-31
    order_date = fake.date_between(start_date=datetime(2022, 1, 1), end_date=datetime(2024, 12, 31))
    total_amount = round(random.uniform(20.0, 500.0), 2)
    product_id = random.randint(1, num_products)
    orders.append((
        f"({customer_id}, {product_id}, '{order_date}', {total_amount}, "
        f"'{random.choice(['Pending', 'Completed', 'Cancelled'])}')"
    ))

# Generate SQL scripts
with open('data.sql', 'w') as f:
    # Insert customers
    f.write("INSERT INTO customers (name, email, phone, address_line1, city, state, zip_code, country) VALUES\n")
    f.write(",\n".join(customers) + ";\n\n")

    # Insert products
    f.write("INSERT INTO inventory (product_name, product_line, quantity, price) VALUES\n")
    f.write(",\n".join(products) + ";\n\n")

    # Insert orders
    f.write("INSERT INTO sales_order (customer_id, product_id, order_date, total_amount, status) VALUES\n")
    f.write(",\n".join(orders) + ";\n")

print("Data generation complete. SQL script saved as 'data.sql'.")
