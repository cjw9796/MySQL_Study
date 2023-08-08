-- DB생성 
CREATE DATABASE BOOKSTORE;  

-- DB 사용 
USE BOOKSTORE;
-- ----------------------------------------------------------------
-- BOOK 테이블 생성
CREATE TABLE BOOK(
BOOKID INT,
BOOKNAME varchar(30),
PUBLISHER varchar(30),
PRICE INT
);

SELECT * FROM BOOK;
DESC BOOK;

-- BOOK 테이블 값 입력
INSERT INTO BOOK values
(1,"축구의 역사", "굿스포츠",7000),
(2,"축구 아는 여자","나무수",13000),
(3,"축구의 이해", "대한미디어",22000),
(4,"골프 바이블", "대한미디어",35000),
(5,"피겨 교본", "굿스포츠", 8000),
(6,"역도 단계별 기술", "굿스포츠", 6000),
(7,"야구의 추억","이상미디어",20000),
(8,"야구를 부탁해","이상미디어",13000),
(9,"올림픽 이야기", "삼성당",7500),
(10,"Olympic Champions", "Pearson",13000);

-- 조회 
SELECT * FROM BOOK;
-- ----------------------------------------------------------------
-- CUSTOMER 테이블 생성 
CREATE TABLE CUSTOMER(
CUSTID INT,
NAME VARCHAR(30),
ADDRESS VARCHAR(30),
PHONE VARCHAR(20)
);

DESC CUSTOMER;

-- CUSTOMER 테이블 값 입력 
INSERT INTO CUSTOMER values
(1,"박지성","영국 맨체스터", "000-5000-0001"),
(2,"김연아","대한민국 서울", "000-6000-0001"),
(3,"장미란","대한민국 강원도", "000-7000-0001"),
(4,"추신수","미국 클리블랜드", "000-8000-0001"),
(5,"박세리","대한민국 대전", "NULL");

-- 조회
SELECT * FROM CUSTOMER;
-- ----------------------------------------------------------------
-- ORDERS 테이블 생성 
CREATE TABLE ORDERS(
ORDERID INT, 
CUSTID INT,
BOOKID INT, 
SALEPRICE INT,
ORDERDATE DATETIME

);

-- ORDERS 테이블 값 입력 
INSERT INTO ORDERS values
(1,1,1,6000,'2020-07-01'),
(2,1,3,21000,'2020-07-03'),
(3,2,5,8000,'2020-07-03'),
(4,3,6,6000,'2020-07-04'),
(5,4,7,20000,'2020-07-05'),
(6,1,2,12000,'2020-07-07'),
(7,4,8,13000,'2020-07-07'),
(8,3,10,12000,'2020-07-08'),
(9,2,10,7000,'2020-07-09'),
(10,3,8,13000,'2020-07-10');

-- 조회
SELECT * FROM ORDERS;




-- ----------------------------------------------------------------
/*
SQL 기능에 따른 분류 

1. 데이터 정의어 (DDL)
테이블이나 관계의 구조를 생성하는데 사용 
CREATE, ALTER, DROP, TRUNCATE 



2. 데이터 조작어 (DML)
테이블에 데이터를 검색하고 삽입, 수정, 삭제하는데 사용
SELECT, INSERT, UPDATE, DELETE



3. 데이터 제어어(DCL)
데이터의 사용 권한을 관리하는데 사용 
GRANT, REVOKE

SELECT : 질의 결과 추출되는 속성 리스트를 열거한다. 
FROM : 질의에 어느 테이블이 사용되는지 열거한다.
WHERE : 질의의 조건을 작성한다.
*/ 

-- 김연아 고객의 전화번호를 찾으시오  

SELECT PHONE FROM CUSTOMER
WHERE NAME = "김연아";

-- 출판사 명을 가지고 오는데 중복되는 이름 제거하고 출력 
SELECT DISTINCT PUBLISHER FROM BOOK  ;

