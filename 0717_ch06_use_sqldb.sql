USE sqldb;
SELECT * FROM usertbl;
SELECT * FROM buytbl;
SELECT userID, prodName, amount FROM buytbl;

SELECT name, height FROM usertbl WHERE -- BETWEEN AND ;
SELECT name, height FROM usertbl WHERE -- IN( , ) ;

SELECT name, height FROM usertbl WHERE name LIKE '김%'; 
SELECT name, height FROM usertbl WHERE name LIKE '_종신'; 

SELECT name, height FROM usertbl 
	WHERE height > (SELECT height FROM usertbl WHERE Name = '임재범');
    
SELECT name, height FROM usertbl 
	WHERE height > ALL(SELECT height FROM usertbl WHERE addr = '경남');

SELECT name, mDate FROM usertbl;
SELECT name, mDate FROM usertbl ORDER BY mDate ASC;

SELECT DISTINCT addr FROM usertbl;

USE sqldb;
CREATE TABLE buytbl2 (SELECT * FROM buytbl);
SELECT * FROM buytbl2;

CREATE TABLE buytbl3 (SELECT userID, prodName FROM buytbl);
SELECT * FROM buytbl3;

SELECT userID AS '사용자아이디', SUM(amount*price) AS '총 구매액' FROM buytbl GROUP BY userID;

SELECT userID, AVG(amount) AS '평균구매개수' FROM buytbl GROUP BY userID;

SELECT * FROM usertbl;
SELECT name, height FROM usertbl
	WHERE height = (SELECT MAX(height) FROM usertbl)
    OR height = (SELECT MIN(height) FROM usertbl);

SELECT * FROM usertbl;
SELECT COUNT(mobile1) FROM usertbl;

SELECT userID AS '사용자', SUM(price*amount) AS '총구매액' 
	FROM buytbl GROUP BY userID
    HAVING SUM(price*amount) >1000
    ORDER BY SUM(price*amount) DESC;
    
SELECT num, groupName, SUM(price*amount) 
	FROM buytbl 
    GROUP BY groupName, num
    WITH ROLLUP;