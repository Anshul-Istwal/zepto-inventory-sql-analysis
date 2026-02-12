CREATE DATABASE zepto_SQL_project;

DROP TABLE IF EXISTS zepto;

CREATE TABLE zepto(
	sku_id SERIAL PRIMARY KEY,
	category VARCHAR (120),
	name VARCHAR (150) NOT NULL,
	mrp NUMERIC(8,2), 
	discountPercent NUMERIC(5,2),
	availableQuantity INTEGER,
	discountedSellingPrice NUMERIC (8,2),
	weightInGms INTEGER ,
	outOfStock BOOLEAN ,
	quantity Integer
);


--data exploration

--count of rows
SELECT COUNT(*)
FROM zepto;


--sample data
SELECT * 
FROM zepto
LIMIT 10;


--null values
SELECT *
FROM zepto
WHERE category IS NULL
OR
	name IS NULL
OR
	mrp IS NULL
OR
	discountpercent IS NULL
OR
	availablequantity IS NULL
OR
	discountedsellingprice IS NULL
OR
	weightingms IS NULL
OR
	outofstock IS NULL
OR
	quantity IS NULL;

--different product categories
SELECT DISTINCT category
FROM zepto
ORDER BY category;

--products in stock vs out of stock
SELECT outofstock, COUNT(*) AS no_of_items
FROM zepto
GROUP BY 1;
	
--product names present multiple times
SELECT name , COUNT(*) AS "No. of SKUs"
FROM zepto
GROUP BY name
HAVING COUNT(name) > 1
ORDER BY COUNT(*) DESC;


--data cleaning

--products with price 0
SELECT *
FROM zepto
WHERE mrp = 0 OR discountedsellingprice = 0;

DELETE FROM zepto
WHERE mrp = 0; 


--convert paise to rupees
UPDATE zepto
SET mrp = mrp/100.0,
discountedsellingprice = discountedsellingprice/100.0;

SELECT mrp, discountedsellingprice
FROM zepto;

--data analysis

----Q1. Find the top 10 best-value products based on the discount percentage.
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;


----Q2.What are the Products with High MRP but Out of Stock
SELECT DISTINCT name, mrp,outofstock
FROM zepto 
WHERE outofstock = true AND mrp > 300
ORDER BY mrp DESC;


----Q3.Calculate Estimated Revenue for each category
SELECT DISTINCT category , SUM(discountedsellingprice*availablequantity) AS total_revenue
FROM zepto 
GROUP BY 1
ORDER BY total_revenue;


----Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
SELECT DISTINCT name, mrp, discountpercent
FROM zepto
WHERE mrp > 500 AND discountpercent < 10
ORDER BY mrp DESC, discountpercent DESC;


----Q5. Identify the top 5 categories offering the highest average discount percentage.
SELECT category, ROUND(AVG(discountpercent),2) AS avg_discount_percentage
FROM zepto
GROUP BY 1
ORDER BY AVG(discountpercent) DESC
LIMIT 5;


----Q6. Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT name, weightInGms, discountedSellingPrice,
ROUND(discountedSellingPrice/weightInGms,2) AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram;


--Q7.Group the products into weight categories like Low, Medium, Bulk.
SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
	WHEN weightInGms < 5000 THEN 'Medium'
	ELSE 'Bulk'
	END AS weight_category
FROM zepto;


--Q8.What is the Total Inventory Weight Per Category 
SELECT category,
SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight;

