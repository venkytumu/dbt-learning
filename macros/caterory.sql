{%- set category = ["Furniture","Office","Technology"] -%} 


select 
ProductID,
{% for Category  in category%}
sum(case when Category ='{{Category}}' then orderprofit end) as {{Category}}_orderprofit
{% if not loop.last %},{% endif %}
{% endfor %}
from {{ ref('stag_orders') }}
group by 1