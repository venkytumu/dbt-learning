select
CustomerID,
Segment,
Country,
sum(orderprofit) as profit
from {{ ref('stag_orders') }}
group by
CustomerID,
Segment,
Country