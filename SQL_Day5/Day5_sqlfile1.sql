

# 서브쿼리 
-- 쿼리 속에 다른 쿼리 
-- 서브쿼리는 먼저 수행된 쿼리 결과를 가지고 다시 쿼리를 수행 할 때 사용한다. 

# 서브쿼리 실행 순서
-- 서브쿼리 실행 -> 메인(부모) 쿼리 실행 

# 서브쿼리를 작성할 때 () 
# 서브쿼리 (= 자식쿼리, 내부쿼리) - 메인 쿼리 컬럼 사용가능
# 메인쿼리(= 부모쿼리, 외부쿼리) - 서브쿼리 컬럼 사용 불가능 



#SELECT 절 서브쿼리 (스칼라 서브쿼리 - 하나의 컬럼처럼 사용, 표현용도) 
#FROM절 서브쿼리 (인라인 뷰 - 하나의 테이블 처럼 사용)
#WHERE절 서브쿼리 (Nested subquery -하나의 변수(상수처럼) 사용) 


CREATE DATABASE subQuerytest;

USE subQuerytest;

CREATE TABLE employee (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(64),
  salary INT,
  office_worker VARCHAR(64)
);



INSERT INTO employee VALUES(1,'허사장',20000000,'사장');

INSERT INTO employee (name,salary,office_worker) VALUES('유부장',10000000,'부장');
INSERT INTO employee (name,salary,office_worker) VALUES('박차장',5000000,'차장');
INSERT INTO employee (name,salary,office_worker) VALUES('정과장',4000000,'과장');
INSERT INTO employee (name,salary,office_worker) VALUES('정대리',3895000,'대리');
INSERT INTO employee (name,salary,office_worker) VALUES('노사원',2500000,'사원');
INSERT INTO employee (name,salary,office_worker) VALUES('하사원',2000000,'사원');
INSERT INTO employee (name,salary,office_worker) VALUES('길인턴',1000000,'인턴');

select * from employee;


# WHERE 절에서 서브쿼리를 사용할 때 
# 단일행 
# 다중행 
-- 단일행 서브쿼리 
# 정대리라는 사람의 직급을 구하시오!
SELECT OFFICE_WORKER
FROM EMPLOYEE
WHERE OFFICE_WORKER = (
	SELECT OFFICE_WORKER
    FROM EMPLOYEE
    WHERE NAME = "정대리"
);


-- 다중행 서브쿼리 
-- 서브쿼리에서 반환되는 결과가 하나 이상인 경우. 다중행 서브쿼리는 반드시 다중행 연산자와 함께 사용해야 한다.
# IN 서브쿼리의 결과에 존재하는 임의의 값과 동일한 조건을 의미한다. 
# ALL 서브쿼리의 결과에 존재하는 모든 값을 만족한다. 
# ANY 서브쿼리의 결과에 존재하는 어느 하나라도 만족하는 조건을 의미한다. 

# 정대리 보다 급여가 높은 사람들을 구하시오.
SELECT *
FROM EMPLOYEE
WHERE SALARY > (
	SELECT SALARY
    FROM EMPLOYEE
    WHERE NAME = "정대리"
);

# 직급이 사원인 사람들을 모두 구하시오! 
SELECT * FROM EMPLOYEE
WHERE OFFICE_WORKER IN (
	SELECT OFFICE_WORKER
    FROM EMPLOYEE
	WHERE OFFICE_WORKER = '사원'
);


#FROM절 서브쿼리 (인라인 뷰 - 하나의 테이블 처럼 사용)
# 키워드 AS 파생테이블에는 별칭을 정해줘야 된다. (MySQL)
# FROM 절에서 서브쿼리를 사용할 때 

# 직급이 사원인 사람들의 이름과 급여를 구하시오! 
SELECT EX1.NAME, EX1.SALARY
FROM 
(SELECT * FROM EMPLOYEE AS LI WHERE LI.OFFICE_WORKER ='사원') AS EX1;



# 스칼라 서브쿼리(Scalar subquery)

# 정대리 급여와 테이블 전체 평균 급여를 구하시오! 

SELECT NAME, SALARY,
(SELECT ROUND(AVG(SALARY),-1) 
FROM EMPLOYEE) AS '평균 급여'
FROM EMPLOYEE
WHERE NAME = '정대리';

# 테이블 2 생성 
create table table2(
	id int ,
    pw int
);

create table table1(
	id int auto_increment primary key,
    pw int
);


# INSERT INTO 문에도 서브쿼리 

INSERT INTO TABLE1(PW) VALUES(1111);
INSERT INTO TABLE2(PW) VALUES(2222);

# 테이블2의 정보를 뽑아서 그 데이터를 테이블1에 넣어준다.
INSERT INTO TABLE1(SELECT * FROM TABLE2);

SELECT * FROM TABLE1; 


# 서브쿼리 문제풀이 
# 테이블 생성 

CREATE TABLE ORDERS(
	ID INT auto_increment PRIMARY KEY,
    STATUS VARCHAR(30),
    CREATED_AT TIMESTAMP
);

