USE INSTAGRAM;

# LEFT OUTER JOIN 
-- 왼쪽 테이블 데이터의 모든 레코드와 오른쪽 테이블 데이터의 일치하는 레코드를 반환
-- 조인 순서에 따라서 조회되는 행과 구성등이 달라질 수 있다. 
-- 첫번째 테이블로 SELECT 문에 가장 많은 열을 가져와야 할 테이블을 우선적으로 적어준다. 
-- 조인을 할 때 데이터가 없으면 NULL 채운다. 

# RIGTH OUTER JOIN 
-- 오른쪽 테이블 데이터의 모든 레코드와 왼쪽 테이블 데이터의 일치하는 레코드를 반환



# 3중 조인 
-- 원하는 정보가 테이블 3개로 흩어져 있을 때 OUTER JOIN을 연속으로 3번 사용하는 것도 좋다. 
-- 모든 사진의 "파일명"을 조회, 게시자 "닉네임"은 옵션

SELECT PHOTOS.FILENAME, USERS.NICKNAME
FROM PHOTOS
LEFT OUTER JOIN USERS ON USERS.ID = PHOTOS.USER_ID;

-- 모든 댓글의 "내용"을 조회, 댓글이 달린 사진 "파일명"은 옵션 

SELECT COMMENTS.BODY, PHOTOS.FILENAME
FROM COMMENTS
LEFT OUTER JOIN  PHOTOS ON 
PHOTOS.ID = COMMENTS.PHOTO_ID;








