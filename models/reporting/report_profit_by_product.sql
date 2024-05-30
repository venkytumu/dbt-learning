select
ProductID,
ProductName,
Category,
SubCategory,
sum(orderprofit) as profitbyproduct
from {{ ref('stag_orders') }}
group by ProductID,
ProductName,
Category,
SubCategory