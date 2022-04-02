CREATE VIEW location_view AS
SELECT * FROM restaurant_tracker.location
WHERE zip_code >= 30000
ORDER BY zip_code ASC;

CREATE VIEW restaurant_view AS
SELECT * FROM restaurant_tracker.restaurant
WHERE restaurant_id > 1
ORDER BY restaurant_id DESC;

CREATE VIEW restaurant_avg_view AS
SELECT * FROM restaurant_tracker.restaurant
WHERE num_of_employees > ( SELECT AVG(num_of_employees)
						   FROM restaurant )
ORDER BY restaurant_id ASC;

CREATE VIEW long_employee_name_view AS
SELECT * FROM restaurant_tracker.employee
WHERE LENGTH(name) > 10
ORDER BY LENGTH(name) ASC;

CREATE VIEW restaurant_city_view AS
SELECT restaurant_id, state, num_of_employees, city_name FROM restaurant_tracker.restaurant
JOIN restaurant_tracker.location 
	ON (location.zip_code = restaurant.zip_code)
WHERE EXISTS (SELECT num_of_employees);

CREATE VIEW lots_of_employees_view AS
SELECT restaurant.restaurant_id, restaurant.state, restaurant.num_of_employees, location.city_name,
	   employee.employee_id, employee.name, employee.job_title, employee.salary
FROM restaurant_tracker.restaurant
JOIN restaurant_tracker.location 
	ON (location.zip_code = restaurant.zip_code)
JOIN restaurant_tracker.employee
	ON (employee.restaurant_id = restaurant.restaurant_id)
WHERE num_of_employees > (SELECT AVG(num_of_employees)
						  FROM restaurant);