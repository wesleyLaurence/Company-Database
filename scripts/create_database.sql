# Company Database (not real data)

USE company;

DROP TABLE IF EXISTS customers, employees, products, stores, managers, sales;

# create all tables
CREATE TABLE customers (
	customer_ID INTEGER NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone CHAR(13),
    DOB date,
    gender ENUM('M','F'),
    CONSTRAINT PK_customer_id PRIMARY KEY (customer_ID) );
    
CREATE TABLE employees (
	employee_ID INTEGER NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    store_ID INTEGER NOT NULL,
    hire_date DATE NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone CHAR(13) NOT NULL,
    DOB DATE NOT NULL,
    gender ENUM('M','F'),
    CONSTRAINT PK_employee_id PRIMARY KEY (employee_ID) );
    
CREATE TABLE products (
	product_ID INTEGER NOT NULL AUTO_INCREMENT,
    product_name VARCHAR(255) NOT NULL,
    unit_cost FLOAT NOT NULL,
    unit_price FLOAT NOT NULL,
    serial_number CHAR(8) NOT NULL,
    supplier VARCHAR(255) NOT NULL,
    total_inventory INTEGER NOT NULL, 
    CONSTRAINT PK_product_id PRIMARY KEY (product_id) );
    
CREATE TABLE stores (
	store_ID INTEGER NOT NULL AUTO_INCREMENT,
    manager_ID INTEGER NOT NULL,
    zip_code CHAR(5) NOT NULL,
    num_employees INTEGER NOT NULL,
    total_sales FLOAT NOT NULL, 
    CONSTRAINT PK_store_id PRIMARY KEY (store_ID) );
    
CREATE TABLE managers (
	manager_ID INTEGER NOT NULL AUTO_INCREMENT,
    employee_ID INTEGER NOT NULL, 
    CONSTRAINT PK_manager_ID PRIMARY KEY (manager_ID) );
    
CREATE TABLE sales (
	sale_ID INTEGER NOT NULL AUTO_INCREMENT,
    customer_ID INTEGER NOT NULL,
    product_ID INTEGER NOT NULL,
    store_ID INTEGER NOT NULL,
    employee_ID INTEGER,
    sale_date_time DATETIME NOT NULL,
    CONSTRAINT PK_sale_id PRIMARY KEY (sale_id),
    CONSTRAINT FK_customer_id FOREIGN KEY (customer_ID) REFERENCES customers(customer_ID) ON DELETE CASCADE,
    CONSTRAINT FK_product_id FOREIGN KEY (product_ID) REFERENCES products(product_ID) ON DELETE CASCADE,    
    CONSTRAINT FK_store_id FOREIGN KEY (store_ID) REFERENCES stores(store_ID) ON DELETE CASCADE,
    CONSTRAINT FK_employee_id FOREIGN KEY (employee_ID) REFERENCES employees(employee_ID) ON DELETE CASCADE );
    

# insert data into tables
INSERT INTO employees (first_name, last_name, store_ID, hire_date, email, phone, DOB, gender) VALUES ('Brakshaw','Hemmingway', 3, '2020-01-21', 'b.h@home.com','123-456-7891','1974-01-21','M');
INSERT INTO employees (first_name, last_name, store_ID, hire_date, email, phone, DOB, gender) VALUES ('Tela','Vidia', 5, '2020-01-21', 't.v@home.com','234-567-8910','1987-04-24','M');
INSERT INTO employees (first_name, last_name, store_ID, hire_date, email, phone, DOB, gender) VALUES ('Meros','Blecken', 1, '2020-01-21', 'm.b@home.com','747-999-1111','1969-04-04','F');
INSERT INTO employees (first_name, last_name, store_ID, hire_date, email, phone, DOB, gender) VALUES ('Maria','Mullover', 2, '2020-01-21', 'm.m@home.com','141-646-6667','1991-09-11','F');
INSERT INTO employees (first_name, last_name, store_ID, hire_date, email, phone, DOB, gender) VALUES ('Bluton','Avia', 4, '2020-01-21', 'b.a@home.com','454-417-7714','2000-05-23','F');

INSERT INTO customers (first_name, last_name, email, phone, DOB, gender) VALUES ('Marke','Sutrul','marke.s@home.com','123-456-7891','1974-01-21','M');
INSERT INTO customers (first_name, last_name, email, phone, DOB, gender) VALUES ('Dave','Drakinson','dave.d@home.com','234-567-8910','1987-04-24','M');
INSERT INTO customers (first_name, last_name, email, phone, DOB, gender) VALUES ('Feiona','Catarsis','f.cat@home.com','747-999-1111','1969-04-04','F');
INSERT INTO customers (first_name, last_name, email, phone, DOB, gender) VALUES ('Malia','Elliot','m.ell@home.com','141-646-6667','1991-09-11','F');
INSERT INTO customers (first_name, last_name, email, phone, DOB, gender) VALUES ('Maya','Davidwrite','m.dav@home.com','454-417-7714','2000-05-23','F');

