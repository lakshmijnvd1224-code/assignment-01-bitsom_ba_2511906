## ETL Decisions

### Decision 1 — Date Format Standardization
Problem: The raw retail_transactions.csv contained inconsistent date formats such as DD-MM-YYYY and YYYY/MM/DD, which makes analysis difficult.

Resolution: All dates were converted into a standardized YYYY-MM-DD format before loading into the warehouse and stored in the dim_date table.

### Decision 2 — Handling NULL Values
Problem: Some rows contained NULL values for product category or store information, which would break dimension relationships.

Resolution: Missing values were either filled with standardized placeholders or removed during the transformation stage to maintain referential integrity.

### Decision 3 — Category Case Standardization
Problem: Product categories appeared with inconsistent casing such as “electronics”, “Electronics”, and “ELECTRONICS”.

Resolution: All category values were converted to consistent title case format (e.g., Electronics, Clothing) during the transformation process before loading into the dim_product table.