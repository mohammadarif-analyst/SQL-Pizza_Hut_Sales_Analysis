# SQL-Pizza_Hut_Sales_Analysis

# 🍕 Pizza Hut Sales Analysis (SQL)

## Project Overview
This project analyzes Pizza Hut sales data using MySQL to uncover insights about sales, customer preferences, and revenue trends.  
The analysis focuses on:

- Total orders and revenue generated
- Most popular pizzas and categories
- Hourly distribution of orders
- Top-performing pizzas by quantity and revenue
- Cumulative revenue trends over time

**Objective:** Provide actionable insights for marketing strategies, inventory planning, and operational decisions.

---

## Dataset
The project uses four main tables:

| Table | Description |
|-------|-------------|
| `orders` | Order-level data (order ID, date, time) |
| `order_details` | Pizza-specific order details (pizza ID, quantity) |
| `pizzas` | Pizza details (name, size, price, type) |
| `pizza_types` | Pizza type metadata (name, category) |

---

## Key SQL Techniques Used
- Aggregate Functions: `SUM()`, `COUNT()`, `AVG()`
- Joins: `INNER JOIN`, `JOIN`
- Grouping & Sorting: `GROUP BY`, `ORDER BY`
- Subqueries and Common Table Expressions (CTEs)
- Window Functions: `RANK()`, `SUM() OVER()`

---

## Analysis and Insights

1. **Total Orders**: Measures overall customer engagement; high order volume indicates strong demand.
2. **Total Revenue**: Evaluates store performance and tracks financial growth.
3. **Highest-Priced Pizza**: Highlights premium items for pricing and promotions.
4. **Most Common Pizza Size**: Guides inventory and menu planning.
5. **Top 5 Pizza Types by Quantity**: Identifies best-sellers for strategic focus.
6. **Total Quantity per Category**: Shows popularity of pizza categories.
7. **Orders by Hour**: Reveals peak hours; helps optimize staffing and delivery.
8. **Category-Wise Pizza Distribution**: Shows menu variety and composition.
9. **Average Pizzas per Day**: Supports daily demand forecasting.
10. **Top 3 Pizzas by Revenue**: Highlights revenue-driving items.
11. **Percentage Contribution of Each Category to Revenue**: Shows most profitable categories.
12. **Cumulative Revenue Over Time**: Tracks revenue growth trends.
13. **Top 3 Pizza Types by Revenue per Category**: Helps with category-focused marketing and inventory planning.

---