CREATE TABLE ORDER_DETAILS(
	ID INT auto_increment PRIMARY KEY,
    ORDER_ID INT REFERENCES ORDERS(ID), -- FK  
    BEVERAGE_ID INT REFERENCES BEVERAGES(ID), -- FK 
    COUNT INT   
);

CREATE TABLE BEVERAGES(
	ID INT auto_increment PRIMARY KEY,
    NAME VARCHAR(30),
    PRICE INT,
    BTYPE VARCHAR(30)
);


-- 주문(orders)
INSERT INTO ORDERS(STATUS, CREATED_AT)
VALUES
  ('DELIVERED', '2022-02-26 8:32:13'),
  ('CANCELLED', '2022-02-26 8:35:27'),
  ('DELIVERED', '2022-02-26 8:44:53'),
  ('DELIVERED', '2022-02-26 9:05:12'),
  ('DELIVERED', '2022-02-26 9:11:35'),
  ('DELIVERED', '2022-02-26 9:14:18'),
  ('DELIVERED', '2022-02-26 9:34:20'),
  ('DELIVERED', '2022-02-26 9:44:27'),
  ('DELIVERED', '2022-02-26 9:48:25'),
  ('DELIVERED', '2022-02-26 11:14:52'),
  ('CANCELLED', '2022-02-26 11:32:13'),
  ('DELIVERED', '2022-02-26 11:55:40'),
  ('DELIVERED', '2022-02-26 12:15:01'),
  ('DELIVERED', '2022-02-26 12:21:52'),
  ('CANCELLED', '2022-02-26 12:29:17')
;
-- 음료(beverages)
INSERT INTO
  beverages(name, price, btype)
VALUES
  ('아메리카노',   4500, 'COFFEE'),
  ('라떼',        5000, 'COFFEE'),
  ('카푸치노',     5000, 'COFFEE'),
  ('카페모카',     5500, 'COFFEE'),
  ('콜드브루',     5200, 'COFFEE'),
  ('레몬 에이드',  3800, 'AID'),
  ('자몽 에이드',  4800, 'AID'),
  ('바닐라 쉐이크', 5800, 'SHAKE')
;
-- 주문내역(order_details)
INSERT INTO
  order_details(order_id, beverage_id, count)
VALUES
  (1,  1, 1),
  (2,  1, 2),
  (2,  2, 3),
  (2,  8, 2),
  (3,  1, 2),
  (4,  8, 1),
  (5,  4, 1),
  (6,  5, 3),
  (7,  1, 3),
  (7,  2, 2),
  (8,  1, 1),
  (9,  5, 1),
  (10, 1, 4),
  (11, 2, 1),
  (12, 3, 1),
  (13, 1, 6),
  (14, 1, 8),
  (14, 2, 2),
  (14, 6, 1),
  (15, 1, 4)
;

SELECT * FROM ORDERS;
SELECT * FROM ORDER_DETAILS;
SELECT * FROM BEVERAGES;

#1. 음료(beverages)의 이름 및 가격과 함께, 가장 비싼 음료와의 가격 차이를 조사하려 한다.
#주어진 두 쿼리를 조합하여 이를 구하시오. (SELECT 절 서브쿼리를 사용할 것)

SELECT NAME, PRICE, PRICE - (SELECT MAX(PRICE) FROM BEVERAGES) AS '최대 가격 차이'
FROM BEVERAGES;

#2. 주문내역(order_details)로부터 주문 별 음료 개수의 평균을 조회하려 한다.
#주어진 쿼리를 조합하여 이를 구하시오. (FROM 절 서브쿼리를 사용할 것)

SELECT AVG(SCOUNT) 
FROM( 
SELECT SUM(COUNT) AS SCOUNT
FROM ORDER_DETAILS AS OD
GROUP BY ORDER_ID
) AS OD1;

-- SELECT COUNT(BEVERAGE_ID)  -- EX1.AVG(COUNT(BEVERAGE_ID))
-- FROM ORDER_DETAILS (
-- 	SELECT COUNT(BEVERAGE_ID) 
--     FROM ORDER_DETAILS
--     GROUP BY ORDER_ID
-- ) AS EX1;

-- SELECT COUNT(BEVERAGE_ID) FROM ORDER_DETAILS;


#3. 주문내역(order_details)로부터 음료 별 주문 개수를 조회하려 한다. 
# 주어진 두 쿼리를 조합하여 이를 구하시오. (JOIN 절 서브쿼리를 활용할 것)
# IFNULL(NULL, 0)

SELECT NAME, IFNULL(TOTAL_AMOUNT,0)                                           
FROM BEVERAGES LEFT OUTER JOIN (
	SELECT BEVERAGE_ID, SUM(COUNT) AS TOTAL_AMOUNT
    FROM ORDER_DETAILS
    GROUP BY BEVERAGE_ID
) AS B_COUNTS ON B_COUNTS.BEVERAGE_ID = BEVERAGES.ID;



#4. 평균 가격보다 비싼 음료(beverages)를 다음과 같이 조회하려 한다.
#주어진 두 쿼리를 조합하여 이를 구하시오. (WHERE 절 서브쿼리를 사용할 것)

SELECT ID, NAME, PRICE
FROM BEVERAGES 
WHERE PRICE > (
SELECT AVG(PRICE) FROM BEVERAGES 
);



















