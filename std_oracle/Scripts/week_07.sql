/*
 * 홍유라_문제07
 * 
 * 1. score_t 테이블에 데이터를 추가하시오.
 *   - 학번: 2201, 수학:  70, 영어:  85, 국어: 95, 자바: 90, 과목점수합계: NULL, 과목점수평균: NULL
 *   - 학번: 2202, 수학: 100, 영어:  95, 국어: 95, 자바: 90, 과목점수합계: NULL, 과목점수평균: NULL
 *   - 학번: 2203, 수학:  64, 영어:  70, 국어: 76, 자바: 80, 과목점수합계: NULL, 과목점수평균: NULL
 *   - 학번: 2204, 수학:  97, 영어:  81, 국어: 72, 자바: 88, 과목점수합계: NULL, 과목점수평균: NULL
 *   - 학번: 2205, 수학:  88, 영어: 100, 국어: 82, 자바: 74, 과목점수합계: NULL, 과목점수평균: NULL
 * 
 * 2. UPDATE 문을 사용하여 과목점수 합계를 score_total 에 넣으시오.
 * 
 * 3. UPDATE 문을 사용하여 과목점수 평균값을 score_avg 에 넣으시오.
 *
 * 4. 서브쿼리를 사용하여 score_t 테이블에서 score_avg 컬럼값을 기준으로 학생들의 등수를 조회하시오.
 * 	 - '순위', '학번', '과목점수평균' 만 조회되도록 한다.
 * 	 - 예외적으로 동일한 점수가 있을 시, 순위는 끊이지 않고 순차적으로 이어지게 한다.   
 *   - 사진과 같이 과목점수평균을 기준으로 내림차순 정렬한다.
 */
SELECT * FROM SCORE_T;

-- 1. score_t에 값추가
INSERT INTO score_t VALUES (2201,  70,  85, 95, 90, NULL, NULL);
INSERT INTO score_t VALUES (2202, 100,  95, 95, 90, NULL, NULL);
INSERT INTO score_t VALUES (2203,  64,  70, 76, 80, NULL, NULL);
INSERT INTO score_t VALUES (2204,  97,  81, 72, 88, NULL, NULL);
INSERT INTO score_t VALUES (2205,  88, 100, 82, 74, NULL, NULL);

-- 2. update 사용 합계
UPDATE score_t
   SET score_total = math + eng + kor + java
 WHERE STU_ID IN (2201, 2202, 2203, 2204, 2205); -- WHERE 안써도 됨

-- 3. update사용 평균
UPDATE score_t
   SET score_avg = (SCORE_TOTAL/4)
 WHERE STU_ID IN (2201, 2202, 2203, 2204, 2205); -- WHERE 안써도 됨

-- 4. 서브쿼리
SELECT 순위
     , stu_id
     , score_avg
  FROM (SELECT stu_id
  			 , score_avg
  			 , DENSE_RANK() OVER(ORDER BY score_avg DESC) AS 순위
          FROM score_t);


/*
 * 이보슬_문제07
 * 
 * 1. STUDENT_TB에서 주소가 '서울시'이면서 핸드폰 번호에 5가 한 번도 들어가지 않은 학생 조회하시오. [사진1]
 *	- 다중행-다중열을 이용하여 조회하시오.
 *	- 조회 결과에 핸드폰 뒤에 4자리는 '****'로 출력되도록 하시오. 
 *	  단, 별칭은 STU_PHONE 으로 한다.
 *	
 * 2. LEVEL_TB 테이블에 stu_teacher 컬럼을 추가하시오.
 *		- 자료형 : VARCHAR2(20) 
 * 3. stu_teacher 컬럼에 값을 아래와 같이 추가하시오. [사진2] 
 *			1학년 1반 담임 : 송중기
 *			1학년 2반 담임 : 박보영
 *			1학년 3반 담임 : 남주혁
 *			2학년 1반 담임 : 김우빈
 *			2학년 2반 담임 : 이광수
 *			2학년 3반 담임 : 송지효
 *			3학년 1반 담임 : 서인국
 *			3학년 2반 담임 : 김수현
 *			3학년 3반 담임 : 한지민
 *
 * 4. 담당선생님이 '송중기'인 학생들의 stu_id, stu_name, stu_age를 출력하시오. [사진4]
 * 	 	- 서브쿼리를 이용하시오.
 */

SELECT STU_ID
	 , STU_NAME 
	 , STU_AGE 
	 , RPAD(SUBSTR(STU_PHONE, 1, 9), 13, '*')
	 , STU_ADDRESS 
	 , CLUB_ID 