-- 가격이 10000원 이상 20000이하 도서를 검색하시오
-- BETWEEN A AND B 
SELECT * FROM BOOK 
WHERE PRICE between 10000 AND 20000;
 
 -- 출판사가 '굿스포츠' 혹은 '대한미디어'인 도서를 검색하시오! 
 SELECT * FROM BOOK 
 WHERE PUBLISHER IN('굿스포츠','대한미디어');
 
 -- 출판사가 '굿스포츠' 혹은 '대한미디어'가 아닌 도서를 검색하시오! 
 SELECT * FROM BOOK 
 WHERE PUBLISHER NOT IN ('굿스포츠','대한미디어');
 
 -- 도서이름에 축구가 포함된 책이름, 출판사를 검색하시오!
 
 SELECT BOOKNAME, PUBLISHER FROM BOOK 
 WHERE BOOKNAME LIKE "%축구%";
 
 
 /*
 정렬
 ORDER BY
 SELECT * FROM BOOK 
 ORDER BY BOOKNAME; 
 
 DESC 내림차순
 ASC 오름차순 
 */ 
 
  SELECT * FROM BOOK 
 ORDER BY BOOKNAME ;
 
 
 -- 도서를 가격순으로 검색하고 가격이 같으면 이름순으로 검색하시오! 
 SELECT * FROM BOOK 
 ORDER BY PRICE, BOOKNAME;
 
 -- 도서를 가격의 내림차순 검색하시오 
 -- 만약 가격이 같다면 출판사의 오름차순으로 검색하시오! 
 SELECT * FROM BOOK
 ORDER BY PRICE DESC, PUBLISHER ASC;
 
 
 /* 집계함수 */
 
 -- BOOK 테이블의 도서의 총 금액을 구하시오 !
 
 SELECT SUM(PRICE) AS TOTAL_PRICE 
 FROM BOOK;
 
 
 -- PRICE 가격 기준으로 최대 가격, 최소 가격을 구하시오 
 
 SELECT * FROM BOOK;
 
 SELECT 
 MIN(PRICE) AS MIN_PRICE, 
 MAX(PRICE) AS MAX_PRICE , 
 ROUND(AVG(PRICE),2) AS AVG_PRICE   -- ROUNT(값, 자리수) 괄호안에 실수를 넣으면 소수점 반올림해서 표현 
 FROM BOOK;
 
 
 /* 
 날짜와 시간에 관한 정보 저장하기
SELECT NOW() -> 현재 날짜와 시간을 반환
 
  YYYY-MM--DD--HH:MM:SS 형태로 반환한다.
  
  CURDATE() 날짜만 반환한다.
  SELECT CURDATE();
  
  CURTIME() 현재 시간만 반환한다.
  SELECT CURTIME();
  
  DATE() 
  전달받은 값에 해당하는 날짜 정보를 반환한다. 
  
  MONTH()
  전달받은 값에서 월에 해당하는 값만 반환한다. 
  0~12의 값을 가진다 
  
  DAY()
  전달 받은 값에서 일자에 해당하는 값만 반환한다. 
  0~31의 값을 가진다.
  
  HOUR()
  전달 받은 값에서 시간에 해당하는 값만 반환한다.
  0~23 사이의 값을 가진다. 
  
  MINUTE()
  분 만 반환한다. 
  0~59 사이 값을 가진다.
  
  SECOND() 
  초 만 반환한다. 
  0~59 사이 값을 가진다. 
  
 */ 
 
 SELECT 
 DATE('2016-02-19 12:34:56'),
 MONTH('2016-02-19 12:34:56'),
 DAY('2016-02-19 12:34:56'),
 HOUR('2016-02-19 12:34:56'),
 MINUTE('2016-02-19 12:34:56'),
 SECOND('2016-02-19 12:34:56'),
 MONTHNAME('2016-02-19 12:34:56'),
 DAYNAME('2016-02-19 12:34:56');
 
 -- 연도별, 월별, 주별 일수
 # dayofweek : 해당 주에서 몇번째 날인지 반환한다.
 -- 일요일 = 1, 토요일 = 7
 # dayofmonth : 해당 월에서 몇 번째 날인지를 반환한다. 
 -- 0~31
 # dayofyear : 해당 연도에서 몇 번째 날인지 반환
 # 1~366 사이의 값을 반환
 
 SELECT 
 dayofweek("2021-05-23"), 
 dayofmonth("2021-05-23"),
 dayofyear("2021-05-23");
 
 # 날짜를 이용해서 테이블 생성 
 
 CREATE TABLE ORDERS3(
	ORDERID INT, 
    CUSTID INT, 
    BOOKID INT, 
    SALEPRICE INT, 
    ORDERDATE DATE
 );
 
INSERT INTO ORDERS3 VALUES(1,1,1,6000,'2020-07-01');
INSERT INTO Orders3 VALUES (2, 1, 3, 21000, '2020-07-03');
INSERT INTO Orders3 VALUES (3, 2, 5, 8000, '2020-07-03');
INSERT INTO Orders3 VALUES (4, 3, 6, 6000,'2020-07-04');
INSERT INTO Orders3 VALUES (5, 4, 7, 20000, '2020-07-05');
INSERT INTO Orders3 VALUES (6, 1, 2, 12000, '2020-07-07');
INSERT INTO Orders3 VALUES (7, 4, 8, 13000,'2020-07-07');
INSERT INTO Orders3 VALUES (8, 3, 10, 12000, '2020-07-08');
INSERT INTO Orders3 VALUES (9, 2, 10, 7000, '2020-07-09');
INSERT INTO Orders3 VALUES (10, 3, 8, 13000, '2020-07-10');
 SELECT * FROM ORDERS3;
 
-- ORDERS3 테이블에서 총 매출을 구하시오! 
SELECT SUM(SALEPRICE) AS TOTAL_SALEPRICE
FROM ORDERS3;

-- ORDER3 테이블에서 2번 김연아 고객이 주문한 도서의 총 판매액을 구하시오 
SELECT SUM(SALEPRICE) AS TOTAL_SALEPRICE
FROM ORDERS3
WHERE CUSTID = 2;

