use pizzahut;

-- Retrieve the total number of orders placed.
SELECT 
    COUNT(order_id) AS total_number
FROM
    orders;

-- Calculate the total revenue generated from pizza sales.

SELECT 
    ROUND(SUM(o.quantity * p.price), 2) AS total_sales
FROM
    pizzas AS p
        JOIN
    order_details AS o ON p.pizza_id = o.pizza_id;


-- Identify the highest-priced pizza.

SELECT 
    pt.name, p.price
FROM
    pizza_types AS pt
        INNER JOIN
    pizzas AS p ON pt.pizza_type_id = p.pizza_type_id
ORDER BY p.price DESC
LIMIT 1;

-- Identify the most common pizza size ordered.
SELECT 
    p.size, SUM(od.quantity) AS total_quantity
FROM
    pizzas AS p
        INNER JOIN
    order_details AS od ON p.pizza_id = od.pizza_id
GROUP BY p.size
ORDER BY total_quantity DESC;

-- List the top 5 most ordered pizza types along with their quantities.
SELECT 
    pt.name, SUM(od.quantity) AS total_qty_ordered
FROM
    pizza_types AS pt
        INNER JOIN
    pizzas AS pz ON pt.pizza_type_id = pz.pizza_type_id
        INNER JOIN
    order_details AS od ON pz.pizza_id = od.pizza_id
GROUP BY pt.name
ORDER BY total_qty_ordered DESC
LIMIT 5;

-- Join the necessary tables to find the total quantity of each pizza category ordered.
SELECT 
    pt.category, SUM(od.quantity) AS total_quantity
FROM
    pizza_types AS pt
        INNER JOIN
    pizzas AS pz ON pt.pizza_type_id = pz.pizza_type_id
        INNER JOIN
    order_details AS od ON pz.pizza_id = od.pizza_id
GROUP BY pt.category
ORDER BY total_quantity DESC;


-- Determine the distribution of orders by hour of the day.
SELECT 
    HOUR(order_time) as Order_Hour, COUNT(order_id) AS Order_Count
FROM
    orders
GROUP BY HOUR(order_time)
ORDER BY Order_Count DESC;

-- Join relevant tables to find the category-wise distribution of pizzas.
SELECT 
    pt.category,
    COUNT(p.pizza_id) AS total_count
FROM pizza_types AS pt
JOIN pizzas AS p
    ON pt.pizza_type_id = p.pizza_type_id
GROUP BY pt.category;

-- Group the orders by date and calculate the average number of pizzas ordered per day.
SELECT 
    ROUND(AVG(daily_quantity), 0) AS avg_pizzas_per_day
FROM
    (SELECT 
        o.order_date, SUM(od.quantity) AS daily_quantity
    FROM
        orders AS o
    INNER JOIN order_details AS od ON o.order_id = od.order_id
    WHERE
        od.quantity IS NOT NULL
    GROUP BY o.order_date) AS daily_totals;


-- Determine the top 3 most ordered pizza types based on revenue.
SELECT 
    pt.name as pizza_name,
    ROUND(SUM(od.quantity * p.price), 2) AS total_revenue
FROM
    orders AS o
        INNER JOIN
    order_details AS od ON o.order_id = od.order_id
        INNER JOIN
    pizzas AS p ON od.pizza_id = p.pizza_id
        INNER JOIN
    pizza_types AS pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name 
ORDER BY total_revenue DESC
LIMIT 3;

-- Calculate the percentage contribution of each pizza type to total revenue.
SELECT 
    pt.category,
    ROUND(
        SUM(od.quantity * p.price) / (
            SELECT SUM(od.quantity * p.price)
            FROM order_details AS od
            JOIN pizzas AS p
                ON od.pizza_id = p.pizza_id) * 100,2) AS pct_of_total
FROM 
	pizza_types AS pt
JOIN pizzas AS p
    ON pt.pizza_type_id = p.pizza_type_id
JOIN order_details AS od
    ON od.pizza_id = p.pizza_id
GROUP BY pt.category
ORDER BY pct_of_total DESC;

-- Analyze the cumulative revenue generated over time.

-- Using Subquery 
Select order_date,round(sum(revenue) over(order by order_date),2) as total
from
(Select o.order_date, sum(od.quantity*p.price) as revenue
from order_details as od 
join pizzas as p
on od.pizza_id=p.pizza_id
join orders as o
on o.order_id=od.order_id
group by o.order_date) as Sales;

-- Using CTE

with daily_revenue as(Select o.order_date, round(sum(od.quantity*p.price),2) as revenue
from order_details as od 
join pizzas as p
on od.pizza_id=p.pizza_id
join orders as o
on o.order_id=od.order_id
group by o.order_date)

Select order_date,revenue,
sum(revenue) over(order by order_date) as cumulative_revenue
from daily_revenue;


-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.
WITH pizza_revenue as 
					(Select 
                    pt.name,pt.category,
					sum(od.quantity*p.price)as revenue
					from pizzas as p 
					join pizza_types as pt
					on p.pizza_type_id=pt.pizza_type_id
					join order_details as od on
					od.pizza_id=p.pizza_id
					group by pt.name, pt.category),
ranked_pizzas as 
				(select 
                name,category,revenue,
				rank()over(partition by category order by revenue desc) as rn
				from pizza_revenue) 
SELECT 
    category, name, ROUND(revenue, 2) AS total_revenue
FROM
    ranked_pizzas
WHERE
    rn <= 3
ORDER BY category , revenue DESC;
