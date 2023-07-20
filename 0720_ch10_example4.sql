USE sqlDB;

DROP PROCEDURE IF EXISTS cursorProc;
DELIMITER $$
CREATE PROCEDURE cursorProc()
BEGIN
	DECLARE userHeight INT;
    DECLARE cnt INT DEFAULT 0;
    DECLARE totalHeight INT DEFAULT 0;
    DECLARE endOfRow BOOLEAN DEFAULT FALSE;
    
    DECLARE userCursor CURSOR FOR SELECT height FROM usertbl;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET endOfRow = TRUE;

	OPEN userCursor;
	cursor_loop: 
    LOOP
		FETCH userCursor INTO userHeight;
        IF endOfRow THEN 
			LEAVE cursor_loop; -- break와 같음
        END IF;
    
		SET cnt = cnt+1;
        SET totalHeight = totalHeight + userHeight;
	END LOOP cursor_loop;
    
    SELECT CONCAT('고객키의 평균 : ', (totalHeight/cnt));
	CLOSE userCursor;
END $$
DELIMITER ;

CALL cursorProc();
SELECT AVG(height) FROM usertbl;

-- --
SELECT * FROM usertbl;
ALTER TABLE usertbl ADD grade VARCHAR(5);

DROP PROCEDURE IF EXISTS gradeProc;
DELIMITER $$
CREATE PROCEDURE gradeProc()
BEGIN
	DECLARE id VARCHAR(10);
    DECLARE hap BIGINT;
    DECLARE userGrade CHAR(5);
    DECLARE endOfRow BOOLEAN DEFAULT FALSE;
    
    DECLARE userCursor CURSOR FOR 
		SELECT U.userid, sum(B.price*B.amount)
			FROM buyTbl B
			RIGHT OUTER JOIN userTbl U
			ON B.userid = U.userid
			GROUP BY U.userid, U.name;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET endOfRow = TRUE;
    
    OPEN userCursor;
    
    grade_loop:
    LOOP
		FETCH userCursor INTO id, hap;
		IF endOfRow 
			THEN LEAVE grade_loop;
        END IF;
    
		CASE
			WHEN (hap >=1500) THEN SET userGrade = '최우수고객';
            WHEN (hap >=1000) THEN SET userGrade = '우수고객';
			WHEN (hap >=1) THEN SET userGrade = '일반고객';
            ELSE SET userGrade = '유령고객';
        END CASE;
		UPDATE usertbl SET grade = userGrade WHERE userID = id;
    END LOOP grade_loop;
    
    CLOSE userCursor;
END $$
DELIMITER ;

CALL gradeProc();
SELECT * FROM userTBL;

SELECT * FROM buyTBL;


