-- 햄버거에 대한 정보를 저장하는 데이터베이스를 생성
-- 데이터베이스 명 : burgers
-- 테이블명 : burger
-- 저장해야 되는 내용들 id, name, price, kcal 
-- 타입: id int, name varchar(저장공간크기), price int, kcal int

-- 데이터베이스 생성 
  create database burgers; 
-- 데이터베이스 사용
 use burgers;

-- 데이블 생성(create)
create table burger(
id int,
name varchar(30),
price int, 
kcal int 
);

-- -- 데이터 삽입(insert)
 insert into burger values(1, "상하이스파이시버거",4000,700);  

 insert into burger values
(2,"트리플 치즈 버거",6000,1050),
(3,"빅맥",5800,1150),
(4,"행운버거",6800,1250);
select * from burger; 


-- 데이터 조회(select)
-- 전체조회
--  select * from burger;

-- 일부만 조회
-- select id from burger;
-- select name from burger; 

-- 테이블 전체 구조를 확인 
-- desc burger;

-- update 수정
set sql_safe_updates = 0;
update burger set price = 1500;
update burger set name = '상하이버거' where id=2;
select * from burger;

-- 삭제 
-- drop table burger;

select * from burger order by id asc;






