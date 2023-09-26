SELECT * FROM classicmodels.orders;
select distinct(status) from orders;
select count(status) from orders  where status ="shipped";
select count(status) from orders  where status ="Cancelled";
select count(status) from orders  where status ="On Hold";
select count(status) from orders  where status ="Disputed";
select count(status) from orders  where status ="In Process";
select count(status) from orders  where status ="Resolved";

update orders set comments=coalesce(comments,"No comments");