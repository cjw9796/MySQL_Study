CREATE DATABASE INSTAGRAM;
SET SQL_SAFE_UPDATES = 0;
USE INSTAGRAM;

-- DROP TABLE LIKES;
-- DROP TABLE COMMENTS;
-- DROP TABLE PHOTOS;
-- DROP TABLE USERS;

--  JOIN 
--  여러 테이블에서 가져온 레코드를 조합하여 하나의 테이블로 결과를 집합 
-- INNER JOIN, LEFT OUTER JOIN, RIGHT OUTER JOIN, FULL OUTER JOIN 
-- JOIN 하는 테이블의 ON 절의 조건이 일치하는 결과만 출력 
-- 조인 시 조건이 맞지 않으면, NULL 값이 있을 경우는 데이터를 가져오지 않는다. 

-- 테이블 생성 
-- USERS 테이블 
CREATE TABLE users (
  id       int AUTO_INCREMENT PRIMARY KEY,
  nickname VARCHAR(50),
  email    VARCHAR(100)
);
-- photos 테이블
CREATE TABLE photos (
  id       int AUTO_INCREMENT PRIMARY KEY,
  filename VARCHAR(255),
  user_id  INTEGER       REFERENCES users(id)
);
-- comments 테이블
CREATE TABLE comments (
  id       int AUTO_INCREMENT PRIMARY KEY,
  body     VARCHAR(1000),
  user_id  INTEGER        REFERENCES users(id),
  photo_id INTEGER        REFERENCES photos(id)
);
-- settings 테이블
CREATE TABLE settings (
  id           int AUTO_INCREMENT PRIMARY KEY,
  private       BOOLEAN,
  adding_photos VARCHAR(15),
  user_id       INTEGER      UNIQUE REFERENCES users(id)
);
-- likes 테이블 생성(사용자와 사진을 다대다 연결)
CREATE TABLE likes (
  id       int AUTO_INCREMENT PRIMARY KEY,
  user_id  INTEGER REFERENCES users(id),
  photo_id INTEGER REFERENCES photos(id)
);

-- users 레코드
INSERT INTO
  users(nickname, email)
VALUES
  ('cloudstudying_kr', 'mail@cloudstudying.kr'),
  ('hongpark_cs',      'sehongpark@cloudstudying.kr'),
  ('haesamq',          'haesamq@naver.com')
;
-- photos 레코드
INSERT INTO
  photos(filename, user_id)
VALUES
  ('cat-on-road.jpg',           1),
  ('sunset-over-the-ocean.jpg', 1),
  ('andromeda-galaxy.jpg',      1),
  ('white-tiger.jpg',           2),
  ('nero-the-black-cat.jpg',    2),
  ('deleted-image.jpg',         NULL),
  ('blocked-image.jpg',         NULL)
;
-- comments 레코드
INSERT INTO
  comments(body, user_id, photo_id)
VALUES
  ('meow',             1, 1),
  ('nyaong',           2, 1),
  ('냐옹',              3, 1),
  ('sunset',           1, 2),
  ('falling slowly',   2, 2),
  ('Andromeda galaxy', 1, 3),
  ('mysteriouse..!',   3, 3),
  ('wow..!',           3, NULL),
  ('oh..!',            3, NULL)
;
-- settings 레코드
INSERT INTO
  settings(private, adding_photos, user_id)
VALUES
  (FALSE, 'MANUAL', 1),
  (FALSE, 'AUTO',   2),
  (TRUE,  'AUTO',   3)
;
-- likes 레코드
INSERT INTO
  likes(user_id, photo_id)
VALUES
  (1,    1),
  (2,    1),
  (1,    2),
  (2,    2),
  (3,    2),
  (1,    3),
  (3,    3),
  (NULL, 6),
  (NULL, 7)
;




SELECT * FROM PHOTOS;
SELECT * FROM COMMENTS;
SELECT * FROM USERS;
SELECT * FROM SETTINGS;
SELECT * FROM LIKES;

-- 사진 1번째 달린 모든 댓글 내용과 작성자 닉네임을 조회하시오! 

SELECT COMMENTS.BODY, USERS.NICKNAME 	-- 4. 원하는 정보를 SELECT 출력  
FROM COMMENTS  -- 1. 댓글 포함 테이블 가져오기 
JOIN USERS  	-- 2. 연결할 테이블 
ON USERS.ID = COMMENTS.USER_ID 
WHERE COMMENTS.PHOTO_ID =1;  -- 3. 연결한 테이블에서 조건

-- 사진 5번의 파일명과 사진 게시자 닉네임을 조회하시오 
-- 1. 테이블 가져오기 FROM
-- 2. JOIN 연결할 테이블
-- 3. ON 조건에 맞는 테이블 선택
 -- 4. 원하는 정보를 SELECT 출력  
SELECT PHOTOS.FILENAME, USERS.NICKNAME
FROM PHOTOS
JOIN USERS ON USERS.ID = PHOTOS.USER_ID
WHERE PHOTOS.ID =5; 

-- 사진 2번의 좋아요를 누른 사용자 닉네임과 대상 사진의 파일명 

SELECT USERS.NICKNAME, PHOTOS.FILENAME 
FROM LIKES
INNER JOIN USERS ON USERS.ID = LIKES.USER_ID 
INNER JOIN PHOTOS ON PHOTOS.ID = LIKES.PHOTO_ID
WHERE PHOTOS.ID =2;

USE db2_book_store;

SELECT * FROM CART;
SELECT * FROM BOOK;
SELECT * FROM MEMBER;

# 문제1) cart테이블에서 buyer의 이름과 cart의 가격 가져오기

SELECT CART.BUYER, CART.BUY_PRICE 
FROM CART
INNER JOIN MEMBER ON CART.CART_NO = MEMBER.MEMBER_NO; 

# 문제2) cart테이블에서 회원이 구매한 도서의 할인되기 전의 가격과 할인율 가져오기

SELECT CART.BUY_PRICE, BOOK.book_discount_rate
FROM CART
INNER JOIN BOOK ON CART.BOOK_NO = BOOK.BOOK_NO; 

# 문제) cart테이블에서 회원이 구매한 도서의 할인되기 전의 가격이 2만원 이상인 도서정보와 할인율 가져오기

SELECT CART.book_TITLE, BOOK.book_discount_rate
FROM CART 
INNER JOIN BOOK ON CART.BOOK_NO= BOOK.BOOK_NO
WHERE BOOK_PRICE >= 20000;







