CREATE DATABASE INSTAGRAM;
USE INSTAGRAM;

-- 이메일 저장, 닉네임, ID 
CREATE TABLE USERS(
	
    ID INT auto_increment PRIMARY KEY,  -- PK선언, AUTO_INCREMENT: 자동채우기  
    EMAIL VARCHAR(100),
    NICKNAME VARCHAR(50)

);


INSERT INTO USERS(EMAIL,NICKNAME)
VALUES
('EMPRESS8069@GMAIL.COM','하이네쓔'),
('CLINIHI@NAVER.COM','클리니'),
('FOFO@GMAIL.COM','뽀로로');

SELECT * FROM USERS;


CREATE TABLE PHOTOS(
	ID INT auto_increment PRIMARY KEY,
    FILENAME VARCHAR(255),
    -- USER에 대한 정보도 같이 작성(외래키 설정)
    USER_ID INT REFERENCES USERS(ID) -- FK: 사진 게시자의 PK로 연결  -- 필드명 타입작성 REFERENCES 연결할테이블명 
    -- FOREIGN KEY(USER_ID) REFERENCES USERS(ID)
    
);



INSERT INTO PHOTOS(FILENAME, USER_ID)
VALUES
('CAT.PNG',1),
('DOG.PNG',1),
('CAT2.PNG',1),
('CAT3.PNG',2),
('DOG3.PNG',2),
('CAT5.PNG',3);

SELECT * FROM PHOTOS;

-- 게시글 좋아요! 
CREATE TABLE COMMENTS(
	ID INT auto_increment PRIMARY KEY,
    BODY VARCHAR(1000),
    USER_ID INT REFERENCES USERS(ID),
    PHOTO_ID INT REFERENCES PHOTOS(ID)
);

INSERT INTO COMMENTS(BODY,USER_ID,PHOTO_ID)
VALUES 
-- 1번 사진의 댓글들
('야옹',1,1),
('NYAONG',2,1),
('뭐지?',3,1),
-- 2번 사진의 댓글들
('SUNSET',1,2),
('뭐지 왜이래!',3,2),
-- 3번 사진의 댓글들
('덥다',1,3);

SELECT * FROM COMMENTS;


-- SELECT USER_ID
-- FROM COMMENTS
-- WHERE 

SELECT * FROM COMMENTS;
SELECT * FROM PHOTOS;
SELECT * FROM USERS;



SELECT PHOTO_ID, NICKNAME
FROM USERS, PHOTOS, COMMENTS
WHERE PHOTO_ID = '3';

SELECT USER_ID, BODY
FROM COMMENTS;

SELECT COUNT(ID) FROM PHOTOS
GROUP BY USER_ID;







