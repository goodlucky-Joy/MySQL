DROP DATABASE GisDB;
CREATE DATABASE GisDB;

USE GisDB;

CREATE TABLE StreamTbl(
	MapNumber	CHAR(10),
    StreamName	CHAR(20),
    Stream		GEOMETRY
);


INSERT INTO StreamTbl VALUES ( '330000001' ,  '한류천', 
	ST_GeomFromText('LINESTRING (-10 30, -50 70, 50 70)'));
INSERT INTO StreamTbl VALUES ( '330000001' ,  '안양천', 
	ST_GeomFromText('LINESTRING (-50 -70, 30 -10, 70 -10)'));
INSERT INTO StreamTbl VALUES ('330000002' ,  '일산천', 
	ST_GeomFromText('LINESTRING (-70 50, -30 -30, 30 -60)'));
    
SELECT * FROM Streamtbl WHERE StreamName = '한류천';    
SELECT * FROM Streamtbl WHERE StreamName = '안양천';
SELECT * FROM Streamtbl;