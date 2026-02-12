# Zepto Retail Inventory SQL Analysis (Project P2)


## Executive Summary

A retail product and inventory dataset was analyzed using PostgreSQL to generate pricing, discount, and stock-level insights. The project focuses on database creation, data cleaning, exploratory analysis, and business-driven SQL queries on product catalog data.

The objective is to simulate real-world retail analytics using structured SQL workflows and derive insights around product value, discount strategy, inventory distribution, and category-level metrics.

- The query outputs help stakeholders understand:

- Which products offer the highest discounts

- Which categories carry the highest inventory weight

- Which items are high-priced but out of stock

- Which categories provide the best average discount

- Which products deliver best value per gram




## Business Questions Solved

Using SQL queries, the analysis answers practical retail and inventory questions including top discounted products, high-MRP out-of-stock items, estimated category-level revenue based on available inventory, low-discount premium products, top categories by average discount percentage, price-per-gram value comparisons, product segmentation by weight bands, and total inventory weight by category.




## Methodology

- Created PostgreSQL database and product table schema

- Imported product CSV dataset into structured table

- Performed data exploration and validation checks

- Identified duplicate product names and category spread

- Detected and removed invalid zero-price records

- Standardized price units (paise → rupees conversion)

- Executed analytical queries for pricing, discount, and inventory insights




## Key SQL Skills Demonstrated
- DDL & schema design , Data cleaning using DELETE and UPDATE, Aggregations and grouping, Conditional logic using CASE, Derived metric calculations, Numeric transformations, DISTINCT and duplicate detection, Business-focused analytical querying.




## Results & Insights Enabled

The SQL analysis enables teams to quickly evaluate discount effectiveness, compare product value across weight ranges, estimate inventory-linked revenue potential, detect premium items with low promotional support, and measure stock distribution across categories. These queries support faster pricing decisions, assortment planning, and inventory reporting while reducing repeated manual analysis effort.
