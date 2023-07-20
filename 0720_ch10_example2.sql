USE sqlDB;

DROP PROCEDURE IF EXISTS ifelseProc;
DELIMITER &&
CREATE PROCEDURE ifelseProc(IN userName VARCHAR(10))
BEGIN
	DECLARE bYear INT;
    SELECT birthYear into bYear FROM userTBL WHERE name = userName;
	IF(bYear >=1980) 
		THEN SELECT '아직 젊군요';
	ELSE 
		SELECT '나이가 지긋하시네요';
    END IF;
END &&
DELIMITER ;

SELECT * FROM userTBL;
CALL ifelseProc('이승기');

-- -- --
DROP PROCEDURE IF EXISTS caseProc;
DELIMITER $$
CREATE PROCEDURE caseProc(IN userName VARCHAR(10))
BEGIN
	DECLARE bYear INT;
    DECLARE tti CHAR(3);
    SELECT birthYear INTO bYear FROM userTBL WHERE name = userName;
	CASE
		WHEN (bYear%12 = 0) THEN SET tti = '원숭이';
        WHEN (bYear%12 = 1) THEN SET tti = '닭';
        WHEN (bYear%12 = 2) THEN SET tti = '개';
        WHEN (bYear%12 = 3) THEN SET tti = '돼지';
        WHEN (bYear%12 = 4) THEN SET tti = '쥐';
        WHEN (bYear%12 = 5) THEN SET tti = '소';
        WHEN (bYear%12 = 6) THEN SET tti = '호랑이';
        WHEN (bYear%12 = 7) THEN SET tti = '토끼';
        WHEN (bYear%12 = 8) THEN SET tti = '용';
        WHEN (bYear%12 = 9) THEN SET tti = '뱀';
        WHEN (bYear%12 = 10) THEN SET tti = '말';
        ELSE SET tti = '양';
	END CASE;
    SELECT CONCAT(userName, '의 띠 : ', tti);
END $$
DELIMITER ;

CALL caseProc('김범수');
SELECT * FROM userTBL;

-- -- --
DROP TABLE IF EXISTS guguTBL;
CREATE TABLE guguTBL (txt VARCHAR(100));

DROP PROCEDURE IF EXISTS whileProc;
DELIMITER $$
CREATE PROCEDURE whileProc()
BEGIN
	DECLARE str VARCHAR(100);
    DECLARE i INT;
    DECLARE k INT;
    SET i = 2;
    WHILE(i<10) DO
		SET str = '';
        SET k = 1;
        WHILE (k<10) DO
			SET str = CONCAT(str, ' ', i, 'x', k, '=', i*k);
			SET k = k+1;
        END WHILE;
        SET i = i + 1;
        INSERT INTO guguTBL VALUES(str);
	END WHILE;
END $$
DELIMITER ;

CALL whileProc();
SELECT * FROM guguTBL;

--
DROP PROCEDURE IF EXISTS errorProc;
DELIMITER $$
CREATE PROCEDURE errorProc()
BEGIN
	DECLARE i INT;
    DECLARE hap INT;
    DECLARE saveHap INT;
    
    DECLARE EXIT HANDLER FOR 1264
    BEGIN
		SELECT CONCAT('INT 오버플로 직전의 합계 : ', saveHap);
        SELECT CONCAT('1+2+3+4+....+',i,'=오버플로');
    END;
    
    SET i = 1;
    SET hap = 0;
    
    WHILE(TRUE) DO
		SET saveHap = hap;
        SET hap = hap + i;
        SET i = i + 1;
	END WHILE;
END $$
DELIMITER ;

CALL errorProc();

--
SELECT * FROM INFORMATION_SCHEMA.ROUTINES
	WHERE routine_schema = 'sqldb' AND routine_type = 'PROCEDURE';
    
SELECT * FROM INFORMATION_SCHEMA.PARAMETERS
	WHERE specific_name = 'userProc3';
    
--
DROP PROCEDURE IF EXISTS nameProc;
DELIMITER $$
CREATE PROCEDURE nameProc(IN tblName VARCHAR(20))
BEGIN
	SET @sqlQuery = CONCAT('SELECT * FROM ', tblName);
    PREPARE myQuery FROM @sqlQuery;
    EXECUTE myQuery;
    DEALLOCATE PREPARE myQuery;
END $$
DELIMITER ;

CALL nameProc('userTBL');




SELECT * FROM INFORMATION_SCHEMA.ROUTINES
	WHERE routine_schema = 'sqldb' AND routine_type = 'PROCEDURE';
    
SELECT * FROM INFORMATION_SCHEMA.PARAMETERS
	WHERE specific_name = 'userProc3';


USE INFORMATION_SCHEMA;
SHOW tables;

SELECT * FROM INFORMATION_SCHEMA.ROUTINES;
SELECT * FROM INFORMATION_SCHEMA.PARAMETERS;
SELECT * FROM INFORMATION_SCHEMA.TABLES ;

    
    