SELECT userid AS '사용자' , SUM(price*amount) AS '총구매액'
	FROM buytbl GROUP BY userid;
    
WITH abc(userid, total)
AS
(SELECT userid , SUM(price*amount) FROM buytbl GROUP BY userid)
SELECT * FROM abc ORDER BY total DESC; 

