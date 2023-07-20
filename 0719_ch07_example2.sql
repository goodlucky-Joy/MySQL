USE sqldb;

SELECT * FROM buytbl;
SELECT * FROM usertbl;

SELECT * FROM buytbl
	INNER JOIN usertbl
    ON buytbl.userID = usertbl.userID
    WHERE buytbl.userID = 'JYP';
    
    
SELECT 
	buytbl.userID AS '아이디', 
    usertbl.name AS '이름', 
    buytbl.prodName AS '구매물품', 
    usertbl.addr AS '주소', 
    CONCAT(usertbl.mobile1, usertbl.mobile2) AS '연락처'
	   
    FROM buytbl
	INNER JOIN usertbl
    ON buytbl.userID = usertbl.userID
    ORDER BY num DESC;
    
SELECT 
	B.userID AS '아이디', 
    U.name AS '이름', 
    B.prodName AS '구매물품', 
    U.addr AS '주소', 
    CONCAT(U.mobile1,'-', U.mobile2) AS '연락처'
	   
    FROM buytbl B
	INNER JOIN usertbl U
    ON B.userID = U.userID
    ORDER BY U.userID;
    
SELECT DISTINCT
	U.userID AS '아이디', 
    U.name AS '이름', 
    U.addr AS '주소' 
    
    FROM buytbl B
	INNER JOIN usertbl U
    ON B.userID = U.userID
    ORDER BY U.userID;
   
   
SELECT name, CONCAT(mobile1, mobile2) AS '전화번호'
	FROM usertbl
    WHERE name IN(SELECT name FROM usertbl WHERE mobile1 IS NULL);
    
SELECT name, CONCAT(mobile1, mobile2) AS '전화번호'
	FROM usertbl
    WHERE name NOT IN(SELECT name FROM usertbl WHERE mobile1 IS NULL);
    
    
    
    
    