select
--from raw_customers
--here creating surrogate_key after installed of packages as surrogate_key
o.OrderID,
o.OrderDate,
o.ShipDate,o.
ShipMode,
o.OrderCostPrice,
o.OrderSellingPrice,
ORDERSELLINGPRICE- ORDERCOSTPRICE as orderprofit,
--from raw_products
p.ProductID,
p.Category,
p.ProductName,
p.SubCategory,
-- calling macro
{{ markup('ORDERSELLINGPRICE','ORDERCOSTPRICE') }} as markup,
d.delivery_team,
--from raw_customers
c.CustomerID,
c.CustomerName,
c.Segment,
c.Country,
c.State
FROM 
{{ ref('raw_orders') }} o
left join {{ ref('raw_products') }} p
on o.ProductID=p.ProductID
left join {{ref("raw_customers")}} c 
on o.CustomerID=c.CustomerID
left join {{ ref('delivery_team') }} as d
on o.ShipMode=d.ShipMode