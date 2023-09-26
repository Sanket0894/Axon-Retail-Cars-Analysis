SELECT * FROM classicmodels.customers;
-- ==================================================
select  distinct customerNumber from customers;
-- ===================================================
select phone from customers where phone regexp '[^0-9]';
create temporary table  phone_number 
(select phone from customers);
select * from phone_number;
select * from phone_number where phone regexp '[^0-9]';
update customers 
set phone =replace(phone,'.','');
update customers
set phone= replace(phone,' ','');
update customers set phone=replace(phone,'-','');
update customers set phone=replace(replace(phone,'(',''),')','')
where phone like "%(%" or phone like "%)%";
update customers set phone= replace(phone,'+','') 
where phone like"%+%";
select min(length(phone)) from phone_number;
select max(length(phone)) from phone_number;
select avg(length(phone)) from phone_number;
update customers set phone=concat("+",phone);
-- ===================================================================================================
update customers 
set addressline2 =replace(addressline2,"Not Availble","Not Available");
update customers 
set state=coalesce(state,"Not Available");
update customers 
set postalcode=coalesce(postalcode,"Not Available");
update customers 
set salesrepemployeenumber=ifnull(salesrepemployeenumber,0);
-- =====================================================================================================
update customers 
set salesrepemployeenumber  =(SELECT 
            employeeNumber
        FROM
            employees
        WHERE
            jobtitle = 'Sales Rep'
        ORDER BY RAND()
        LIMIT 1) 
where salesrepemployeenumber is null;