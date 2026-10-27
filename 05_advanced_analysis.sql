-- Q21. Find the total completed-order revenue for each month.

SELECT 
    MONTH(Order_Date) AS month,
    SUM(Unit_Price * Quantity) AS revenue
FROM
    orders
WHERE
    Order_Status = 'Completed'
GROUP BY MONTH(Order_Date)
ORDER BY month ASC;

-- Q22. Find customers who have placed more than 1 completed order.

SELECT 
    customer_Id, COUNT(order_Id) count_of_orders
FROM
    orders
WHERE
    Order_Status = 'Completed'
GROUP BY customer_Id
HAVING count_of_orders > 1;

-- Q23. Find the top 10 customers by total completed-order spending.

select c.customer_Id, sum(o.Quantity * o.Unit_Price) as total_completed_order_spending from orders as o
left join customers as c on o.Customer_Id = c.Customer_Id
where order_status = 'Completed'
group by c.customer_Id
order by total_completed_order_spending desc
limit 10;

-- Q24. Find the top 10 products by total profit from completed orders.

SELECT p.product_name, SUM((o.unit_price - p.cost) * o.quantity) AS total_profit
FROM products p
JOIN orders o ON p.product_id = o.product_id
WHERE o.order_status = 'Completed'
GROUP BY p.product_id, p.product_name
ORDER BY total_profit DESC
LIMIT 10;

-- Q25. Find products whose total completed-order revenue is greater than ₹35,000.

select p.Product_Name, sum(o.Quantity * o.Unit_Price) as total_profit from products as p
left join orders as o on p.product_Id = o.product_Id
where o.order_status = 'Completed'
group by p.Product_Name
having total_profit > 35000;

-- Q26. Customer Segmentation based on total order spending

select 
	c.Customer_Id, 
	concat(c.First_Name, " ", c.Last_Name) as Customer_Name,
    sum(o.Quantity * o.Unit_Price) as total_spending,
    case
		when sum(o.Quantity * o.Unit_Price) < 5000 then "Low Value"
        When sum(o.Quantity * o.Unit_Price) between 5000 and 10000 then "Medium Value"
        else "High Value"
	end as Customer_Category
from customers as c left join orders as o on c.Customer_Id = o.Customer_Id
where o.order_status = 'Completed'
group by c.Customer_Id, Customer_Name;

-- Q27. Calculate the percentage of payments that were successful.

SELECT 
    COUNT(Payment_Id) AS total_payments,
    SUM(CASE 
        WHEN payment_status = 'Successful' THEN 1 
        ELSE 0 
    END) AS completed_payments,
	ROUND(
		100.0 * SUM(CASE 
			WHEN payment_status = 'Successful' THEN 1 
			ELSE 0 
		END) / COUNT(Payment_Id),
		2
    ) AS completed_percentage
FROM payments;

-- Q28. Find the number of completed orders for each month, and sort from earliest month to latest.

SELECT 
    MONTH(order_date) AS months, COUNT(order_Id) as "number of completed orders"
FROM
    orders
WHERE
    Order_Status = 'Completed'
GROUP BY MONTH(order_date)
ORDER BY months;

-- Q29. Find customers who have placed orders but have never made a successful payment.

SELECT DISTINCT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name
FROM customers as c
JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN payments p ON o.order_id = p.order_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING SUM(
    CASE
        WHEN p.payment_status = 'Successful' THEN 1
        ELSE 0
    END
) = 0;

-- Q30. Find the product category generating the highest completed-order revenue.

SELECT 
    p.Category, SUM(o.Quantity * o.Unit_Price) AS revenue
FROM
    orders AS o
        LEFT JOIN
    products AS p ON o.Product_ID = p.Product_Id
WHERE o.order_status = 'Completed'
GROUP BY p.Category
ORDER BY revenue DESC
LIMIT 1;
