## Anomaly Analysis

### Insert Anomaly

In the `orders_flat.csv` dataset, product information is stored together with order and customer information in the same table. Suppose the company wants to add a new product with attributes such as `product_id`, `product_name`, `category`, and `unit_price`. However, the table also requires order-related attributes like `order_id`, `customer_id`, and `order_date`. If no order has been placed yet for that product, the product cannot be inserted into the table.

Columns involved: `product_id`, `product_name`, `category`, `unit_price`, `order_id`, `customer_id`, `order_date`.

### Update Anomaly

Customer information such as `customer_name`, `customer_email`, and `customer_city` appears multiple times across different rows because a single customer can place multiple orders. For example, if `customer_id = CUST012` appears in several rows and the customer changes their city from Mumbai to Navi Mumbai, every row containing that customer must be updated. If one row is missed, the database will contain inconsistent information.

Columns involved: `customer_id`, `customer_name`, `customer_email`, `customer_city`.

### Delete Anomaly

If an order row is deleted, important information about products or customers may also be lost. For example, if a product with `product_id = P105` appears in only one order and that order is deleted, the database will lose all information about that product including `product_name`, `category`, and `unit_price`.

Columns involved: `order_id`, `product_id`, `product_name`, `category`, `unit_price'.



## Normalization Justification

Keeping all information in a single table may appear simpler at first, but it leads to several data integrity and maintenance problems. In the orders_flat dataset, customer information such as customer_name, customer_email, and customer_city is repeated across multiple rows whenever the same customer places multiple orders. Similarly, product information like product_name, category, and unit_price is also repeated for every order containing that product. This repetition leads to redundancy and increases the risk of inconsistencies.

For example, if a customer changes their city, every row containing that customer’s information must be updated. If one row is missed, the database will contain conflicting data. This is known as an update anomaly. Similarly, if a product exists in only one order and that order is deleted, the product information may also be lost, which creates a delete anomaly. In addition, inserting new products without existing orders becomes difficult because order-related attributes are required, causing an insert anomaly.

Normalization addresses these issues by separating the data into multiple related tables such as customers, products, orders, and sales representatives. Each table stores only the attributes that belong to that entity, and relationships are maintained using primary keys and foreign keys. This reduces redundancy, improves data consistency, and makes the database easier to maintain.

Therefore, normalization to Third Normal Form (3NF) is not over-engineering but a necessary design practice to ensure data integrity, scalability, and efficient database management.
