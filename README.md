# Zepto Inventory SQL Data Analysis

## Project Overview
This project focuses on analyzing Zepto’s inventory dataset using SQL to extract meaningful business insights. The analysis helps understand:

- Product category distribution  
- Stock availability and shortages  
- Low-stock and out-of-stock alerts  
- Price and discount trends  
- High-demand products  

The objective is to support inventory planning and decision-making.

## Tools and Technologies
- MySQL 8  
- Visual Studio Code  
- SQLTools Extension (with MySQL)  
- CSV Dataset(viewed using Excel)
- SQL Query Language  

## VS Code Setup 
1. Install Visual Studio Code  
2. Install the extension: **SQLTools**  
3. Install: **SQLTools MySQL**  
4. Open VS Code → Open your project folder  
5. Configure connection:
   - Host: `127.0.0.1`
   - Port: `3306`
   - User: `root`
   - Password: `819818`
   - Database: `zepto_db`
6. Click Connect.


## Dataset Description
Key dataset fields include:

| Column | Description |
|--------|-------------|
| Category | Product category |
| name | Product name |
| mrp | Maximum Retail Price |
| discountPercent | Discount percentage |
| availableQuantity | Stock quantity available |
| discountedSellingPrice | Final selling price |
| weightInGms | Product weight |
| outOfStock | Availability status |
| quantity | Demand or order indicator |

## Database Used
```sql
USE zepto_db;
```

---

## Dataset Table
All queries are executed on the table:
```sql
SELECT * FROM zepto_inventory;
```

## Queries Performed

### 1.Show First 10 Records
Quick preview of first 10 records.
```sql
SELECT * FROM zepto_inventory
LIMIT 10;
```

---

### 2.Count Total Products
Returns total number of records.
```sql
SELECT COUNT(*) AS total_products
FROM zepto_inventory;
```

---

### 3.Category-Wise Product Count
Shows distribution of items across categories.
```sql
SELECT Category, COUNT(*) AS total_items
FROM zepto_inventory
GROUP BY Category
ORDER BY total_items DESC;
```

---

### 4.Total Available Stock
Calculates total stocks available.
```sql
SELECT SUM(availableQuantity) AS total_available_stock
FROM zepto_inventory;
```

---

### 5.Out of Stock Products
Lists all products that are out of stock.
```sql
SELECT *
FROM zepto_inventory
WHERE outOfStock = 'TRUE';
```

---

### 6.Low Stock Products
Identifies items that may need restocking soon.
```sql
SELECT name, Category, availableQuantity
FROM zepto_inventory
WHERE availableQuantity <= 5;
```

---

### 7.Highest Discount Products
Displays top 10 highest discount items.
```sql
SELECT name, Category, mrp, discountedSellingPrice, discountPercent
FROM zepto_inventory
ORDER BY discountPercent DESC
LIMIT 10;
```

---

### 8.Average Discount
Calculates average discount across products.
```sql
SELECT AVG(discountPercent) AS average_discount
FROM zepto_inventory;
```

---

### 9.Most Demanded Products
```sql
SELECT name, Category, quantity
FROM zepto_inventory
ORDER BY quantity DESC
LIMIT 10;
```

---

## Outcome
These SQL queries help to understand:

- How products are distributed across categories  
- Total inventory volume available  
- Which products are out of stock  
- Which products require urgent restocking  
- Which items are heavily discounted  
- Customer demand patterns through quantity insights  

---

## Key Findings
- The dataset contains multiple product categories with varying stock distribution  
- Several products were identified as low stock, indicating potential replenishment requirements  
- Some products were completely out of stock, reflecting strong demand or supply issues  
- Discount data revealed price strategies and promotional intensity  
- Demand analysis highlighted highly popular and frequently purchased items  

---

## Conclusion
This project demonstrates the practical use of SQL for performing inventory analysis in MySQL through Visual Studio Code.  
The queries helped derive meaningful business insights including stock availability, demand behavior, pricing influence, and inventory health.


