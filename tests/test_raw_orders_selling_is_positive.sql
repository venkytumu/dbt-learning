with orders as(select *

from {{ ref('raw_orders') }})
select 
    orderid,
    OrderSellingPrice as total_sp
     from orders
where
 total_sp<0