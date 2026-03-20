-- Customers Table
CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);

-- Products Table
CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

-- Sales Representatives Table
CREATE TABLE sales_reps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100) NOT NULL,
    office_address VARCHAR(200) NOT NULL
);

-- Orders Table
CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id VARCHAR(10),
    sales_rep_id VARCHAR(10),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);

-- Order Items Table
CREATE TABLE order_items (
    order_id VARCHAR(10),
    product_id VARCHAR(10),
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert Customers
INSERT INTO customers VALUES
('C001','Rahul Sharma','rahul@gmail.com','Mumbai'),
('C002','Anita Verma','anita@gmail.com','Delhi'),
('C003','Karan Mehta','karan@gmail.com','Bangalore'),
('C004','Priya Nair','priya@gmail.com','Chennai'),
('C005','Rohit Kapoor','rohit@gmail.com','Pune');

-- Insert Products
INSERT INTO products VALUES
('P101','Laptop','Electronics',75000),
('P102','Headphones','Electronics',2000),
('P103','Office Chair','Furniture',8500),
('P104','Keyboard','Electronics',1200),
('P105','Water Bottle','Accessories',500);

-- Insert Sales Representatives
INSERT INTO sales_reps VALUES
('S01','Amit Singh','amit@company.com','Mumbai Office'),
('S02','Neha Kapoor','neha@company.com','Delhi Office'),
('S03','Rakesh Iyer','rakesh@company.com','Bangalore Office'),
('S04','Sneha Patel','sneha@company.com','Ahmedabad Office'),
('S05','Vikas Jain','vikas@company.com','Pune Office');

-- Insert Orders
INSERT INTO orders VALUES
('O1001','2024-01-10','C001','S01'),
('O1002','2024-01-11','C002','S02'),
('O1003','2024-01-12','C003','S03'),
('O1004','2024-01-13','C004','S04'),
('O1005','2024-01-14','C005','S05');

-- Insert Order Items
INSERT INTO order_items VALUES
('O1001','P101',1),
('O1002','P102',2),
('O1003','P103',1),
('O1004','P104',3),
('O1005','P105',2);