# Company Views
USE company;

CREATE OR REPLACE VIEW v_top_customers AS
    SELECT 
		c.customer_ID, c.first_name, c.last_name, SUM(p.unit_price) AS total_spent
	FROM
		sales s
			JOIN
		customers c ON s.customer_ID = c.customer_ID
			JOIN
		products p ON s.product_ID = p.product_ID
	GROUP BY first_name, last_name
	ORDER BY total_spent DESC
	LIMIT 3;
	

CREATE OR REPLACE VIEW v_top_employees AS
	SELECT 
			e.employee_ID, e.first_name, e.last_name, SUM(p.unit_price) AS total_sold
		FROM
			sales s
				JOIN
			employees e ON s.employee_ID = e.employee_ID
				JOIN
			products p ON s.product_ID = p.product_ID
		GROUP BY first_name, last_name
		ORDER BY total_sold DESC
		LIMIT 3;
        
SELECT * FROM v_top_customers;
SELECT * FROM v_top_employees;