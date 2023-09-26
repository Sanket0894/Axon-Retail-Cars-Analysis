DELIMITER //
CREATE PROCEDURE get_top_n_customers_by_sales (in_year INT,
                    in_top_n INT)
BEGIN
	SELECT 
		c.customerName,
		ROUND(SUM(s.sales)/1000000,2) AS total_sales_mln
	FROM total_sales s 
	JOIN orders o
	ON s.ordernumber=o.ordernumber
	JOIN customers c 
	ON c.customernumber=o.customernumber
	WHERE s.year=in_year
	GROUP BY c.customerName
	ORDER BY total_sales_mln DESC
	LIMIT in_top_n;

END //
DELIMITER ;