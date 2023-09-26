DELIMITER //
CREATE PROCEDURE get_top_n_countries_by_sales(in_year INT,
                    in_top_n INT
                    )
BEGIN
	SELECT 
		c.country,
		ROUND(SUM(s.sales)/1000000,2) AS total_sales_mln
	FROM total_sales s 
	JOIN orders o
	ON 
		s.ordernumber=s.ordernumber
	JOIN customers c 
	ON
		c.customernumber=o.customernumber
	WHERE year(s.orderdate) = in_year
	GROUP BY c.country
	ORDER BY total_sales_mln DESC
	LIMIT in_top_n;
END //
DELIMITER ;