FROM STUDENT_TB 
 WHERE STU_ID IN (SELECT STU_ID
					   FROM STUDENT_TB
					   WHERE STU_PHONE NOT LIKE '%5%'
					     AND SUBSTR(STU_ADDRESS, 1, 3)='서울시');
					  
-- 2. 컬럼추가
ALTER TABLE LEVEL_TB ADD stu_teacher VARCHAR2(20);					   

SELECT * FROM level_tb;
-- 3. UPDATE
UPDATE level_tb SET stu_teacher = '송중기' WHERE LEVEL_NO = 1 AND CLASS_NO = 1;
UPDATE level_tb SET stu_teacher = '박보영' WHERE LEVEL_NO = 1 AND CLASS_NO = 2;
UPDATE level_tb SET stu_teacher = '남주혁' WHERE LEVEL_NO = 1 AND CLASS_NO = 3;
UPDATE level_tb SET stu_teacher = '김우빈' WHERE LEVEL_NO = 2 AND CLASS_NO = 1;
UPDATE level_tb SET stu_teacher = '이광수' WHERE LEVEL_NO = 2 AND CLASS_NO = 2;
UPDATE level_tb SET stu_teacher = '송지효' WHERE LEVEL_NO = 2 AND CLASS_NO = 3;
UPDATE level_tb SET stu_teacher = '서인국' WHERE LEVEL_NO = 3 AND CLASS_NO = 1;
UPDATE level_tb SET stu_teacher = '김수현' WHERE LEVEL_NO = 3 AND CLASS_NO = 2;
UPDATE level_tb SET stu_teacher = '한지민' WHERE LEVEL_NO = 3 AND CLASS_NO = 3;

/*
 * UPDATE LEVEL_TB
   SET stu_teacher = (CASE WHEN LEVEL_NO = 1 AND CLASS_NO = 1 THEN '송중기'
					       WHEN LEVEL_NO = 1 AND CLASS_NO = 2 THEN '박보영'
				      	   WHEN LEVEL_NO = 1 AND CLASS_NO = 3 THEN '남주혁'
					       WHEN LEVEL_NO = 2 AND CLASS_NO = 1 THEN '김우빈'
					       WHEN LEVEL_NO = 2 AND CLASS_NO = 2 THEN '이광수'
					       WHEN LEVEL_NO = 2 AND CLASS_NO = 3 THEN '송지효'
					       WHEN LEVEL_NO = 3 AND CLASS_NO = 1 THEN '서인국'
					       WHEN LEVEL_NO = 3 AND CLASS_NO = 2 THEN '김수현'
					       WHEN LEVEL_NO = 3 AND CLASS_NO = 3 THEN '한지민'
					       END);
 */
SELECT * FROM LEVEL_TB ;
SELECT * FROM STUDENT_TB;
-- 4. 서브쿼리 활용하여 출력하기

SELECT stu_id
     , stu_name
     , stu_age
  FROM student_tb 
 WHERE stu_id IN (SELECT STU_ID
 					FROM LEVEL_TB 
 				   WHERE STU_TEACHER = '송중기');
 				  
SELECT * FROM LEVEL_TB;				  
 				  
/*
 * <김규연>
 * bread_t 와 date_manager_t 테이블의 이름을 bread_tb 와 date_manager_tb 로 바꾸세요.
 *
 * 서브쿼리를 이용하여 다음 문제를 푸세요.
 * 		2. JOBS 테이블에서 JOB_ID 가 SA_인 것들의 MAX_SALAY를 조회하고
 * 		   EMPLOYEES의 SALARY가 조회한 SALARY 이상인 것이 조회되도록 하세요.
 * 		   	  - 조회 결과는 EMPLOYEE_ID, NAME(FIRST_NAME과 LAST_NMAE 합치기), JOB_ID, SALARY가 출력되도록 하세요.
 * 				  - 다중행 비교연산자 활용하세요.
 * 		
 * 		3. bread_t 테이블에서 빵가격이 높은 순서대로 순위를 매겨 출력되도록 하세요.
 * 				  - 조회결과는 순위, bread_name, bread_total, bread_type, bread_price이 출력되도록 하세요.
 * 				  - 순위는 중복이 되든 안되든 등수가 1씩 증가되도록 하세요.
 * 				  - 순위가 1 ~ 5 위까지만 출력되도록 하세요.
 */ 				  
-- 1. 테이블명 변경 				  
ALTER TABLE bread_t RENAME TO bread_tb;				  
ALTER TABLE date_manager_t RENAME TO date_manager_tb;

