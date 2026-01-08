drop table if exists zepto;

CREATE TABLE zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
WeightInGms INTEGER,
OutOfStock BOOLEAN,
quantity INTEGER
);

--DATA EXPLORATION
--count of rows
SELECT COUNT(*) FROM zepto

-- sample data
SELECT  *
FROM zepto
LIMIT 10;

--null values
SELECT *
FROM zepto
WHERE category IS  NULL
   OR name IS NULL
   OR mrp IS NULL
   OR discountpercent IS NULL
   OR availablequantity IS NULL
   OR discountedsellingprice IS NULL
   OR weightingms IS NULL
   OR outofstock IS NULL
   OR quantity IS NULL;

--different product categories
SELECT DISTINCT(category)
FROM zepto
ORDER BY category;

--products in stock v/s out of  stock
SELECT OutOfStock, COUNT(*)
FROM zepto
GROUP BY OutOfStock;

--product names present multiple times
SELECT name, COUNT(sku_id) AS nos_of_present
FROM zepto
GROUP BY name
HAVING COUNT(sku_id) > 1
ORDER BY nos_of_present DESC;

--DATA CLEANING

--products with price = 0
SELECT *
FROM zepto
WHERE mrp =0 

--deleting product with price = 0
DELETE 
FROM zepto
WHERE  mrp =0;

--coverting mrp = paise to mrp = ruppess
UPDATE zepto
SET mrp =  mrp/100.0,
discountedsellingprice = discountedsellingprice/ 100.0;

SELECT mrp, discountedsellingprice 
FROM zepto

--business insight queries

--(.1) Found top 10 best-value products based on discount percentage

SELECT DISTINCT name, mrp, discountpercent
FROM zepto
ORDER BY discountpercent DESC
LIMIT 10;

--(.2)Identified high-MRP products that are currently out of stock

SELECT DISTINCT name, mrp
FROM zepto
WHERE outofstock = 'true' AND mrp > 300
ORDER BY  mrp DESC

--(.3)Estimated potential revenue for each product category
SELECT category,
       SUM(discountedsellingprice * availablequantity) AS estimated_revenue
FROM zepto
GROUP BY category
ORDER BY estimated_revenue;

--(.4)Filtered expensive products (MRP > ₹500) with minimal discount

SELECT DISTINCT name, mrp, discountpercent
FROM zepto
WHERE mrp > 500 AND discountpercent < 10
ORDER BY discountpercent DESC;

--(.5)Ranked top 5 categories offering highest average discounts
SELECT category, 
       ROUND(AVG(discountpercent),2) AS avg_discount
FROM zepto
GROUP BY category
ORDER  BY avg_discount DESC
LIMIT 5;

--(.4)Calculated price per gram to identify value-for-money products
SELECT name, 
       ROUND(SUM(discountedsellingprice)/ NULLIF(SUM(weightingms), 0), 4) AS value_for_money
FROM zepto
GROUP BY name

--(.5)Grouped products based on weight into Low, Medium, and Bulk categories
SELECT DISTINCT name,
                weightingms,
				CASE
				    WHEN weightingms <= 200
					THEN 'LOW'

					WHEN weightingms BETWEEN 201 AND 800
					THEN 'MEDIUM'

					ELSE 'BULK'
				END AS category
FROM zepto

--(.6)Measured total inventory weight per product category
SELECT category,
       SUM(weightingms * availablequantity) AS total_inventory_weight
FROM zepto
GROUP BY category


