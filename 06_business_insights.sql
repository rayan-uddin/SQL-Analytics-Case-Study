-- Q31. Find all products whose price is greater than the average price of all products.

SELECT Product_Name, Price
FROM Products
WHERE Price > (
    SELECT AVG(Price)
    FROM Products
);

-- Q32. Find customers whose total completed-order spending is greater than the average customer spending.

SELECT 
    customer_Id, SUM(unit_price * quantity) AS total_spendings
FROM
    orders
WHERE
    Order_Status = 'Completed'
GROUP BY customer_Id
HAVING SUM(unit_price * quantity) > (SELECT 
        AVG(customer_spending)
    FROM
        (SELECT 
            customer_Id, SUM(unit_price * quantity) AS customer_spending
        FROM
            orders
        WHERE
            Order_Status = 'Completed'
        GROUP BY customer_Id) AS customer_table);

-- Q33. Find the product(s) with the highest price.

select product_Id, price
from(
    select product_Id, 
    price,
    rank() over (order by price desc) as price_rank
    from products
    ) x
where price_rank = 1; 

-- Q34. Find the second-highest product price.

select product_Id, price
from(
    select product_Id, 
    price,
    rank() over (order by price desc) as price_rank
    from products
    ) x
where price_rank = 2; 

-- Q35. Find customers who have made at least one successful payment.

select 
	distinct o.customer_Id
    from orders o
    where exists
    (
		select 1 from payments p 
			where o.order_Id = p.order_Id and 
            p.Payment_Status = "Successful"
	)
    order by customer_Id;

-- Q36. Find customers who have never made a successful payment.

select 
	distinct o.customer_Id
    from orders o
    where not exists
    (
		select 1 from payments p 
			where o.order_Id = p.order_Id and 
            p.Payment_Status = "Successful"
	);

-- Q37. Find the highest-revenue product in each product category based on completed orders.


with revenue as(
		select 
			p.Sub_Category,
            p.product_Id,
            p.Product_Name,
            sum(o.quantity * o.unit_Price) as Total_Revenue from orders o
		left join products p on o.Product_ID = p.Product_ID
		WHERE Order_Status = 'Completed'
        group by
			p.Sub_Category,
			p.Product_ID,
			p.Product_Name
	),
ranked_products as (
			select 
				Sub_Category,
				product_Id,
				Product_Name,
                Total_Revenue,
                rank() over (
						partition by Sub_Category
						order by Total_Revenue desc
					) as revenue_rank
            from revenue
		)
select  
	Sub_Category,
	Product_ID,
	Product_Name,
	Total_Revenue
FROM 
	ranked_products
WHERE 
	revenue_rank = 1;
    

-- Q38. Rank customers based on their total completed-order spending, from highest to lowest.

with 
	customer_spendings as (
		select 
				c.customer_Id, 
				concat(c.First_Name," ",c.Last_Name) as Customer_Name, 
				sum(Unit_Price * Quantity) as Total_Spendings 
		from orders o left join customers c on o.customer_Id = c.customer_Id
		where Order_Status = "Completed"
		group by customer_Id
	),
	customer_spendings_rank as (
		select
			customer_Id,
            Customer_Name,
            Total_Spendings,
            rank() over (order by Total_Spendings desc) as spendings_rank 
			from customer_spendings
    )

select 
	customer_Id,
	Customer_Name,
	Total_Spendings
from 
    customer_spendings_rank;
    
-- Q39. Using a CTE, calculate monthly completed-order revenue.

with 
	monthly_Revenue as (
		select 
			date_format(order_date, '%Y-%m') as months,
			sum(Quantity * Unit_Price) as Revenue
			from orders
            where Order_Status = "Completed"
			group by months
			order by months
		),
	month_over_month_revenue as(
		select months, revenue,
        lag(Revenue) over(order by  months) as previous_Month_Revenue
        from monthly_revenue
		)

select 
	months,
    revenue,
    previous_Month_Revenue 
from 
	month_over_month_revenue;
    
-- Q40. Find the highest-spending customers in each customer segment, based on completed orders.

with highest_spending as(
	select 
		c.customer_segment,
        c.customer_id,
        concat(c.First_Name, ' ',Last_Name) as full_name,
		sum(unit_price * Quantity) as Total_Spending
    from customers c 
    left join orders o on 
		c.Customer_Id = o.Customer_Id 
	where o.Order_Status = 'Completed' 
		group by 
			c.customer_segment,
            c.first_name,
            c.last_name,
            c.customer_id
),
ranked_customer as (
	select *,
		row_number() over(
			partition by customer_segment
            order by total_spending DESC
        ) as cust_rnk
	from highest_spending
)
select * from ranked_customer where cust_rnk = 1;