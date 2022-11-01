CREATE TABLE department(
id SERIAL PRIMARY KEY,
name VARCHAR (100),
isProfit VARCHAR (3));

INSERT INTO department (name,isprofit) VALUES ('Бухгалтерия','нет');
INSERT INTO department (name,isprofit) VALUES ('Кредитный отдел','да');
INSERT INTO department (name,isprofit) VALUES ('Отдел продаж','да');
INSERT INTO department (name,isprofit) VALUES ('Правление','нет');

CREATE TABLE employee(
id SERIAL PRIMARY KEY,
full_name VARCHAR,
salary int,
department_id INT REFERENCES department (id));

INSERT INTO employee (full_name,salary,department_id) VALUES ('Петров Иван',30000,3);
INSERT INTO employee (full_name,salary,department_id) VALUES ('Иванова Наталья',50000,1);
INSERT INTO employee (full_name,salary,department_id) VALUES ('Мирских Петр',100000,4);
INSERT INTO employee (full_name,salary,department_id) VALUES ('Улюкаев Владимир',200000,4);
INSERT INTO employee (full_name,salary,department_id) VALUES ('Зиморский Виктор',70000,2);

SELECT e.id,e.full_name,e.salary FROM employee AS e JOIN department AS d ON e.department_id = d.id
WHERE d.name = 'Правление';

SELECT SUM(salary) AS total_sum FROM employee;

SELECT e.full_name,d.isprofit FROM employee AS e JOIN department AS d ON e.department_id = d.id
WHERE d.isprofit = 'да';

SELECT * FROM employee
WHERE salary BETWEEN 10000 AND 100000;

DELETE FROM employee
WHERE full_name = 'Мирских Петр';

UPDATE department 
SET name = 'Депозитный', isprofit = 'нет'
WHERE name='Кредитный отдел';

SELECT * FROM employee
WHERE LOWER(full_name) LIKE '%иван%';

SELECT AVG(salary) AS avg_salary, d.name FROM employee AS e JOIN department AS d ON e.department_id = d.id
GROUP BY name
