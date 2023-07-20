USE tabledb;

SELECT * FROM usertbl;
SELECT userid, name, addr FROM usertbl;

CREATE VIEW v_usertbl AS SELECT userid, name, addr FROM usertbl;
SELECT * FROM v_usertbl;

CREATE VIEW v_userbuytbl AS
	SELECT 
		U.userid AS 'USER ID', 
        U.name AS 'USER NAME',
		B.prodName AS 'Product Name',
        U.addr AS 'ADDRESS',
        CONCAT(U.mobile1, U.mobile2) AS 'MOBILE PHONE'
        
        FROM usertbl U
        INNER JOIN buytbl B
        ON U.userid = B.userid;
SELECT `USER ID`, `USER NAME` FROM v_userbuytbl;

ALTER VIEW v_userbuytbl AS
	SELECT 
		U.userid AS '사용자아이디', 
        U.name AS '이름',
		B.prodName AS '제품이름',
        U.addr ,
        CONCAT(U.mobile1, U.mobile2) AS '전화번호'
        
        FROM usertbl U INNER JOIN buytbl B ON U.userid = B.userid;

DESC v_userbuytbl;
DROP VIEW v_userbuytbl;
SELECT * FROM v_userbuytbl;

CREATE VIEW v_sum AS
	SELECT userid AS'userid', SUM(price*amount) AS 'total'
    FROM buytbl GROUP BY userid;

select * from buytbl;    
SELECT * FROM v_sum;

CREATE VIEW v_height177 AS
	SELECT * FROM usertbl WHERE height >=177;
SELECT * FROM v_height177;

INSERT INTO v_height177 VALUES ('KBM', '김병만', 1973, '서울', '010', '0000000', 158, '2013-5-5');

ALTER VIEW v_height177 AS
	SELECT * FROM usertbl WHERE height >=177
    WITH CHECK OPTION;
INSERT INTO v_height177 VALUES ('SJH', '서장훈', 1973, '서울', '010', '0000000', 158, '2013-5-5');
