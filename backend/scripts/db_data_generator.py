from faker import Faker
import random
from datetime import datetime

fake = Faker()

# Number of records to generate
# generate more or less sample data below.
num_customers = 50
num_products = 100
num_orders = 1000

# Generate customers
customers = []
for _ in range(num_customers):
    phone_number = f"{random.randint(1000000000, 9999999999)}"  # Generates a random 10-digit number
    customers.append((
        f"('{fake.name()}', '{fake.email()}', '{phone_number}', "
        f"'{fake.street_address()}', '{fake.city()}', '{fake.state()}', "
        f"'{fake.zipcode()}', 'USA')"
    ))

# Generate products
products = []
for i in range(num_products):
    products.append((
        f"('{fake.word().capitalize()} {i+1}', "
        f"'{random.choice(['Electronics', 'Home & Garden', 'Toys', 'Clothing'])}', "
        f"{random.randint(1, 200)}, "
        f"{round(random.uniform(5.0, 100.0), 2)})"
    ))

# Generate orders
orders = []
for _ in range(num_orders):
    customer_id = random.randint(1, num_customers)
    # Generate a random date between 2022-01-01 and 2024-12-31
    order_date = fake.date_between(start_date=datetime(2022, 1, 1), end_date=datetime(2024, 12, 31))
    total_amount = round(random.uniform(20.0, 500.0), 2)
    orders.append((
        f"({customer_id}, '{order_date}', {total_amount}, '{random.choice(['Pending', 'Completed', 'Cancelled'])}')"
    ))

# Generate SQL scripts
with open('insert_data.sql', 'w') as f:
    # Insert customers
    f.write("INSERT INTO customers (name, email, phone, address_line1, city, state, zip_code, country) VALUES\n")
    f.write(",\n".join(customers) + ";\n\n")

    # Insert products
    f.write("INSERT INTO inventory (product_name, product_line, quantity, price) VALUES\n")
    f.write(",\n".join(products) + ";\n\n")

    # Insert orders
    f.write("INSERT INTO sales_order (customer_id, order_date, total_amount, status) VALUES\n")
    f.write(",\n".join(orders) + ";\n")

print("Data generation complete. SQL script saved as 'insert_data.sql'.")