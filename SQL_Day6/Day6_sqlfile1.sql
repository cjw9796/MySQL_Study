-- JDBC 편의점 예제 

CREATE DATABASE POS;
USE POS;


CREATE TABLE Item(
	id int NOT NULL auto_increment PRIMARY KEY,
    item_name VARCHAR(45),
    item_stock int,
    item_price int,
	UNIQUE (item_name)

);



INSERT INTO
  Item(item_name, item_stock, item_price)
VALUES
   ('새우깡', 50, 1500),
   ('오렌지주스', 60 , 1000),
  ('신라면', 70 , 890),
  ('진라면', 80 , 900),
  ('열라면', 90 , 1000),
  ('치토스', 100 , 1300),
  ('양파링', 50 , 1500),
  ('포카칩', 60 , 1700),
  ('구슬아이스크림', 70 , 3300),
  ('조스바', 80 , 1300),
  ('바닐라아이스크림', 90 , 1500),
  ('여행자종합세트',100,9500),
  ('치약',100,2500)
;

SELECT * FROM ITEM;

DESC ITEM;









