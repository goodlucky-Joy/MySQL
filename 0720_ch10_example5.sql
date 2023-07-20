CREATE DATABASE IF NOT EXISTS testDB;
USE testDB;

CREATE TABLE IF NOT EXISTS testTbl (id INT, txt VARCHAR(10));
INSERT INTO testTbl VALUES (1, '레드벨벳');
INSERT INTO testTbl VALUES (2, '잇지');
INSERT INTO testTbl VALUES (3, '블랙핑크');

SELECT * from testTBL;

DROP TRIGGER IF EXISTS testTrg;
DELIMITER //
CREATE TRIGGER testTrg
	AFTER UPDATE
    ON testTbl
    FOR EACH ROW
BEGIN
	SET @msg = '가수 그룹이 수정됨';
END //
DELIMITER ;

SET @msg = '';
INSERT INTO testTbl VALUES (4, '마마무');
SELECT @msg;
UPDATE testTbl SET txt = '블핑' WHERE id = 3;
SELECT @msg;
DELETE FROM testTbl WHERE id = 4;
SELECT @msg;






