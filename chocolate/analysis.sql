select * from `chocolate-493502.Dataset.products`
;
--1. sales trends over the years
select extract(year from order_date) as year, store_id, count(distinct customer_id) as total_customers, sum(quantity) as units_sold, trunc(sum(profit),2) as total_profit
from `chocolate-493502.Dataset.sales`
group by extract(year from order_date), store_id
;
--2. Which chocolate is the most popular
select brand||'_'||product_name as name, product_name, cocoa_percent,  sum(quantity) as units_sold
from `chocolate-493502.Dataset.products` as p
left join `chocolate-493502.Dataset.sales` s on p.product_id = s.product_id
group by brand||'_'||product_name, product_name, cocoa_percent
order by sum(quantity) desc
;
--3. Which store type has the highest profits?
select store_type, count(distinct st.store_id) as num_stores, sum(quantity) as units_sold, trunc(sum(discount)) as total_discount, trunc(sum(profit), 2) as total_profits, trunc(sum(profit)/count(distinct st.store_id), 2) as profit_per_store, trunc(sum(revenue)/count(distinct st.store_id), 2) as revenue_per_store
from `chocolate-493502.Dataset.stores` as st
inner join `chocolate-493502.Dataset.sales` as sa on st.store_id = sa.store_id 
group by store_type
;
--4. Is it true that women eat more chocolate ? :P
select 
    gender, store_type, sum(quantity) as units_sold, trunc(sum(revenue), 2) as total_sales, trunc(sum(discount), 2) as total_discount,
    trunc(sum(quantity)/count(distinct c.customer_id), 2) as units_per_customer, trunc(sum(revenue)/count(distinct c.customer_id), 2) as revenue_per_customer
from `chocolate-493502.Dataset.customers` as c
inner join `chocolate-493502.Dataset.sales` as sa on c.customer_id = sa.customer_id 
inner join `chocolate-493502.Dataset.stores` as st on st.store_id = sa.store_id
group by gender, store_type
order by gender, sum(quantity)
;
--5. Do Loyalty programs give birth to shopaholics? Who is more tempted?
select loyalty_member, gender, count(distinct c.customer_id) as num_ppl, sum(quantity) as units_sold, trunc(sum(revenue), 2) as total_sales, 
trunc(sum(discount), 2) as total_discount, trunc(sum(quantity)/count(distinct c.customer_id), 2) as units_per_customer
    , trunc(sum(revenue)/count(distinct c.customer_id), 2) as revenue_per_customer
from `chocolate-493502.Dataset.customers` as c
inner join `chocolate-493502.Dataset.sales` as sa on c.customer_id = sa.customer_id 
group by gender, loyalty_member
order by trunc(sum(quantity)/count(distinct c.customer_id), 2)
;
--6. Is Winter really the couch-potato season? With chocolate and blankets?
select 
    case when extract(month from order_date) in (12,1,2) then 'Winter'
         when extract(month from order_date) in (3,4,5) then 'Spring'
         when extract(month from order_date) in (6,7,8) then 'Summer'
         when extract(month from order_date) in (9,10,11) then 'Fall'
        end as season
    , sum(quantity) as units_sold, trunc(avg(revenue), 2) as avg_revenue, trunc(avg(discount), 2) as avg_discount
from `chocolate-493502.Dataset.sales`
group by season
order by sum(quantity) desc
;
--7. Sales and Revenue by Country
select 
    country, city, count(distinct st.store_id) as num_stores
    , sum(quantity) as units_sold, trunc(sum(quantity)/count(distinct st.store_id), 2) as avg_units_sold 
    , trunc(sum(revenue), 2) as total_revenue, trunc(sum(revenue)/count(distinct st.store_id), 2) as avg_revenue
    , trunc(sum(profit), 2) as total_profit,  trunc(sum(profit)/count(distinct st.store_id), 2) as avg_profit
from `chocolate-493502.Dataset.sales` as sa
inner join `chocolate-493502.Dataset.stores` as st on sa.store_id = st.store_id
group by country, city
order by avg_profit desc
;
--8. Which brands are popular?
select 
        brand, category, count(distinct p.product_id) as num_products, sum(quantity) as num_units, trunc(sum(quantity)/count(distinct p.product_id)) as avg_units_sold
        , trunc(sum(revenue), 2) as total_revenue, trunc(sum(revenue)/count(distinct p.product_id), 2) as avg_revenue
        , trunc(sum(profit), 2) as total_profit,  trunc(sum(profit)/count(distinct p.product_id), 2) as avg_profit 
from `chocolate-493502.Dataset.products` as p
inner join `chocolate-493502.Dataset.sales` as s on p.product_id = s.product_id
group by brand, category
order by avg_profit
;
--8. Which Brand has the highest profits?
select p.brand, count(distinct p.product_name) as num_products, trunc(avg(s.profit), 2) as avg_profit,  trunc(sum(s.profit)/count(distinct p.product_name), 2) as avg_profit_per_product
from `chocolate-493502.Dataset.sales` as s
inner join `chocolate-493502.Dataset.products` as p on s.product_id = p.product_id
group by p.brand
order by avg_profit_per_product desc
;
--9. Purchasing behavior of different age groups
select case when age>=18 and age<=24 then '18-24'
           when age>=25 and age<=34 then '25-34'
           when age>=35 and age<=44 then '35-44'
           when age>=45 and age<=54 then '45-54'
           when age>=55 and age<=64 then '55-64'
           when age>=65 then '65+'
        end as age_buckets
    
    , count(distinct c.customer_id) as num_customers
    , trunc(sum(revenue), 2) as total_revenue
    , sum(quantity) as total_units
    , trunc(sum(profit), 2) as total_profit
    , trunc(sum(revenue)/count(distinct c.customer_id), 2) as avg_revenue
    , trunc(sum(quantity)/count(distinct c.customer_id), 2) as units_per_customer
from `chocolate-493502.Dataset.customers` as c
inner join `chocolate-493502.Dataset.sales` as s on c.customer_id = s.customer_id
group by age_buckets
order by avg_revenue desc
