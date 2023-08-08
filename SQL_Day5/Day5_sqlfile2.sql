CREATE TABLE STUDENTS(
	ID INT auto_increment PRIMARY KEY,
    NICKNAME VARCHAR(30)
);

CREATE TABLE GRADES(
	ID INT auto_increment PRIMARY KEY,
    STUDENT_ID INT REFERENCES STUDENTS(ID),
    COURSE_ID INT REFERENCES COURSES(ID),
    EXAM_SCORE INT,
    GRADE VARCHAR(30) REFERENCES GRADE_POINTS(GRADE)
);

CREATE TABLE COURSES(
	ID INT auto_increment PRIMARY KEY,
    TITLE VARCHAR(30)
);

CREATE TABLE GRADE_POINTS(
	GRADE VARCHAR(30) PRIMARY KEY,
    POINT DECIMAL
);

/* 레코드 등록 */
-- 학생
INSERT INTO
  students(nickname)
VALUES
  ('홍팍'),
  ('쿠마'),
  ('호크'),
  ('젤리'),
  ('알파고'),
  ('베이글'),
  ('라이언')
;

-- 수강성적
INSERT INTO
  grades(student_id, course_id, exam_score, grade)
VALUES
  (1, 1, 90,  'A0'),
  (2, 1, 97,  'A+'),
  (3, 1, 100, 'A+'),
  (4, 1, 98,  'A+'),
  (5, 1, 64,  'D0'),
  (6, 1, 81,  'B+'),
  (7, 1, 79,  'B+'),
  (1, 2, 88,  'A0'),
  (2, 2, 99,  'A+'),
  (3, 2, 82,  'B+'),
  (4, 2, 68,  'C+'),
  (5, 2, 76,  'B0'),
  (6, 2, 63,  'C0'),
  (7, 2, 71,  'C+'),
  (1, 3, 76,  'B+'),
  (2, 3, 72,  'B+'),
  (3, 3, 79,  'B+'),
  (4, 3, 83,  'A0'),
  (5, 3, 91,  'A+'),
  (6, 3, 69,  'B0'),
  (7, 3, 84,  'A0'),
  (1, 4, 90,  'A0'),
  (2, 4, 82,  'B+'),
  (3, 4, 88,  'A0'),
  (4, 4, 99,  'A+'),
  (5, 4, 68,  'C+'),
  (6, 4, 94,  'A+'),
  (7, 4, 60,  'C0'),
  (1, 5, 66,  'B0'),
  (2, 5, 78,  'A0'),
  (3, 5, 73,  'B+'),
  (4, 5, 84,  'A+'),
  (5, 5, 76,  'A0'),
  (6, 5, 84,  'A+'),
  (7, 5, 71,  'B+'),
  (1, 6, 79,  'B+'),
  (2, 6, 89,  'A0'),
  (3, 6, 96,  'A+'),
  (4, 6, 82,  'B+'),
  (5, 6, 91,  'A0'),
  (6, 6, 100, 'A+'),
  (7, 6, 70,  'C+'),
  (1, 7, 99,  'A+'),
  (2, 7, 94,  'A0'),
  (3, 7, 60,  'C0'),
  (4, 7, 68,  'C+'),
  (5, 7, 75,  'B0'),
  (6, 7, 81,  'B0'),
  (7, 7, 89,  'B+')
;

-- 과목
INSERT INTO
  courses(title)
VALUES
  ('프로그래밍'),
  ('대학 수학'),
  ('영작문'),
  ('글쓰기'),
  ('물리와 실험'),
  ('사고와 표현'),
  ('공학 윤리')
;

-- 등급 점수
INSERT INTO
  grade_points(grade, point)
VALUES
  ('A+', 4.5),
  ('A0', 4.0),
  ('B+', 3.5),
  ('B0', 3.0),
  ('C+', 2.5),
  ('C0', 2.0),
  ('D0', 1.5),
  ('F',  0.0)
;

