
DROP DATABASE tabledb;
CREATE DATABASE tabledb;

USE tabledb;

DROP TABLE IF EXISTS buytbl, usertbl;
CREATE TABLE usertbl
(
	userID    CHAR(8) NOT NULL PRIMARY KEY,
	name	  VARCHAR(10) NOT NULL,
	birthYear INT NOT NULL,
	addr      CHAR(2) NOT NULL,
	mobile1   CHAR(3) NULL,
    mobile2   CHAR(8) NULL,
    height	  SMALLINT NULL,
    mDate	  DATE NULL
);

CREATE TABLE buytbl
(
	num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    userid CHAR(8) NOT NULL,
    prodName CHAR(6) NOT NULL,
    groupName CHAR(4) NULL,
    price INT NOT NULL,
    amount SMALLINT NOT NULL,
    FOREIGN KEY(userid) REFERENCES usertbl(userID)
);


INSERT INTO usertbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO usertbl VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO usertbl VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');

INSERT INTO buytbl VALUES(NULL, 'KBS', '운동화', NULL, 30, 2);
INSERT INTO buytbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buytbl VALUES(NULL, 'JYP', '모니터', '전자', 200, 1);

SELECT * from usertbl;
SELECT * from buytbl;

DESC usertbl;
DESC buytbl;

DROP TABLE IF EXISTS userTBL;
CREATE TABLE userTBL
(
	userID    CHAR(8) NOT NULL,
	name	  VARCHAR(10) NOT NULL,
	birthYear INT NOT NULL,
	CONSTRAINT PRIMARY KEY PK_userTBL_userID (userID)
);




CREATE TABLE userTBL
(
	userID    CHAR(8) NOT NULL,
	name	  VARCHAR(10) NOT NULL,
	birthYear INT NOT NULL
);
ALTER TABLE userTBL
	ADD CONSTRAINT PK_userTBL_userID PRIMARY KEY (userID);


DROP TABLE IF EXISTS prodTBL;
CREATE TABLE prodTBL(
	prodCode  CHAR(3) NOT NULL,
    prodID	  CHAR(4) NOT NULL,
    prodDate  DATETIME NOT NULL,
    prodCur   CHAR(10) NULL
);
ALTER TABLE prodTBL
	ADD CONSTRAINT PK_prodTBL_prodCode_prodID PRIMARY KEY (prodCode, prodID);

DESC prodTBL;
SHOW INDEX FROM prodTBL;


/* 외래키 */

DROP TABLE IF EXISTS buytbl, usertbl;
CREATE TABLE usertbl
(
	userID    CHAR(8) NOT NULL PRIMARY KEY,
	name	  VARCHAR(10) NOT NULL,
	birthYear INT NOT NULL
);

CREATE TABLE buytbl
(
	num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    userid CHAR(8) NOT NULL,
    prodName CHAR(6) NOT NULL,
    FOREIGN KEY(userid) REFERENCES usertbl(userID)
);

DROP TABLE IF EXISTS buytbl;
CREATE TABLE buytbl
(
	num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    userid CHAR(8) NOT NULL,
    prodName CHAR(6) NOT NULL,
    CONSTRAINT FK_userTBL_buyTBL FOREIGN KEY(userid) REFERENCES usertbl(userID)
);
DESC buytbl;

DROP TABLE IF EXISTS buytbl;
CREATE TABLE buytbl
(
	num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    userid CHAR(8) NOT NULL,
    prodName CHAR(6) NOT NULL
);
ALTER TABLE buyTBL
	ADD CONSTRAINT FK_userTBL_buyTBL FOREIGN KEY(userid) REFERENCES usertbl(userID);
ALTER TABLE buyTBL
	DROP FOREIGN KEY FK_userTBL_buyTBL;

ALTER TABLE buyTBL
	ADD CONSTRAINT FK_userTBL_buyTBL 
    FOREIGN KEY(userid) REFERENCES usertbl(userID)
    ON UPDATE CASCADE;


DROP TABLE IF EXISTS buytbl, usertbl;
CREATE TABLE usertbl
(
	userID    CHAR(8) NOT NULL PRIMARY KEY,
	name	  VARCHAR(10) NOT NULL,
	birthYear INT NOT NULL,
    email 	  CHAR(30) NULL UNIQUE
);
SHOW INDEX FROM usertbl;

DROP TABLE IF EXISTS buytbl, usertbl;
CREATE TABLE usertbl
(
	userID    CHAR(8) NOT NULL PRIMARY KEY,
	name	  VARCHAR(10) NOT NULL,
	birthYear INT NOT NULL,
    email 	  CHAR(30) NULL,
    CONSTRAINT AK_email UNIQUE (email)
);
SHOW INDEX FROM usertbl;

DROP TABLE IF EXISTS buytbl, usertbl;
CREATE TABLE usertbl
(
	userID    CHAR(8) PRIMARY KEY,
	name	  VARCHAR(10),
	birthYear INT 
		CHECK (birthYear >=1900 AND birthYear <=2023),
    email 	  CHAR(30) NULL,
    CONSTRAINT CK_name CHECK (name IS NOT NULL)
);

INSERT INTO usertbl VALUES ('12345679', '홍둘리', 2025, NULL);
SELECT * FROM usertbl;

DROP TABLE IF EXISTS buytbl, usertbl;
CREATE TABLE usertbl
(
	userID    CHAR(8) NOT NULL PRIMARY KEY,
	name	  VARCHAR(10) NOT NULL,
	birthYear INT NOT NULL DEFAULT -1,
	addr      CHAR(2) NOT NULL DEFAULT '서울',
	mobile1   CHAR(3) NULL,
    mobile2   CHAR(8) NULL,
    height	  SMALLINT NULL DEFAULT 170,
    mDate	  DATE NULL
);

INSERT INTO usertbl VALUES('LSG', '이승기', default, DEFAULT, '011', '1111111', DEFAULT, '2008-8-8');
SELECT * FROM usertbl;

DESC usertbl;

ALTER TABLE usertbl 
	ADD homepage VARCHAR(30) DEFAULT 'http://naver.com' NULL;
DESC usertbl;

ALTER TABLE usertbl 
	DROP COLUMN mobile1;
DESC usertbl;

ALTER TABLE usertbl
	CHANGE COLUMN name uName VARCHAR(20) NULL;
DESC usertbl;

ALTER TABLE usertbl
	DROP PRIMARY KEY;