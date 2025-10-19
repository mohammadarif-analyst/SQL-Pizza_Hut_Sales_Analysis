# SQL-Pizza_Hut_Sales_Analysis

🍕 Pizza Hut Sales Analysis (SQL)
Project Overview

This project analyzes Pizza Hut sales data using MySQL to uncover insights about sales, customer preferences, and revenue trends. The analysis focuses on:

Total orders and revenue generated

Most popular pizzas and categories

Hourly distribution of orders

Top-performing pizzas by quantity and revenue

Cumulative revenue trends over time

Objective: Provide actionable insights for marketing strategies, inventory planning, and operational decisions.

Dataset

The analysis uses four primary tables:

Table	Description
orders	Order-level data (order ID, date, time).
order_details	Pizza-specific order information (pizza ID, quantity).
pizzas	Pizza details including name, size, price, type.
pizza_types	Metadata about pizza types including category (e.g., Veg, Non-Veg).
Key SQL Techniques Used

Aggregate Functions: SUM(), COUNT(), AVG()

Joins: INNER JOIN, JOIN

Grouping & Sorting: GROUP BY, ORDER BY

Subqueries and Common Table Expressions (CTEs)

Window Functions: RANK(), SUM() OVER()

These techniques demonstrate practical SQL skills for data analysis and business insights.

Analysis and Insights

Total Orders: Measures overall customer engagement; high order volume indicates strong demand.

Total Revenue: Evaluates store performance and tracks financial growth.

Highest-Priced Pizza: Highlights premium items for pricing and promotional strategy.

Most Common Pizza Size: Guides inventory, menu planning, and marketing campaigns.

Top 5 Pizza Types by Quantity: Identifies best-sellers for strategic focus.

Total Quantity per Category: Shows popularity of pizza categories for stocking and marketing.

Orders by Hour: Reveals peak hours; helps optimize staffing and delivery.

Category-Wise Pizza Distribution: Demonstrates menu variety and composition.

Average Pizzas per Day: Supports daily demand forecasting.

Top 3 Pizzas by Revenue: Highlights revenue-driving items.

Percentage Contribution of Each Category to Revenue: Shows which categories are most profitable.

Cumulative Revenue Over Time: Tracks revenue growth trends.

Top 3 Pizza Types by Revenue per Category: Helps with category-focused marketing and inventory planning.
