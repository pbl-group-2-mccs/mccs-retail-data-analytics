from faker import Faker
import random
from datetime import datetime

fake = Faker()

# Number of records to generate
num_customers = 100
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

# List of 52 states including DC and Puerto Rico
states = [
    'Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut', 'Delaware', 'District of Columbia', 'Florida',
    'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland',
    'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire',
    'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota', 'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania',
    'Rhode Island', 'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington',
    'West Virginia', 'Wisconsin', 'Wyoming', 'Puerto Rico', 'District of Columbia'
]

# Ensure each state is included at least once
states_shuffled = random.sample(states, len(states))  # Shuffle the states so we can use each one
remaining_states = states_shuffled[:num_customers]  # If there are more customers than states, we may need to repeat states

# Generate customers
customers = []
for i in range(num_customers):
    phone_number = f"{random.randint(1000000000, 9999999999)}"
    # Ensure that one of the 52 states is always included
    state = remaining_states[i % len(remaining_states)]  # Ensure all states appear by cycling through remaining_states
    customers.append((
        f"('{fake.name()}', '{fake.email()}', '{phone_number}', "
        f"'{fake.street_address()}', '{fake.city()}', '{state}', "
        f"'{fake.zipcode()}', 'USA')"
    ))

# Generate orders
orders = []
for order_id in range(1, 101):  # Create 100 orders with order_id from 1 to 100
    customer_id = order_id  # Map order_id directly to customer_id (1 to 100)
    order_date = fake.date_between(start_date=datetime(2022, 1, 1), end_date=datetime(2024, 12, 31))
    product_name = random.choice(list(product_price_map.keys()))  # Pick a product name
    unit_price = product_price_map[product_name]  # Get consistent price from the map
    quantity = random.randint(1, 10)  # Generate a random quantity
    orders.append((
        f"({customer_id}, '{product_name}', '{order_date}', {quantity}, {unit_price}, "
        f"'{random.choice(['Pending', 'Completed', 'Cancelled'])}')"
    ))
for _ in range(101, num_orders):
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
