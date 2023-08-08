-- 주석!
-- sql이란 데이터 관리용 언어!
-- DB는 데이터 저장 창고 
-- 테이블 (table) 
-- 물건을 저장하려면 적당한 박스가 필요하듯 데이터를 저장하는 틀
-- 데이터의 저장 단위 행(row), 열(column)

-- CRUD
-- 데이터 생성 (Create)
-- 데이터 조회 (Read)
-- 데이터 수정(update)
-- 데이터 삭제(delete)

-- Query : 데이터베이스에 명령한다! 
-- 키워드 table 

-- 데이터베이스 생성
  create database Members;

-- 만들어진 데이터베이스 선택
 use Members;

-- 데이터를 저장하는 테이블 생성
-- 어떤 내용을 저장할 지 써주기! 타입
-- 정수 int 문자 varchar 실수 real 
-- Date, datatime : 날짜와 시간 데이터
-- json (배열 타입의 key, value) 
create table member(
	id int,
    pw varchar(20),
    name varchar(20)
);

-- 데이터 저장(테이블에 저장)
-- insert into 테이블명 values(속성1, 속성2, 속성3)

insert into member values(1111,'1234','최정욱'); 
insert into member(id,pw,name) values(2222,'2222','하하');

-- 데이터 조회(select)
-- * 전체조회 

select * from member;


