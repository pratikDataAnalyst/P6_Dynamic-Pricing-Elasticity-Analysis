create database p6;
use p6;
create table sales(
order_id int,
date date,
product_id varchar(10),
category varchar(50),
price float,
quantity int,
base_price float,
discount int,
demand_factor float,
revenue float
);
-- 1.Total Business Performance
select
 sum(revenue) As total_revenue,
 sum(quantity) as total_quantity,
 avg(price) as avg_price
 from dp_dataset;
 
 -- 2.Category-Level Analysis
 select 
 category,
 sum(revenue) as total_revenue,
 sum(quantity) as total_quantity,
 avg(price) as avg_price
from dp_dataset
group by category;
 
-- 3.Product-Level Insights 
select product_id,
avg(price) as avg_price,
sum(quantity) as total_quantity,
sum(revenue) as total_revenue
from dp_dataset
group by product_id
order by total_quantity desc;
## (Top performing product based on demand)
 
-- 4. Price Sensitivity
select 
case  
when price <300 then "Low"
when price between 300 and 800 then "Medium"
else "High"
End As Price_Category,
avg(quantity) as Avg_Quantity 
from dp_dataset
group by price_category;

-- 5.Discount Impact
select
discount,
avg(quantity) as avg_quantity,
sum(revenue) as total_revenue
from dp_dataset 
group by discount
order by discount;
## discounts impact demand and revenue.

-- 6.Time-Based Analysis.
SELECT 
    MONTH(date) AS month,
    SUM(revenue) AS total_revenue,
    SUM(quantity) AS total_quantity
FROM dp_dataset
GROUP BY month
ORDER BY total_revenue desc;
## monthly trends to identify seasonal patterns. 

-- 7.Top 5 Products by Revenue.
select 
product_id,
sum(revenue) as total_revenue
from dp_dataset
group by product_id
order by total_revenue desc
limit 5;
 -- 8.Lowest Performing Products.
 select product_id,
 sum(revenue) as total_revenue
from dp_dataset
group by product_id
order by total_revenue asc
limit 5;
