select
--from raw_customers
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