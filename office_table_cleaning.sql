SELECT * FROM classicmodels.offices;
select distinct territory from offices;
update offices set state=coalesce(state,"Not Available");