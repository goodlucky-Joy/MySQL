
USE tabledb;
DROP TABLE IF EXISTS buytbl, usertbl;
CREATE TABLE usertbl 
( userID  CHAR(8), 
  name    VARCHAR(10),
  birthYear   INT,  
  addr	  CHAR(2), 
  mobile1	CHAR(3), 
  mobile2   CHAR(8), 
  height    SMALLINT, 
  mDate    DATE 
);
CREATE TABLE buytbl 
(  num int AUTO_INCREMENT PRIMARY KEY,
   userid  CHAR(8),
   prodName CHAR(6),
   groupName CHAR(4),
   price     INT ,
   amount   SMALLINT
);


INSERT INTO usertbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO usertbl VALUES('KBS', '김범수', NULL, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO usertbl VALUES('KKH', '김경호', 1871, '전남', '019', '3333333', 177, '2007-7-7');
INSERT INTO usertbl VALUES('JYP', '조용필', 1950, '경기', '011', '4444444', 166, '2009-4-4');
SELECT * FROM usertbl;

INSERT INTO buytbl VALUES(NULL, 'KBS', '운동화', NULL   , 30,   2);
INSERT INTO buytbl VALUES(NULL,'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buytbl VALUES(NULL,'JYP', '모니터', '전자', 200,  1);
INSERT INTO buytbl VALUES(NULL,'BBK', '모니터', '전자', 200,  5);
SELECT * FROM buytbl;

DESC usertbl;
ALTER TABLE usertbl
	ADD CONSTRAINT PK_usertbl_userID
	PRIMARY KEY (userID);


DELETE FROM buytbl WHERE userid = 'BBK';

ALTER TABLE buytbl
	ADD CONSTRAINT FK_usertbl_buytbl
	FOREIGN KEY (userID)
	REFERENCES usertbl (userID);
DESC buytbl;

SELECT * FROM userTBL;
UPDATE usertbl SET birthYear = 1979 WHERE name = '김범수';
UPDATE usertbl SET birthYear = 1971 WHERE name = '김경호';

ALTER TABLE userTBL
	ADD CONSTRAINT CK_birthYear
	CHECK ( (birthYear >= 1900 AND birthYear <= 2023) AND (birthYear IS NOT NULL) );
DESC usertbl;


INSERT INTO usertbl VALUES('LSG', '이승기', 2030, '서울', '011', '1111111', 182, '2008-8-8');

INSERT INTO usertbl VALUES('SSK', '성시경', 1979, '서울', NULL  , NULL , 186, '2013-12-12');
INSERT INTO usertbl VALUES('LJB', '임재범', 1963, '서울', '016', '6666666', 182, '2009-9-9');
INSERT INTO usertbl VALUES('YJS', '윤종신', 1969, '경남', NULL  , NULL , 170, '2005-5-5');
INSERT INTO usertbl VALUES('EJW', '은지원', 1972, '경북', '011', '8888888', 174, '2014-3-3');
INSERT INTO usertbl VALUES('JKW', '조관우', 1965, '경기', '018', '9999999', 172, '2010-10-10');
INSERT INTO usertbl VALUES('BBK', '바비킴', 1973, '서울', '010', '0000000', 176, '2013-5-5');

SELECT * FROM usertbl;

UPDATE usertbl SET userID = 'aaa' WHERE userID = 'BBK';

SET foreign_key_checks = 0;
SET foreign_key_checks = 1;

SELECT count(*) FROM usertbl;




