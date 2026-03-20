// OP1: insertMany() — insert all 3 documents

db.products.insertMany([
{
  product_id: "E101",
  name: "Laptop",
  category: "Electronics",
  price: 75000,
  specifications: {
    brand: "Dell",
    warranty_years: 2,
    voltage: "220V"
  },
  features: ["SSD", "16GB RAM", "Backlit Keyboard"]
},

{
  product_id: "C201",
  name: "Men T-Shirt",
  category: "Clothing",
  price: 1200,
  details: {
    brand: "Nike",
    fabric: "Cotton",
    sizes: ["S","M","L","XL"]
  },
  colors: ["Black","White","Blue"]
},

{
  product_id: "G301",
  name: "Organic Milk",
  category: "Groceries",
  price: 60,
  nutrition: {
    calories: 150,
    protein: "8g",
    fat: "8g"
  },
  expiry_date: "2024-12-30",
  storage: "Refrigerated"
}
]);


// OP2: find() — retrieve Electronics products with price > 20000

db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});


// OP3: find() — retrieve groceries expiring before 2025-01-01

db.products.find({
  category: "Groceries",
  expiry_date: { $lt: "2025-01-01" }
});


// OP4: updateOne() — add discount_percent field

db.products.updateOne(
  { product_id: "E101" },
  { $set: { discount_percent: 10 } }
);


// OP5: createIndex() — create an index on category field
// Index improves query performance by allowing MongoDB to quickly filter
// products by category instead of scanning the entire collection.

db.products.createIndex({ category: 1 });