select*from pizza_sales

use [Pizza DB]

--total revenue
select sum(total_price) from pizza_sales

--average order value
select sum(total_price)/count(distinct order_id) from pizza_sales

--total pizza sold
select sum(quantity) from pizza_sales

--total orders
select count(distinct order_id) from pizza_sales

--average pizza per order
select cast(sum(quantity)as decimal(10,2))/cast(count(distinct order_id)as decimal(10,2)) from pizza_sales


select datename(DW,order_date) as order_day, count(distinct order_id) as total_orders from pizza_sales
group by datename(DW,order_date)

select datename(month,order_date) as month_name, count(distinct order_id) as total_orders
from pizza_sales 
group by datename(month,order_date)
order by total_orders desc

select pizza_category, sum(total_price) as total_sales,sum(total_price) * 100 / (select sum(total_price) from pizza_sales)as pct from pizza_sales
group by pizza_category


select pizza_size, sum(total_price) as total_sales,sum(total_price) * 100 / (select sum(total_price) from pizza_sales)as pct from pizza_sales
group by pizza_size order by pct

select top 5 pizza_name,sum(total_price)as total_revenue from pizza_sales group by pizza_name order by total_revenue desc

select top 5 pizza_name,sum(total_price)as total_revenue from pizza_sales group by pizza_name order by total_revenue asc

select top 5 pizza_name,sum(quantity)as total_quantity from pizza_sales group by pizza_name order by total_quantity desc
