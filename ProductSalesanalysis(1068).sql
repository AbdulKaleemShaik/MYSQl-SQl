select pu.product_name,p.year,p.price from Sales p join Product pu on  p.product_id=pu.product_id;