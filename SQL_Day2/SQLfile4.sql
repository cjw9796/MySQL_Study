-- 제약조건 
-- 데이터베이스 끼리 관계성 주기 위해 KEY를 설정
/*
가장 기본키 혹은 대표키(PRIMARY KEY)
EX) 주민등록증 주민번호
설정할 때 중복이 되면 안된다 유니크(UNIQUE)
저장할 때 값이 비어있으면 안된다. (NOT NULL)

외래키(FOREGIN KEY) 테이블끼리 연결해서 사용하는 내용 

*/

CREATE database TEST2;
USE TEST2;
-- auto_increment 자동으로 값을 증가시킨다. 

CREATE TABLE TEST(
ID INT PRIMARY KEY,    
PW INT NOT NULL
);

INSERT INTO TEST VALUES(111,111);
SELECT * FROM TEST;

CREATE TABLE TEST2(
ID1 INT NOT NULL auto_increment  PRIMARY KEY,    
PW INT NOT NULL
);


INSERT INTO TEST2 VALUES(NULL,'아아');
SELECT * FROM TEST2;