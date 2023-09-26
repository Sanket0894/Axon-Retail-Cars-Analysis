select customerNumber,creditLimit
from customers
where customernumber not in (select  customerNumber from orders );

