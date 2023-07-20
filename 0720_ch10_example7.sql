USE sqlDB;

DROP TRIGGER IF EXISTS userTbl_BeforeInsertTrg;
DELIMITER //
CREATE TRIGGER userTbl_BeforeInsertTrg
	BEFORE INSERT
    ON userTBL
    FOR EACH ROW
BEGIN
	IF NEW.birthYear <1900 THEN SET NEW.birthYear=0;
    ELSEIF NEW.birthYear > Year(CURDATE()) THEN	SET NEW.birthYear=YEAR(CURDATE());
    END IF;
END //
DELIMITER ;

INSERT INTO usertbl VALUES('AAA', '에이', 1887, '서울', '011', '1111111', 182, '2008-8-8', NULL);
INSERT INTO usertbl VALUES('BBB', '비비', 2050, '서울', '011', '1111111', 182, '2008-8-8', NULL);

SELECT * FROM userTbl;
SHOW TRIGGERS FROM sqlDB;