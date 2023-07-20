USE sqlDB;
DROP TABLE buyTbl;

CREATE TABLE backup_usertbl -- 회원 테이블
( userID  	CHAR(8) NOT NULL PRIMARY KEY, -- 사용자 아이디(PK)
  name    	VARCHAR(10) NOT NULL, -- 이름
  birthYear   INT NOT NULL,  -- 출생년도
  addr	  	CHAR(2) NOT NULL, -- 지역(경기,서울,경남 식으로 2글자만입력)
  mobile1	CHAR(3), -- 휴대폰의 국번(011, 016, 017, 018, 019, 010 등)
  mobile2	CHAR(8), -- 휴대폰의 나머지 전화번호(하이픈제외)
  height    	SMALLINT,  -- 키
  mDate    	DATE,  -- 회원 가입일
  modType   CHAR(2),
  modDate	DATE,
  modUser	VARCHAR(256)
);

DROP TRIGGER IF EXISTS backUserTbl_UpdateTrg;
DELIMITER //
CREATE TRIGGER backUserTbl_UpdateTrg
	AFTER UPDATE
    ON userTBL
    FOR EACH ROW
BEGIN
	INSERT INTO backup_usertbl 
		VALUES(
			OLD.userID,	
			OLD.name,  	
			OLD.birthYear ,  
			OLD.addr	,  	
			OLD.mobile1	,
			OLD.mobile2	,
			OLD.height ,   	
			OLD.mDate,  
			'수정',
            CURDATE(),
            CURRENT_USER()
		);
END //
DELIMITER ;

UPDATE userTbl SET addr='몽고' WHERE userID = 'JKW';
SELECT * FROM backup_usertbl;

DROP TRIGGER IF EXISTS backUserTbl_DeleteTrg;
DELIMITER //
CREATE TRIGGER backUserTbl_DeleteTrg
	AFTER DELETE
    ON userTBL
    FOR EACH ROW
BEGIN
	INSERT INTO backup_usertbl 
		VALUES(
			OLD.userID,	
			OLD.name,  	
			OLD.birthYear ,  
			OLD.addr	,  	
			OLD.mobile1	,
			OLD.mobile2	,
			OLD.height ,   	
			OLD.mDate,  
			'삭제',
            CURDATE(),
            CURRENT_USER()
		);
END //
DELIMITER ;

DELETE FROM userTbl WHERE height >= 177;
SELECT * FROM backup_usertbl;

SELECT * FROM userTbl;
TRUNCATE TABLE userTbl;
SELECT * FROM backup_usertbl;

DROP TRIGGER IF EXISTS userTbl_InsertTrg;
DELIMITER //
CREATE TRIGGER userTbl_InsertTrg
	AFTER INSERT
    ON userTBL
    FOR EACH ROW
BEGIN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '데이터입력시도. 귀하의 정보가 서버에 기록됨';
END //
DELIMITER ;

INSERT INTO userTbl VALUES ('ABC', '에비씨', 1977, '서울', '011', '1111111', 181, '2019-12-25', NULL);
DESC userTbl;




