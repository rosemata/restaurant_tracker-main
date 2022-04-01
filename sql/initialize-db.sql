DROP DATABASE IF EXISTS restaurant_tracker;
CREATE DATABASE restaurant_tracker;

use  restaurant_tracker;

CREATE TABLE location (
	zip_code CHAR(5) UNIQUE NOT NULL,
	city_name VARCHAR(30) UNIQUE NOT NULL,

	PRIMARY KEY(zip_code)
);

CREATE TABLE restaurant (
	restaurant_id SMALLINT AUTO_INCREMENT UNIQUE NOT NULL,
	zip_code CHAR(5) UNIQUE NOT NULL,
	state VARCHAR(20) NOT NULL,
	num_of_employees SMALLINT NOT NULL,
  
	PRIMARY KEY(restaurant_id),
	FOREIGN KEY(zip_code) REFERENCES location(zip_code)
);

CREATE TABLE employee (
  employee_id INT UNIQUE NOT NULL,
  restaurant_id SMALLINT UNIQUE NOT NULL,
  name VARCHAR(50) NOT NULL,
  job_title VARCHAR(30) NOT NULL,
  salary INT NOT NULL,
  
  PRIMARY KEY(employee_id),
  FOREIGN KEY(restaurant_id) REFERENCES restaurant(restaurant_id)
);

CREATE TABLE customer (
	customer_id INT AUTO_INCREMENT UNIQUE NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    name VARCHAR(40) NOT NULL,
    email VARCHAR(50) NOT NULL,
    
    PRIMARY KEY(customer_id)
);

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

CREATE TABLE order_details (
	id SMALLINT AUTO_INCREMENT UNIQUE NOT NULL,
    order_id SMALLINT UNIQUE NOT NULL,
    quantity SMALLINT NOT NULL,
    cost SMALLINT NOT NULL,
    
    PRIMARY KEY(id)
);