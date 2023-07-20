USE sqlDB;

DROP PROCEDURE IF EXISTS userPoc;
DELIMITER $$
CREATE PROCEDURE userProc()
BEGIN
	SELECT * FROM userTbl;
END $$
DELIMITER ;

CALL userProc();

DROP PROCEDURE IF EXISTS userProc1;
DELIMITER $$
CREATE PROCEDURE userProc1(IN userName VARCHAR(10))
BEGIN
	SELECT * FROM userTbl WHERE name = userName;
END $$
DELIMITER ;

CALL userProc1('조관우');


DROP PROCEDURE IF EXISTS userProc2;
DELIMITER $$
CREATE PROCEDURE userProc2(IN userBirth INT, userHeight INT)
BEGIN
	SELECT * FROM userTbl 
		WHERE birthYear>userBirth AND height > userHeight;
END $$
DELIMITER ;
CALL userProc2(1970,178);
SELECT * FROM userTbl;


-- -- -- --
DROP PROCEDURE IF EXISTS userProc3;
DELIMITER $$
CREATE PROCEDURE userProc3(IN txtValue CHAR(10), OUT outValue INT)
BEGIN
	INSERT INTO testTBL VALUES(NULL, txtValue);
    SELECT MAX(id) INTO outValue FROM testTBL;
END $$	
DELIMITER ;

CREATE TABLE IF NOT EXISTS testTBL(
	id	INT AUTO_INCREMENT PRIMARY KEY,
    txt CHAR(10)
);

CALL userProc3('3번째 호출', @myValue);
SELECT CONCAT('현재 입력된 ID 값 ->', @myValue);
SELECT * FROM testTBL;