INSERT INTO products (product_name, unit_cost, unit_price, serial_number, supplier, total_inventory) VALUES ('Cloud', 75, 119, 'v8de9k03', 'Bright Way LLC', 5);
INSERT INTO products (product_name, unit_cost, unit_price, serial_number, supplier, total_inventory) VALUES ('Developer Kit', 50, 80, 'dk963g8f', 'Ease City Inc', 3);
INSERT INTO products (product_name, unit_cost, unit_price, serial_number, supplier, total_inventory) VALUES ('Storage Unit', 25, 45, 'nhd97f7e', 'Bright Way LLC', 8);
INSERT INTO products (product_name, unit_cost, unit_price, serial_number, supplier, total_inventory) VALUES ('API Access', 30, 50, 'c93nd7j1', 'Saya Inc', 1);
INSERT INTO products (product_name, unit_cost, unit_price, serial_number, supplier, total_inventory) VALUES ('Subscription', 20, 30, 'vk75h30b', 'YAVO LLC', 11);

INSERT INTO stores (manager_ID, zip_code, num_employees, total_sales) VALUES (3, '35436', 115, 100589);
INSERT INTO stores (manager_ID, zip_code, num_employees, total_sales) VALUES (5, '38756', 178, 145353);
INSERT INTO stores (manager_ID, zip_code, num_employees, total_sales) VALUES (1, '48753', 55, 784244);
INSERT INTO stores (manager_ID, zip_code, num_employees, total_sales) VALUES (4, '95623', 99, 1064778);
INSERT INTO stores (manager_ID, zip_code, num_employees, total_sales) VALUES (2, '74398', 75, 200986);

INSERT INTO managers (employee_ID) VALUES (2);
INSERT INTO managers (employee_ID) VALUES (3);
INSERT INTO managers (employee_ID) VALUES (5);
INSERT INTO managers (employee_ID) VALUES (1);
INSERT INTO managers (employee_ID) VALUES (4);

INSERT INTO sales (customer_ID, product_ID, store_ID, employee_ID, sale_date_time) VALUES (5, 4, 5, 2, NOW());
INSERT INTO sales (customer_ID, product_ID, store_ID, employee_ID, sale_date_time) VALUES (1, 5, 4, 1, NOW());
INSERT INTO sales (customer_ID, product_ID, store_ID, employee_ID, sale_date_time) VALUES (3, 2, 1, 3, NOW());
INSERT INTO sales (customer_ID, product_ID, store_ID, employee_ID, sale_date_time) VALUES (2, 3, 3, 5, NOW());
INSERT INTO sales (customer_ID, product_ID, store_ID, employee_ID, sale_date_time) VALUES (4, 1, 5, 4, NOW());
INSERT INTO sales (customer_ID, product_ID, store_ID, employee_ID, sale_date_time) VALUES (1, 5, 2, 3, NOW());
INSERT INTO sales (customer_ID, product_ID, store_ID, employee_ID, sale_date_time) VALUES (1, 4, 2, 2, NOW());
INSERT INTO sales (customer_ID, product_ID, store_ID, employee_ID, sale_date_time) VALUES (5, 2, 4, 2, NOW());
INSERT INTO sales (customer_ID, product_ID, store_ID, employee_ID, sale_date_time) VALUES (3, 2, 1, 3, NOW());
INSERT INTO sales (customer_ID, product_ID, store_ID, employee_ID, sale_date_time) VALUES (5, 3, 5, 1, NOW());
INSERT INTO sales (customer_ID, product_ID, store_ID, employee_ID, sale_date_time) VALUES (2, 1, 5, 1, NOW());
INSERT INTO sales (customer_ID, product_ID, store_ID, employee_ID, sale_date_time) VALUES (2, 4, 3, 5, NOW());
INSERT INTO sales (customer_ID, product_ID, store_ID, employee_ID, sale_date_time) VALUES (3, 5, 4, 5, NOW());
INSERT INTO sales (customer_ID, product_ID, store_ID, employee_ID, sale_date_time) VALUES (3, 5, 3, 4, NOW());
INSERT INTO sales (customer_ID, product_ID, store_ID, employee_ID, sale_date_time) VALUES (4, 2, 4, 2, NOW());
