DROP DATABASE IF EXISTS restaurant_tracker;
CREATE DATABASE restaurant_tracker;

use  restaurant_tracker;

CREATE TABLE location (
	zip_code CHAR(5) UNIQUE NOT NULL,
	city_name VARCHAR(30) UNIQUE NOT NULL,

	PRIMARY KEY(zip_code)
);

INSERT INTO restaurant_tracker.location
VALUES(59101, 'Billings'),
	  (11743, 'Huntington'),
	  (30024, 'Mchenry'),
	  (60011, 'Roselle'),
	  (32728, 'Winter Springs');

CREATE TABLE restaurant (
	restaurant_id SMALLINT AUTO_INCREMENT UNIQUE NOT NULL,
	zip_code CHAR(5) UNIQUE NOT NULL,
	state VARCHAR(20) NOT NULL,
	num_of_employees SMALLINT NOT NULL,
  
	PRIMARY KEY(restaurant_id),
	FOREIGN KEY(zip_code) REFERENCES location(zip_code)
);

INSERT INTO restaurant_tracker.restaurant
VALUES (1, 59101, 'MT', 10),
	   (2, 11743, 'NY', 15),
	   (3, 30024, 'GA', 18),
	   (4, 60011, 'IL', 12),
	   (5, 32728, 'FL', 29);
       
CREATE TABLE employee (
  employee_id INT UNIQUE NOT NULL,
  restaurant_id SMALLINT UNIQUE NOT NULL,
  name VARCHAR(50) NOT NULL,
  job_title VARCHAR(30) NOT NULL,
  salary INT NOT NULL,
  
  PRIMARY KEY(employee_id),
  FOREIGN KEY(restaurant_id) REFERENCES restaurant(restaurant_id)
);

INSERT INTO restaurant_tracker.employee
VALUES (123, 1, 'Mort Becka', 'Line Cook', 53000),
	   (125, 2, 'Kemp Dinah', 'Host', 30000),
	   (217, 3, 'Jaye Normina', 'Hostess', 30000),
	   (236, 5, 'Odetta Keitha', 'Supervisor', 100000),
	   (256, 4, 'Kaleigh Christobel', 'Manager', 80000);

CREATE TABLE customer (
	customer_id INT AUTO_INCREMENT UNIQUE NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    name VARCHAR(40) NOT NULL,
    email VARCHAR(50) NOT NULL,
    
    PRIMARY KEY(customer_id)
);

INSERT INTO restaurant_tracker.customer
VALUES (1, 630 551 1234, 'Kurtis Jemison', 'kurtis2@gmail.com'),
	   (2, 630 694 9273, 'Roselle Mata', 'rmata@gmail.com'),
	   (3, 458 894 5534, 'Jimmy John', 'jimmyjohn@gmail.com'),
	   (4, 213 312 1239, 'Karen James', 'karenJames@gmail.com'),
	   (5, 985 248 1235, 'Chuck E Cheese', 'chuck@cheese.com');

CREATE TABLE customer_order (
	order_id SMALLINT AUTO_INCREMENT UNIQUE NOT NULL,
    customer_id INT UNIQUE NOT NULL,
    restaurant_id SMALLINT UNIQUE NOT NULL,
    date DATE NOT NULL,
    total_cost SMALLINT NOT NULL,
    num_items SMALLINT NOT NULL,
    
    PRIMARY KEY(order_id),
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
    FOREIGN KEY(restaurant_id) REFERENCES restaurant(restaurant_id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

INSERT INTO restaurant_tracker.customer_order
VALUES (1, 1, 1, '2022-02-13', 640, 23),
	   (2, 2, 2, '2022-02-16', 23, 4),
	   (3, 3, 3, '2022-02-26', 59, 6),
	   (4, 4, 5, '2022-02-13', 78, 7),
	   (5, 5, 5, '2022-02-20', 15, 2);
       
CREATE TABLE order_details (
	id SMALLINT AUTO_INCREMENT UNIQUE NOT NULL,
    order_id SMALLINT UNIQUE NOT NULL,
    quantity SMALLINT NOT NULL,
    cost SMALLINT NOT NULL,
    
    PRIMARY KEY(id)
);

INSERT INTO restaurant_tracker.order_details
VALUES (1, 13, 10, 100),
	   (2, 5, 9, 27),
	   (3, 89, 13, 37),
	   (4, 58, 123, 500),
	   (5, 78, 329, 121);
