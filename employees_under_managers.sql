SELECT * FROM classicmodels.employees;
select count(distinct employeenumber) from employees;
WITH CTE AS (SELECT 
	e.officeCode,
    e.employeeNumber,
    e.firstname,
	e.lastname,
    e.jobtitle,
    e.reportsto,
    o.city,
    o.country,
    row_number()over(partition by country order by reportsTo ) as rk
FROM employees e
LEFT JOIN employees m
ON e.employeenumber=m.employeenumber
JOIN offices o
ON e.officeCode=o.officeCode
ORDER BY officeCode
)
SELECT
	officeCode,
    employeeNumber,
    firstname,
	lastname,
    jobtitle,
    reportsto,
    city,
    country,
    CASE 
		WHEN country="USA" THEN "NA territory"
		WHEN country="UK" THEN "EMEA territory"
        WHEN country="France" THEN "EMEA territory"
        WHEN country="Japan" THEN "Japan territory"
        WHEN country="Australia" THEN "APAC territory"
	END AS country_region 
FROM CTE;




SELECT
    e.employeeNumber,
    e.firstName AS employeeFirstName,
    e.lastName AS employeeLastName,
    e.jobTitle AS employeeJobTitle,
    m.firstName AS managerFirstName,
    m.lastName AS managerLastName,
    m.jobTitle AS managerJobTitle
FROM employees AS e
LEFT JOIN employees AS m ON e.reportsTo = m.employeeNumber;