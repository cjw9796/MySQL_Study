-- 데이터베이스명 book_store 

create database book_store;

use book_store;

-- 책 정보 저장하는 테이블명 : book
create table book(
bookname varchar(30),
price int,
publishing varchar(30),
totalpage int,
author varchar(20),
publicationDate varchar(20)
);


-- 교보문고에서 책 5개 저장
insert into book values("세이노의 가르침", 6400, "데이원", 360, "세이노", "2023.03.02");
insert into book values("최애의아이", 5400, "대원씨아이", 300, "aka", "2023.05.30");
insert into book values
("사장학개론", 22500, "스노우폭스북스", 1250, "김승호", "2023.04.19"),
("모든 삶은 흐른다", 15120, "피카", 840, "로랑스드빌레르", "2023.04.03"),
("모성", 15120, "피드리드출판", 840, "미나토가나에", "2023.06.15"); 


-- 1. 테이블 구조 확인
desc book;
-- 2. 2번째로 저장되는 책의 가격을 만원으로 변경
update book set price= 10000 where bookname = "최애의아이";
-- 3. 3번째로 삭제
delete from book where price=22500;
-- 4. 전체 조회하기 
select * from book;
-- 5. 일부 책의 이름만 가져오기
select bookname from book where bookname="모성";

-- 필터링 연산자 사용하기 
-- 비교연산자 >= , 

select * from book where price >=10000;
select * from book where totalpage >= 500;

-- 각 도서의 가격을 10% 인상한 금액을 출력
select bookname, price, price + price*0.1 from book;

select 20 + 20;
select 20 - 20;

select * from book; 

# 비교연산자 
-- > (보다 큼)
-- < (보다 작음)
-- >= (크거나 같음)
-- <= (작거나 같음)
-- <> (다르다)

-- 출판사 이름이 데이원 이면서 저자가 세이노인 정보를 가져오기 
select * from book where publishing="데이원" and author="세이노";

-- 출판사 명이 대원씨아이 또는 가격이 10000 이상인 도서 조회
select * from book where publishing="대원씨아이" or price >=10000;

-- 출판사 피카 이면서 페이지 수가 600 이상인 책의 이름만 가져오기 
select bookname from book where publishing="피카" and totalpage >=600;

select * from book;

