# Company Procedures
USE company;


# Sales Info
DROP PROCEDURE IF EXISTS sales_info;
DELIMITER $$
CREATE PROCEDURE sales_info()
BEGIN
SELECT 
    st.store_ID, st.total_sales, p.product_name, p.unit_cost, p.total_inventory
FROM
    sales s
		JOIN
	products p ON s.product_ID = p.product_ID
		JOIN
	stores st ON s.store_ID = st.store_ID
GROUP BY st.store_ID
ORDER BY st.store_ID;
END$$
DELIMITER ;


# Customers Gender
DROP PROCEDURE IF EXISTS customers_gender;
DELIMITER $$
CREATE PROCEDURE customers_gender()
BEGIN

SELECT 
	CASE 
		WHEN gender = 'M' THEN 'Male'
		ELSE 'Female'
    END AS gender,
    COUNT(*) AS count 
FROM customers
GROUP BY gender;
END$$
DELIMITER ;


# Employees Gender
DROP PROCEDURE IF EXISTS employees_gender;
DELIMITER $$
CREATE PROCEDURE employees_gender()
BEGIN

SELECT 
	CASE 
		WHEN gender = 'M' THEN 'Male'
		ELSE 'Female'
    END AS gender,
    COUNT(*) AS count 
FROM employees
GROUP BY gender;
END$$
DELIMITER ;


# call procedures
call company.sales_info();
call company.customers_gender();
call company.employees_gender();