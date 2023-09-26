DELIMITER //
CREATE PROCEDURE get_top_n_products 
						(in_year int,
						in_top_n int)
BEGIN 
	SELECT 
		p.productname,
		SUM(s.sales) as total_sales_
	FROM total_sales s 
	JOIN products p 
	ON s.productcode=p.productcode
	where s.year=in_year
	GROUP BY p.productname 
	ORDER BY total_sales_ DESC
	LIMIT in_top_n;
END //
DELIMITER ;