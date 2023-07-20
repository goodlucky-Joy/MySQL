USE sqldb;

CREATE TABLE testTbl1 (id int, userName char(3), age int);
INSERT	INTO testTbl1 VALUES (1, '홍길동', 25);
SELECT * FROM testTbl1;

INSERT INTO testTbl1 (id, userName) VALUES (2, '설현');
SELECT * FROM testTbl1;

INSERT INTO testTbl1 (userName, age, id) VALUES ('하니',26,3);
SELECT * FROM testTbl1;


CREATE TABLE testTbl2 (
	id int AUTO_INCREMENT PRIMARY KEY, 
	userName char(3), 
	age int
);
INSERT	INTO testTbl2 VALUES (NULL, '홍길동', 25);
INSERT	INTO testTbl2 VALUES (NULL, '김길동', 22);
INSERT	INTO testTbl2 VALUES (NULL, '박길동', 21);
SELECT * FROM testTbl2;

ALTER TABLE testTbl2 AUTO_INCREMENT=1000;
SET @@auto_increment_increment=3;
INSERT INTO testTbl2 VALUES (NULL, '미희', 23);
INSERT INTO testTbl2 VALUES (NULL, '찬영', 23);
SELECT * FROM testTbl2;

CREATE TABLE testTbl4 (id int, Fname varchar(50), Lname varchar(50));
INSERT INTO testTbl4 
	SELECT emp_no, first_name, last_name FROM employees.employees;
SELECT * FROM testTbl4;

CREATE TABLE testTbl5 
	SELECT emp_no, first_name, last_name FROM employees.employees;
SELECT * FROM testTbl5;

UPDATE testTbl4 SET Lname = '없음' WHERE Fname = 'Kyoichi';
SELECT * FROM testTbl4;

SELECT * FROM buytbl;
UPDATE buytbl SET price = price * 1.5;
SELECT * FROM buytbl;

SELECT * FROM testTbl4 WHERE Fname = 'Aamer';
DELETE FROM testTbl4 WHERE Fname = 'Aamer' LIMIT 5;
SELECT * FROM testTbl4 WHERE Fname = 'Aamer';

CREATE TABLE bigTbl1 
	(SELECT * FROM employees.employees);
CREATE TABLE bigTbl2
	(SELECT * FROM employees.employees);    
CREATE TABLE bigTbl3
	(SELECT * FROM employees.employees);
    
DELETE FROM bigTbl1;
DROP TABLE bigTbl2;
TRUNCATE TABLE bigTbl3;

CREATE TABLE memberTBL
	SELECT userID, name, addr FROM usertbl	LIMIT 3;
ALTER TABLE memberTBL
	ADD	CONSTRAINT pk_memberTBL PRIMARY KEY (userID);
    
SELECT * FROM memberTBL;

INSERT IGNORE INTO memberTBL VALUES ('BBK', '비비코', '미국');
INSERT IGNORE INTO memberTBL VALUES ('SJH', '서장훈', '서울');
INSERT IGNORE INTO memberTBL VALUES ('HJY', '현주엽', '경기');
SELECT * FROM memberTBL;

INSERT INTO memberTBL VALUES ('BBK', '비비코', '미국') 
	ON DUPLICATE KEY UPDATE name = '비비코', addr = '미국';

SELECT * FROM memberTBL;