SELECT * FROM STUDENTS;
SELECT * FROM GRADES;
SELECT * FROM COURSES;
SELECT * FROM GRADE_POINTS;

# 1. 다음 중 올바른 것을 모두 고르시오 
-- 답
SELECT STUDENTS.NICKNAME, COURSES.TITLE, GRADES.EXAM_SCORE, GRADE_POINTS.GRADE, GRADE_POINTS.POINT
FROM STUDENTS 
JOIN GRADES ON GRADES.ID = STUDENTS.ID
JOIN COURSES ON COURSES.ID = GRADES.COURSE_ID
JOIN GRADE_POINTS ON GRADE_POINTS.GRADE = GRADES.GRADE

WHERE (NICKNAME, TITLE, EXAM_SCORE, GRADE_POINTS.GRADE, POINT) IN (

	('홍팍', '프로그래밍', 80, 'A0', 4),
    ('라이언', '프로그래밍', 79, 'B+', 4),
    ('젤리', '대학 수학', 68, 'C+', 3),
    ('알파고', '영작문', 91, 'A+', 5)

);

-- 강사님 풀이  (실행 X)

SELECT 
    students.nickname,
    courses.title,
    grades.exam_score,
    grade_points.grade,
    grade_points.point
    
FROM
    students                  
JOIN grades ON 

	grades.id = students.id

join courses on 
	courses.id = grades.course_id
    
join grade_points on 
	grade_points.grade = grades.grade
    
where (nickname,title,exam_score,grade_points.grade,point) in (
	('홍팍','프로그래밍',80,'A0',4.0),
	('라이언','프로그래밍',79,'B+',3.5),
    ('젤리','대학 수학',68,'C+',2.5),
    ('알파고','영작문',91,'A+',5.0)
);




# 2. 과목별 평균 시험점수를 다음과 같이 조회하시오. 
-- 답
SELECT TITLE AS "과목명", (SELECT AVG(EXAM_SCORE)) AS "평균 시험 점수"
FROM GRADES JOIN COURSES 
ON GRADES.COURSE_ID = COURSES.ID
GROUP BY COURSES.TITLE;

-- 강사님 풀이 

select 
	title as '과목명',
    round as '평균 시험점수'

from courses
join (
	select 
		course_id,
        round(avg(exam_score),2) as round
        
	from 
		grades 
        
	group by course_id) as avg_exam_score on
		avg_exam_score.course_id = courses.id;


# 3. 학생별 평균 학점(등급점수)을 수강성적으로부터 구하고, 해당 점수가 3.5 미만인 학생을 다음과 같이 조회하시오. 
-- 답
select 
    students.nickname as 닉네임,
    round(avg_grade,2)
from
    students
join (
    select
        student_id,
        avg(grade_points.point) as avg_grade
    from
        grades
    join grade_points on
        grades.grade = grade_points.grade
    group by
        student_id
    ) as avg_grade on
    students.id = avg_grade.student_id    
where
    avg_grade < 3.5;
    

-- 강사님 풀이
select 
	   students.nickname as "학생",
       평균학점.ROUND as "평균학점"
from 
	students
    
join (
	select 
	grades.student_id,
    round(avg(grade_points.point),2) as ROUND

from grades
JOIN grade_points ON
		grades.grade = grade_points.grade    
GROUP BY 
		grades.student_id
HAVING 
	 AVG(grade_points.point) <= 3.5
     ) as 평균학점 on
	students.id = 평균학점.student_id;  




# 4. 모든 강의별 평균 학점(등급점수)를 구하고, 이보다 후하게 준 "꿀 강의" TOP3를 조회하시오. 

SELECT 
    courses.title,
    round(AVG(grade_points.point), 2) AS ROUND
    
FROM
    courses
JOIN    grades ON 
    courses.id = grades.course_id

JOIN    grade_points ON 
	grades.grade = grade_points.grade
GROUP BY 
	courses.title
ORDER BY 
	ROUND DESC
LIMIT 
	3;