-- COUNT()
-- 서점의 도서 판매 건수를 구하시오 
SELECT COUNT(*)
FROM ORDERS3;
  
 -- 고객별로 주문한 도서의 총 수량과 총 판매액을 구하시오! 
 -- GROUP BY : 그룹을 지어줄 필드명! 
 SELECT CUSTID, COUNT(*) AS "도서수량", SUM(SALEPRICE) AS "총액"
 FROM ORDERS3 
 GROUP BY CUSTID;
 
 
 -- 예제 풀이 ----------------------------------------------------
 SELECT * FROM BOOK;
 SELECT * FROM CUSTOMER;
 SELECT * FROM ORDERS;
 
 # (1) 도서번호가 1인 도서의 이름
 
SELECT BOOKNAME
FROM BOOK 
WHERE BOOKID = 1;
 
 # (2)가격이 20,000원 이상인 도서의 이름 
 SELECT BOOKNAME
 FROM BOOK 
 WHERE PRICE >= 20000;
 
 # (3)박지성의 총 구매액(박지성의 고객번호는 1번으로 놓고 작성)
 SELECT SUM(SALEPRICE) AS "박지성의 총 구매액"
 FROM ORDERS
 WHERE CUSTID= 1;
 
 # (4)박지성이 구매한 도서의 수(박지성의 고객번호는 1번으로 놓고 작성) 
 SELECT COUNT(*)
 FROM ORDERS 
 WHERE CUSTID = 1;
 
/*
서점의 운영자와 경영자가 요구하는 다음 질문에 대해 SQL 문을 작성하시오.
(1) 마당서점 도서의 총 개수
(2) 마당서점에 도서를 출고하는 출판사의 총 개수
(3) 모든 고객의 이름, 주소
(4) 2014년 7월 4일~7월 7일 사이에 주문 받은 도서의 주문번호
(5) 2014년 7월 4일~7월 7일 사이에 주문 받은 도서를 제외한 도서의 주문번호
(6) 성이 ‘김’ 씨인 고객의 이름과 주소
(7) 성이 ‘김’ 씨이고 이름이 ‘아’로 끝나는 고객의 이름과 주소
*/


#(1) 마당서점 도서의 총 개수
 SELECT COUNT(BOOKID)
 FROM BOOK;

 #(2)마당서점에 도서를 출고하는 출판사의 총 개수
 
 SELECT DISTINCT COUNT(PUBLISHER)
 FROM BOOK; 
 
 SELECT * FROM BOOK;
 
# (3) 모든 고객의 이름, 주소
SELECT NAME, ADDRESS 
FROM CUSTOMER;

# (4) 2020년 7월 4일~7월 7일 사이에 주문 받은 도서의 주문번호
 SELECT ORDERID 
 FROM ORDERS 
 WHERE ORDERDATE BETWEEN '2020-07-04' AND '2020-07-07';
 
 # (5) 2014년 7월 4일~7월 7일 사이에 주문 받은 도서를 제외한 도서의 주문번호
 SELECT ORDERID, ORDERDATE 
 FROM ORDERS 
-- WHERE ORDERDATE NOT IN ('2020-07-04','2020-07-07');
 WHERE ORDERDATE NOT BETWEEN '2020-07-04' AND '2020-07-07';
 
 # (6) 성이 ‘김’ 씨인 고객의 이름과 주소
 SELECT NAME, ADDRESS 
 FROM CUSTOMER
 WHERE NAME LIKE'김%';

 # (7) 성이 ‘김’ 씨이고 이름이 ‘아’로 끝나는 고객의 이름과 주소
 
 SELECT NAME, ADDRESS
 FROM CUSTOMER
 WHERE NAME LIKE '김%' AND NAME LIKE '__아';
 
 -- --------------------------------------------------
 /*두 개 이상 테이블에서 조건 없이 연결해서 
 원하는 데이터 가져오기 */
 
 SELECT * 
 FROM CUSTOMER, ORDERS3;
 
 ## 고객과 고객의 주문에 관한 데이터를 모두 구하시오
 
 SELECT * 
 FROM CUSTOMER, ORDERS3
 WHERE CUSTOMER.CUSTID = ORDERS3.CUSTID;
 
 # 위에 있는 내용을 정렬하기 
 
 SELECT * 
 FROM CUSTOMER, ORDERS3
 WHERE CUSTOMER.CUSTID = ORDERS3.CUSTID
 ORDER BY CUSTOMER.CUSTID;
 
 # 고객별로 주문한 모든 도서의 총 판매액을 구하고 고객별로 정렬하시오 

 SELECT NAME, SUM(SALEPRICE) AS "총 판매액" 
 FROM CUSTOMER, ORDERS3
 WHERE CUSTOMER.CUSTID = ORDERS3.CUSTID
 GROUP BY NAME
 ORDER BY SUM(SALEPRICE) DESC;

 
 select name, sum(saleprice) as "도서판매액"
from customer, orders
where customer.custid = orders.custid
group by name
order by customer.name;
 