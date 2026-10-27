# NovaMart — SQL Analytics Case Study

## Project Overview

This project explores an e-commerce business using **MySQL** to analyze customer behavior, sales performance, product profitability, payment transactions, marketing campaigns, and customer support operations.

The goal is to demonstrate practical SQL skills by answering business questions, identifying trends, and translating raw data into actionable insights.

## Business Scenario

NovaMart is a fictional e-commerce company that wants to understand its customers, improve product performance, monitor payments, evaluate marketing campaigns, and improve customer support.

This project simulates the work of a Data Analyst investigating these business areas using SQL.

## Dataset

The project contains seven relational tables with sample e-commerce data.

| Table | Records |
|---|---:|
| Customers | 200 |
| Products | 80 |
| Orders | 1,000 |
| Payments | 1,000 |
| Employees | 35 |
| Marketing Campaigns | 15 |
| Support Tickets | 300 |

The dataset includes different order statuses, payment outcomes, customer segments, product categories, marketing metrics, and support ticket statuses.

**Note:** NovaMart and its dataset are fictional and intended for learning and portfolio demonstration.

## Tools and Technologies

- **MySQL** — querying and analyzing relational data
- **SQL** — data aggregation, filtering, joins, and business analysis
- **GitHub** — project version control and documentation

## Database Schema

The database contains seven tables connected through primary and foreign keys.

- `customers` — customer details, location, signup date, and segment
- `products` — product categories, prices, costs, and inventory
- `orders` — order dates, quantities, selling prices, and order statuses
- `payments` — payment methods, amounts, and payment statuses
- `employees` — departments, job titles, salaries, and reporting relationships
- `marketing_campaigns` — campaign budgets, impressions, clicks, conversions, and revenue
- `support_tickets` — customer issues, priorities, resolution status, and satisfaction scores

## SQL Analysis

The project uses interview-style SQL questions and business case studies to explore:

### 1. Sales and Revenue Analysis
- Calculate revenue from completed orders.
- Analyze monthly revenue trends.
- Identify top-performing products and categories.
- Compare product revenue and profitability.

### 2. Customer Analysis
- Analyze customer segments and geographic distribution.
- Identify repeat customers.
- Rank customers by completed-order spending.
- Find customers who have never placed an order.
- Classify customers based on spending.

### 3. Payment Analysis
- Calculate payment success rates.
- Analyze payment amounts by payment method.
- Identify failed payments.
- Investigate customers without successful payments.

### 4. Employee and Support Analysis
- Compare average salaries across departments.
- Analyze support ticket statuses and priorities.
- Explore employee involvement in ticket resolution.

### 5. Marketing Campaign Analysis
- Compare campaign budgets and generated revenue.
- Examine clicks and conversions.
- Calculate campaign performance metrics.

## SQL Concepts Practiced

- `SELECT`, `WHERE`, `ORDER BY`, and `LIMIT`
- Aggregate functions: `SUM()`, `AVG()`, `COUNT()`
- `GROUP BY` and `HAVING`
- `INNER JOIN` and `LEFT JOIN`
- Subqueries and correlated subqueries
- `CASE WHEN` and conditional aggregation
- Common Table Expressions (CTEs)
- Window functions: `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`, and `LAG()`
- Date functions and monthly trend analysis

## Repository Structure

```text
SQL-Analytics-Case-Study/
├── README.md
├── schema/
├── data/
├── queries/
└── screenshots/
```

The folders contain the database schema, sample dataset, analytical SQL scripts, and supporting screenshots.

## How to Run the Project

1. Install MySQL Server and MySQL Workbench.
2. Clone or download this repository.
3. Execute the table-creation SQL script.
4. Import or execute the dataset SQL file to populate the tables.
5. Run the analytical queries in MySQL Workbench.
6. Review the query results to explore the business questions.

Execute the schema script before importing the dataset to ensure that the required tables and relationships exist.

## Project Goals

- Strengthen practical SQL skills through hands-on analysis.
- Apply SQL concepts to realistic business questions.
- Explore customer, product, sales, payment, marketing, and support data.
- Build a reproducible SQL portfolio project for Data Analyst applications.

## Future Improvements

- Expand advanced SQL analysis using CTEs and window functions.
- Document key business findings with query results.
- Add screenshots of the database schema and analytical outputs.
- Develop a Power BI dashboard using the analyzed data.

---

**Author:** Rayan Uddin

**Project Type:** Data Analytics | SQL Case Study

**Database:** MySQL