SELECT * FROM JOBS;
SELECT * FROM EMPLOYEES;
-- 2. 서브쿼리로 조회하기
SELECT EMPLOYEE_ID
     , FIRST_NAME || '' || LAST_NAME NAME
     , JOB_ID
     , SALARY
  FROM EMPLOYEES
 WHERE SALARY >=ANY (SELECT MAX_SALARY
							FROM JOBS
				 			  WHERE JOB_ID LIKE 'SA_%');
-- >= ANY 값들 중 최소값보다 크거나 같은 결과
				 	

-- 3.순위 매기기
SELECT * FROM bread_tb;

SELECT 순위
	 , bread_name
	 , bread_total
	 , bread_type
	 , bread_price
 FROM (SELECT bread_name
 			, bread_total
 			, bread_type
 			, bread_price
            , DENSE_RANK() OVER(ORDER BY bread_price DESC) AS 순위
         FROM bread_tb)
 WHERE 순위 <= 5;


/*
 * 김재은_문제07
 * 
 * 1. ref_mart_t의 테이블명을 ref_mart_tb로 변경하시오.
 *    MART_T의 테이블명을 mart_tb로 변경하시오.
 *    EMP_MART_T의 테이블명을 emp_mart_tb로 변경하시오.
 * 2. FK_MART_T_BARCODE 제약조건을 제거하시오.
 *    PK_REF_MART_T_R_BAR 제약조건을 제거하시오.
 *    ref_mart_tb 테이블을 제거하시오.
 * 3. emp_mart_tb의 name의 자료형을 가변길이 20자로 변경하시오.
 * 
 * 4. mart_tb에 값을 추가시오.
 *    ('2080', 3000, '애경', '치약' ,'O', 2080, 5)
 *    ('계란30구', 6000, '농협', '알류', 'O', 9090, 6)
 * 5. emp_mart_tb에 값을 추가하시오. 
 *    ('김봉지', 3000, 1), ('최박스', 3200, 2), ('다니엘소스', 3200, 3),
 *    ('오젤리', 2900, 4), ('이민트', 4000, 5), ('윤아리', 3400 , 6)
 * 6. 서브쿼리를 이용하여 mart_tb에서 kind의 값이 '젤리'이거나 '과자'가 들어가는 물품을 찾아 
 *    emp_mart_t 를 조회하시오. 
 *    (sort와 manage_sort를 이용하세요)
 */
--> fk를 고려하여 ref_mart_tb테이블을 제거하시오.

-- 1. 테이블명 변경
ALTER TABLE REF_MART_T RENAME TO ref_mart_tb;
ALTER TABLE MART_T RENAME TO mart_tb;
ALTER TABLE EMP_MART_T RENAME TO emp_mart_tb;

-- 2. 제약조건 & 테이블 제거
ALTER TABLE mart_tb DROP CONSTRAINT FK_MART_T_BARCODE;
ALTER TABLE ref_mart_tb DROP CONSTRAINT PK_REF_MART_T_R_BAR;
DROP TABLE ref_mart_tb;

-- 3. 자료형 변경
ALTER TABLE emp_mart_tb MODIFY name VARCHAR2(20); -- 10 -> 20으로 변경


-- 4. mart_tb에 값추가
INSERT INTO mart_tb VALUES (  '2080', 3000, '애경', '치약', 'O', 2080, 5);
INSERT INTO mart_tb VALUES ('계란30구', 6000, '농협', '알류', 'O', 9090, 6);

--5. emp_mart_tb에 값추가
INSERT INTO emp_mart_tb VALUES (   '김봉지', 3000, 1);
INSERT INTO emp_mart_tb VALUES (   '최박스', 3200, 2);
INSERT INTO emp_mart_tb VALUES ('다니엘소스', 3200, 3);
INSERT INTO emp_mart_tb VALUES (   '오젤리', 2900, 4);
INSERT INTO emp_mart_tb VALUES (   '이민트', 4000, 5);
INSERT INTO emp_mart_tb VALUES (   '윤아리', 3400, 6);

-- 6. 과자랑 젤리가 아닌 애를 출력
SELECT *
  FROM emp_mart_tb
 WHERE MANAGE_SORT IN (SELECT SORT
						  FROM mart_tb
 						 WHERE kind LIKE '%과자%' OR kind='젤리');
 						
 						
-- 테스트용 						
SELECT SORT
  FROM mart_tb
 WHERE kind LIKE '%과자%' OR kind='젤리';
  

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'MART_TB';
SELECT * FROM mart_tb;
SELECT * FROM emp_mart_tb;
