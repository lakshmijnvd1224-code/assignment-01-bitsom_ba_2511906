-- Dimension Table: Date
CREATE TABLE dim_date (
    date_key INT PRIMARY KEY,
    order_date DATE,
    year INT,
    month INT,
    day INT
);

-- Dimension Table: Store
CREATE TABLE dim_store (
    store_key INT PRIMARY KEY,
    store_id VARCHAR(10),
    store_name VARCHAR(100),
    city VARCHAR(50)
);

-- Dimension Table: Product
CREATE TABLE dim_product (
    product_key INT PRIMARY KEY,
    product_id VARCHAR(10),
    product_name VARCHAR(100),
    category VARCHAR(50)
);

-- Fact Table: Sales
CREATE TABLE fact_sales (
    sales_key INT PRIMARY KEY,
    date_key INT,
    store_key INT,
    product_key INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    total_sales DECIMAL(10,2),

    FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
    FOREIGN KEY (store_key) REFERENCES dim_store(store_key),
    FOREIGN KEY (product_key) REFERENCES dim_product(product_key)
);


-- Insert Date Dimension
INSERT INTO dim_date VALUES
(1,'2024-01-01',2024,1,1),
(2,'2024-01-02',2024,1,2),
(3,'2024-02-01',2024,2,1);

-- Insert Store Dimension
INSERT INTO dim_store VALUES
(1,'S01','Central Mall Store','Mumbai'),
(2,'S02','City Plaza Store','Delhi'),
(3,'S03','Metro Store','Bangalore');

-- Insert Product Dimension
INSERT INTO dim_product VALUES
(1,'P101','Laptop','Electronics'),
(2,'P102','Headphones','Electronics'),
(3,'P103','T-Shirt','Clothing');


-- Insert Fact Sales
INSERT INTO fact_sales VALUES
(1,1,1,1,2,75000,150000),
(2,1,2,2,3,5000,15000),
(3,2,1,3,5,1200,6000),
(4,2,3,2,1,5000,5000),
(5,3,1,1,1,75000,75000),
(6,3,2,3,4,1200,4800),
(7,1,3,2,2,5000,10000),
(8,2,2,1,1,75000,75000),
(9,3,3,3,6,1200,7200),
(10,1,1,2,1,5000,5000);