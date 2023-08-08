CREATE DATABASE TEST2;
SET SQL_SAFE_UPDATES=0;
USE TEST2;
# 거래내역에 대한 테이블을 만들고 시간을 저장해서
# 기간을 기점으로 거래내역을 구하시오! 


# 테이블 생성 
CREATE TABLE TRANSACTIONS(
ID 			INT, -- 고유 번호 AS 
AMOUNT 		DECIMAL(12,2), -- 거래 금액(총 12자리 숫자, 소수점 이하 2자리)
MSG 		VARCHAR(20),  -- 메시지 
CREATE_AT 	TIMESTAMP -- 거래 시각 
);

DESC TRANSACTIONS;

# 데이터 삽입 
INSERT INTO
  transactions(id, amount, msg, create_at)
VALUES
  (1,   -24.20, 'Google',          '2021-11-01 10:02:48'),
  (2,   -36.30, 'Amazon',          '2021-11-02 10:01:05'),
  (3,   557.13, 'Udemy',           '2021-11-10 11:00:09'),
  (4,  -684.04, 'Bank of America', '2021-11-15 17:30:16'),
  (5,   495.71, 'PayPal',          '2021-11-26 10:30:20'),
  (6,   726.87, 'Google',          '2021-11-26 10:31:04'),
  (7,   124.71, 'Amazon',          '2021-11-26 10:32:02'),
  (8,   -24.20, 'Google',          '2021-12-01 10:00:21'),
  (9,   -36.30, 'Amazon',          '2021-12-02 10:03:43'),
  (10,  821.63, 'Udemy',           '2021-12-10 11:01:19'),
  (11, -837.25, 'Bank of America', '2021-12-14 17:32:54'),
  (12,  695.96, 'PayPal',          '2021-12-27 10:32:02'),
  (13,  947.20, 'Google',          '2021-12-28 10:33:40'),
  (14,  231.97, 'Amazon',          '2021-12-28 10:35:12'),
  (15,  -24.20, 'Google',          '2022-01-03 10:01:20'),
  (16,  -36.30, 'Amazon',          '2022-01-03 10:02:35'),
  (17, 1270.87, 'Udemy',           '2022-01-10 11:03:55'),
  (18, -540.64, 'Bank of America', '2022-01-14 17:33:01'),
  (19,  732.33, 'PayPal',          '2022-01-25 10:31:21'),
  (20, 1328.72, 'Google',          '2022-01-26 10:32:45'),
  (21,  824.71, 'Amazon',          '2022-01-27 10:33:01'),
  (22,  182.55, 'Coupang',         '2022-01-27 10:33:25'),
  (23,  -24.20, 'Google',          '2022-02-03 10:02:23'),
  (24,  -36.30, 'Amazon',          '2022-02-03 10:02:34'),
  (25,  -36.30, 'Notion',          '2022-02-03 10:04:51'),
  (26, 1549.27, 'Udemy',           '2022-02-14 11:00:01'),
  (27, -480.78, 'Bank of America', '2022-02-14 17:30:12')
;


SELECT * FROM TRANSACTIONS;

-- A. 거래 내역의 총합은?

SELECT SUM(AMOUNT)
FROM transactions;

-- B. 최대 거래 금액과 최저 거래 금액은?

SELECT MAX(AMOUNT) AS "최대 거래금액", MIN(AMOUNT) AS "최저 거래 금액"
FROM TRANSACTIONS;

-- C. “Google”과 거래한 총 횟수는?

SELECT COUNT(MSG) 
FROM TRANSACTIONS
WHERE MSG = "GOOGLE";

-- D. 거래 내역의 평균 금액은?

SELECT AVG(AMOUNT)
FROM TRANSACTIONS;

 -- E. 거래 메시지 목록을 중복되지 않게 추출하면?
 
 SELECT  DISTINCT MSG
 FROM TRANSACTIONS;
 
 -- F. 거래 내역의 입금 총액은?
 SELECT SUM(AMOUNT)
 FROM TRANSACTIONS
 WHERE AMOUNT >0;
 
 
 
 




