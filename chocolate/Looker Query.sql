select 
	customers.customer_id, age, gender, case when loyalty_member = 1 then 'Yes' else 'No' end as loyalty_lab, join_date,
	products.product_id, product_name, brand, category, cocoa_percent, weight_g, 
	order_id, order_date, quantity, unit_price, discount, revenue, cost, profit,
	stores.store_id, store_name, city, country, store_type
	from `chocolate-493502.Dataset.sales` as sales
inner join `chocolate-493502.Dataset.customers` as customers on sales.customer_id = customers.customer_id
inner join `chocolate-493502.Dataset.products` as products on sales.product_id = products.product_id
inner join `chocolate-493502.Dataset.stores` as stores on sales.store_id = stores.store_id
