create schema ecomm;

use ecomm; 

create table ecommerce(
used_id varchar(200),
product_id varchar(200),
category varchar(200),
price float,
discount int,
final_price float,
payment_method varchar(200),
purchase_date varchar(200)
);

select count(*) from ecommerce;

select count(*) as count, category from ecommerce
group by category;

select count(*) as count,payment_method from ecommerce
group by payment_method;

select category, round(sum(final_price),2) AS revenue
from ecommerce
group by category
order by revenue desc;

select round(sum(price),2) from ecommerce;

UPDATE ecommerce 
SET purchase_date = STR_TO_DATE(purchase_date, '%d-%m-%Y');

select round(sum(final_price)) as revenue , date_format(purchase_date ,' %m-%y' ) as d from ecommerce
group by d
order by  d ;

select round(sum(final_price)) as revenue , date_format(purchase_date ,' %m-%y' ) as d from ecommerce
group by d
order by  revenue ;

select round(avg(final_price),2) as avg_value from ecommerce;

select category  , round(avg(final_price),2) as avg_value ,  
rank() over (order by avg(final_price) desc) 
from ecommerce
group by category;


select round(sum(final_price)) as revenue , category  ,date_format(purchase_date ,' %m-%y' ) as d from ecommerce
where category = "electronics"
group by d , category
order by  d;

