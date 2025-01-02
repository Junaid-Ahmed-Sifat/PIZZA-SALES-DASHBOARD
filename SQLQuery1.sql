select * from pizza_sales

select sum(total_price) as Total_revenue from pizza_sales

select sum(total_price)/count(distinct order_id) as avg_order_value from pizza_sales

select sum(quantity) as total_pizza_sold from pizza_sales

select count(distinct order_id) as Total_orders from pizza_sales


select cast(cast(sum(quantity) as decimal(10,2))/cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as avg_per_order from pizza_sales

-- daily trend
select datename(dw,order_date) as order_day, count(distinct order_id) as total_orders from pizza_sales
group by datename(dw,order_date)


-- hourly trend
select datepart(hour,order_time) as order_hour, count(distinct order_id) as total_orders from pizza_sales group by datepart(hour,order_time) order by datepart(hour,order_time) 


-- 3rd trend

select pizza_category,sum(total_price)*100/(select sum(total_price)  from pizza_sales where month(order_date)=1) as Total_sales from pizza_sales 
where month(order_date)=1
group by pizza_category

--4
select pizza_size,cast((sum(total_price)*100/(select sum(total_price) from pizza_sales where datepart(quarter,order_date)=1)) as decimal(10,2)) as PCT 
from pizza_sales 
where datepart(quarter,order_date)=1
group by pizza_size
order by pct desc

-- 5 
select pizza_category , sum(quantity) as Total_pizza_sold from pizza_sales group by pizza_category


-- 6
select top 5 pizza_name, sum(quantity) as Total_Pizza_sold from pizza_sales
group by pizza_name order by sum(quantity) desc

-- 7
select top 5 pizza_name, sum(quantity) as Total_Pizza_sold from pizza_sales
group by pizza_name order by sum(quantity) asc
