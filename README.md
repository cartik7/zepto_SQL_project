**📊 Zepto Data Analysis Project (SQL)
📌 Project Overview**
This project focuses on analyzing Zepto product data using SQL to extract meaningful business insights.
The goal is to perform data exploration, data cleaning, and business-driven analysis to support decision-making related to pricing, discounts, inventory, and revenue.


🗂 **Dataset Description**
The dataset contains product-level information from Zepto, including:
•	Product identifiers
•	Categories
•	Pricing and discount details
•	Stock availability
•	Product weight and quantity

**Table Structure**

sku_id                  → Unique product ID  
category                → Product category  
name                    → Product name  
mrp                     → Maximum Retail Price  
discountPercent         → Discount percentage  
availableQuantity       → Available stock  
discountedSellingPrice  → Selling price after discount  
WeightInGms             → Product weight in grams  
OutOfStock              → Stock status (True/False)  
quantity                → Quantity per unit 

**🛠 Tools & Technologies**
•	SQL (PostgreSQL)
•	Database Management
•	Data Cleaning & Transformation
•	Business Analytics

**🔍 Data Exploration**
The initial exploration includes:
•	Total row count
•	Sample data inspection
•	Null value detection
•	Identifying unique product categories
•	Stock availability analysis
•	Detecting duplicate product names

**🧹 Data Cleaning Steps**
•	Removed products with MRP = 0
•	Converted price values from paise to rupees
•	Ensured consistency in pricing columns
•	Validated null and invalid records

**📈 Business Insight Queries** 

1️⃣ Top 10 Best-Value Products
Identified products offering the highest discounts, helping customers find maximum value.

2️⃣ High-MRP Out-of-Stock Products
Analyzed premium products (MRP > ₹300) that are currently unavailable, useful for restocking strategies.

3️⃣ Estimated Revenue by Category
Calculated potential revenue per category based on available stock and selling price.

4️⃣ Expensive Products with Low Discounts
Filtered high-priced products (MRP > ₹500) offering minimal discounts to assess pricing strategy.

5️⃣ Categories with Highest Average Discounts
Ranked the top 5 categories providing the most average discounts.

6️⃣ Value-for-Money Analysis
Computed price per gram to identify products delivering better value to customers.

7️⃣ Product Weight Classification
Grouped products into:
Low (≤ 200g)
Medium (201g – 800g)
Bulk (> 800g)

8️⃣ Inventory Weight Analysis
Measured total inventory weight per category to assist logistics and warehouse planning.

**📊 Key Insights**
•	Certain categories consistently offer higher discounts.
•	Premium products face frequent stock-out issues.
•	Bulk products contribute significantly to inventory weight.
•	Price-per-gram analysis highlights strong value products.

**🚀 Conclusion**
This project demonstrates how SQL can be effectively used for real-world data analysis, covering:
•	Data cleaning
•	Exploratory analysis
•	Business-oriented insights
It showcases strong SQL fundamentals and analytical thinking.




