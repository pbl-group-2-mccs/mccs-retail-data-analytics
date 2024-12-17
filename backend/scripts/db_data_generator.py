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

# Create a price map for product_name -> unit_price
product_price_map = {}
products = []

# Generate products and populate product_price_map
for product_line, product_names in product_names_by_line.items():
    for product_name in product_names:
        unit_price = round(random.uniform(5.0, 100.0), 2)  # Assign a consistent price per product
        product_price_map[product_name] = unit_price  # Map product_name to unit_price
        quantity = random.randint(1, 200)  # Inventory quantity
        products.append((
            f"('{product_name}', '{product_line}', {quantity}, {unit_price})"
        ))

# Generate customers
customers = []
for _ in range(num_customers):
    phone_number = f"{random.randint(1000000000, 9999999999)}"
    customers.append((
        f"('{fake.name()}', '{fake.email()}', '{phone_number}', "
        f"'{fake.street_address()}', '{fake.city()}', '{fake.state()}', "
        f"'{fake.zipcode()}', 'USA')"
    ))

# Generate orders
orders = []
for _ in range(num_orders):
    customer_id = random.randint(1, num_customers)
    order_date = fake.date_between(start_date=datetime(2022, 1, 1), end_date=datetime(2024, 12, 31))
    product_name = random.choice(list(product_price_map.keys()))  # Pick a product name
    unit_price = product_price_map[product_name]  # Get consistent price from the map
    quantity = random.randint(1, 10)  # Generate a random quantity
    orders.append((
        f"({customer_id}, '{product_name}', '{order_date}', {quantity}, {unit_price}, "
        f"'{random.choice(['Pending', 'Completed', 'Cancelled'])}')"
    ))

# Generate SQL scripts
with open('/Users/henry/Desktop/Virginia Tech/2024 FALL/Lectures/PBL/Project/1216_Visualization/data.sql', 'w') as f:
    # Insert customers
    f.write("INSERT INTO customers (name, email, phone, address_line1, city, state, zip_code, country) VALUES\n")
    f.write(",\n".join(customers) + ";\n\n")

    # Insert products
    f.write("INSERT INTO inventory (product_name, product_line, quantity, unit_price) VALUES\n")
    f.write(",\n".join(products) + ";\n\n")

    # Insert orders
    f.write("INSERT INTO sales_order (customer_id, product_name, order_date, quantity, unit_price, status) VALUES\n")
    f.write(",\n".join(orders) + ";\n")

print("Data generation complete. SQL script saved as 'data.sql'.")
