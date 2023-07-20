show databases;
use employees;
show table status;
show tables;
select * from titles;
select * from salaries;

DESC employees;
SELECT * FROM employees;
SELECT first_name, last_name FROM employees;
SELECT first_name AS 이름 , last_name AS 성 FROM employees;


USE employees;
SELECT * FROM employees ORDER BY hire_date ASC;
SELECT * FROM employees ORDER BY hire_date ASC LIMIT 5;
SELECT * FROM employees ORDER BY hire_date ASC LIMIT 10, 5;