create database Stu;
use Stu;
-- 학생 테이블 생성
CREATE TABLE students (
  id INTEGER,                -- 학생 id
  nickname VARCHAR(50),      -- 닉네임
  math_score INTEGER,        -- 수학 성적
  english_score INTEGER,     -- 영어 성적
  programming_score INTEGER  -- 프로그래밍 성적
);
-- 학생 레코드 추가
INSERT INTO
  students(id, nickname, math_score, english_score, programming_score)
VALUES
  (1, 'Sparkles', 98, 96, 93),
  (2, 'Soldier', 82, 66, 98),
  (3, 'Lapooheart', 84, 70, 82),
  (4, 'Slick', 87, 99, 98),
  (5, 'Smile', 75, 73, 70),
  (6, 'Jellyboo', 84, 82, 70),
  (7, 'Bagel', 97, 91, 87),
  (8, 'Queen', 99, 100, 88)
;


select * from students;

/*
모든 과목 성적이 다 90점 이상인 학생 정보
75점 미만 과목이 하나라도 있는 학생 정보 
모든 학생별 정보와 성적 총점
모든 학생별 정보와 성적 평균
총점이 270이상인 학생의 닉네임, 성적, 총점 평균
*/

-- 모든 과목 성적이 다 90점 이상인 학생 정보
select * from students
where math_score >=90 and english_score >=90 and programming_score >=90;
-- 75점 미만 과목이 하나라도 있는 학생 정보 
select * from students
where  math_score <=75 or english_score <=75 or programming_score <=75;

-- 모든 학생별 정보와 성적 총점
SELECT *, (math_score+english_score+programming_score) as TotalScore from students;

-- 모든 학생별 정보와 성적 평균
SELECT *, ((math_score+english_score+programming_score)/3) AS AVGSCORE FROM STUDENTS;

-- 총점이 270이상인 학생의 닉네임, 성적, 총점 평균
SELECT NICKNAME, MATH_SCORE, ENGLISH_SCORE, PROGRAMMING_SCORE, (MATH_SCORE+ENGLISH_SCORE+PROGRAMMING_SCORE) AS TOTALSCORE ,((MATH_SCORE+ENGLISH_SCORE+PROGRAMMING_SCORE)/3) AS AVGSCORE
FROM STUDENTS
WHERE (MATH_SCORE+ENGLISH_SCORE+PROGRAMMING_SCORE) >=270;

SELECT SUM(MATH_SCORE) AS MATH_SCORE_TOTAL, SUM(ENGLISH_SCORE) AS ENGLISH_SCORE_TOTAL, SUM(PROGRAMMING_SCORE) AS PROGRAMMING_SCORE_TOTAL
FROM STUDENTS;



-- 코테 문제풀이 
SELECT BOARD_ID, WRITER_ID, TITLE, PRICE, 

CASE
WHEN (STATUS = 'SALE') THEN '판매중' 
WHEN (STATUS = 'RESERVED') THEN '예약중' 
ELSE '거래완료'
END AS STATUS

FROM USED_GOODS_BOARD

WHERE CREATED_DATE = '2022-10-05'

ORDER BY BOARD_ID DESC;




