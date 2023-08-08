-- 문자열 함수 

-- 문자열 길이 
SELECT LENGTH('1234567');

-- 문자열 결합
-- 전달받은 문자열을 모두 결합하여 하나의 문자열로 반환한다. 

SELECT CONCAT('My', 'sql', 'no');
SELECT CONCAT('My', NULL, 'no');  -- 문자열에 중간에 NULL이 하나라도 존재하면 결과를 NULL 반환 


-- 문자열 반복 
SELECT REPEAT("이것이", 3);

-- 문자열 뒤집기 
SELECT reverse("MYSQL");

-- 문자열 검색 
-- 문자열이 특정 문자열에서 처음으로 나타나는 위치를 찾아서 해당 위치를 반환한다.
-- 만약 값이 없으면 0을 반환한다. 
-- 문자열 첫 인덱스가 1부터 시작 
-- 중복되는 값이 있을 때 자리수를 지정 

SELECT LOCATE('ABC', 'ABCEDDFAG');
SELECT LOCATE('ABC', 'ABCEDABCDFAG',4);

-- 문자열 추출
-- LEFT RIGHT 함수는 전달받은 문자열의 왼쪽부터 개수만큼 문자 반환하고 오른쪽부터 개수만큼 문자 반환한다. 

SELECT LEFT("MYSQL PHP HTML JAVA",10);  -- 왼쪽에서 10글자 만큼 반환 
SELECT RIGHT("MYSQL PHP HTML JAVA",10); -- 오른쪽에서 10글자 만큼 반환 

-- 문자열 추출(특정 부분을 가져오기) 
-- SUBSTRING(문자열, 시작번호, 길이)
SELECT SUBSTRING('가나바다라마사아',1,5); -- 1부터 5까지 문자열 추출 

-- 문자열 구분자로 끊어서 가져오기 
-- 문자열에 음수도 집어넣으면 오른쪽부터 거꾸로 문자열 반환 
SELECT SUBSTRING_INDEX("[WWW.GOOGLE.COM](HTTP://WWW.GOOGLE.COM)",'.',3);  -- .을 기점으로 N개 

-- 대소문자 변경

SELECT LOWER('ABCD');
SELECT UPPER('ABBcccc');

-- 문자열 대체 
-- 문자열 주고 찾을 단어 주고 변경할 단어 주고 
SELECT REPLACE('MYSQL','MY','MS');

-- 문자열 다듬기
-- 특정 문자제거를 하거나 앞이나 뒤 
-- 기본설정 : 전달받은 문자열 양 끝에 공백 제거
-- LEADING: 전달받은 문자 앞에쪽! 제거!
-- TRAILING: 전달받은 문자 뒤에쪽! 제거! 
 
SELECT TRIM('!!!!!MYSQL PHP HTML JAVA!!!!         ');
SELECT TRIM(LEADING '!' FROM '!!!!!MYSQL PHP HTML JAVA!!!!!');
SELECT TRIM(TRAILING '!' FROM '!!!!!MYSQL PHP HTML JAVA !!');

















