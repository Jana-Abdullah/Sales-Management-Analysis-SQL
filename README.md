# Sales-Management-Analysis-SQL

## Project Overview
This project is a SQL-based analytics solution designed to evaluate **sales performance**, **product performance**, and **geographical revenue distribution**.

Using transactional sales data, the project applies advanced SQL techniques (CTEs, window functions, ranking, and pivoting) to transform raw data into actionable business insights.

---

## Business Objectives
- Measure overall revenue performance
- Track sales trends (Yearly, Quarterly, Monthly)
- Identify top-performing products
- Analyze revenue by country
- Evaluate deal size contribution
- Measure year-over-year growth

---

## Dataset

**Table:** `sales_data_sample`

### Key Columns
- `ORDERNUMBER`
- `ORDERDATE`
- `SALES`
- `QUANTITYORDERED`
- `PRODUCTLINE`
- `COUNTRY`
- `DEALSIZE`

---

## Analysis Breakdown

### 1️⃣ Executive KPIs
- Total Revenue  
- Total Orders  
- Total Quantity Sold  
- Average Order Value (AOV)

### 2️⃣ Time-Based Analysis
- Yearly / Quarterly / Monthly Sales  
- Year-over-Year Growth (`LAG`)  
- Running Total Revenue  

### 3️⃣ Product Analysis
- Revenue by Product Line  
- Quantity by Product Line  
- Product Ranking (`RANK()`)

### 4️⃣ Geographical Analysis
- Revenue by Country  
- Country Ranking by Sales  

### 5️⃣ Deal Size Analysis
- Revenue by Deal Size  
- Pivot Table (Year × Deal Size)

---

## SQL Concepts Used
- `GROUP BY`, `ORDER BY`
- Aggregate Functions (`SUM`, `COUNT`, `ROUND`)
- `DATEPART()`
- CTE (`WITH`)
- Window Functions (`RANK()`, `LAG()`, `SUM() OVER()`)
- `PIVOT`

---

## Technologies
- SQL Server  
- T-SQL  
- SQL Server Management Studio (SSMS)

---

## Future Improvements
- Customer segmentation
- RFM analysis
- Power BI dashboard integration
- Time-series forecasting

---

## Author
**Jana A**  
Computer Science Student | Aspiring Data Analyst  
SQL • Data Analysis • Business Intelligence
