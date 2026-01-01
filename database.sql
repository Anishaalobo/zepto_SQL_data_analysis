# use zepto_db database
USE zepto_db;


# Select full data
SELECT * FROM zepto_inventory;


# Show first 10 rows
SELECT * FROM zepto_inventory
LIMIT 10;


# Count total records
SELECT COUNT(*) AS total_products
FROM zepto_inventory;


# Category-wise product count
SELECT Category, COUNT(*) AS total_items
FROM zepto_inventory
GROUP BY Category
ORDER BY total_items DESC;


# Total stock available in dataset
# Shows how much total quantity is present
SELECT SUM(availableQuantity) AS total_available_stock
FROM zepto_inventory;


# Products that are out of stock
SELECT *
FROM zepto_inventory
WHERE outOfStock = 'TRUE';


# Low stock products
# Helps identify items that may need restocking soon
SELECT name, Category, availableQuantity
FROM zepto_inventory
WHERE availableQuantity <= 5;


# Highest discount products
SELECT name, Category, mrp, discountedSellingPrice, discountPercent
FROM zepto_inventory
ORDER BY discountPercent DESC
LIMIT 10;


# Average discount
SELECT AVG(discountPercent) AS average_discount
FROM zepto_inventory;


# Most demanded products (Assuming quantity represents demand)
SELECT name, Category, quantity
FROM zepto_inventory
ORDER BY quantity DESC
LIMIT 10;


