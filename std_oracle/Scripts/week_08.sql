/*
 * 홍유라_문제08
 * 
 * 1. student_t 테이블과 score_t 을 JOIN 하여 사진과 같이
 * 	  stu_id, stu_name, class_name, score_avg, stu_gpa 를 조회하시오. [사진1]
 *    - stu_gpa 는 CASE WHEN ... THEN 문법을 사용하며
 *    	score_avg 가 100 이하, 90 이상일 경우 'A'
 * 		90 미만, 80 이상일 경우 'B'
 * 		80 미만, 70 이상일 경우 'C'
 * 		70 미만, 60 이상일 경우 'D'
 * 		60 미만일 경우 'F' 그 외는 ''로 처리한다.
 * 
 * 2. 전학생 2명이 왔다.
 * 	  student_t 테이블과 score_t 테이블에 값을 추가하시오.
 * 	  student_t - (2206, '장인서', NULL, '여', NULL), (2207, '서준영', NULL, '남', NULL)
 * 	  score_t   - 학번은 위와 동일하며 모든 시험은 아직 보지 않았다. [사진2-1] [사진2-2]
 * 
 * 3. student_t 와 score_t 테이블의 모든 행들을 조회하시오.
 *    단, class_name 을 기준으로 오름차순으로 조회되게 한다. [사진3]
 */


-- 1
SELECT stu_id
	 , stu_name
	 , class_name
	 , score_avg
	 , CASE WHEN score_avg BETWEEN 90 AND 100 THEN 'A'
	 	    WHEN score_avg BETWEEN 80 AND 89 THEN 'B'
	 	    WHEN score_avg BETWEEN 70 AND 79 THEN 'C'
	 	    WHEN score_avg BETWEEN 60 AND 69 THEN 'D'
	 	    WHEN score_avg < 60 THEN 'F'
	 	    ELSE ''
	 	    END stu_gpa
  FROM student_t
  JOIN score_t
 USING (STU_ID);

-- 2. 전학생추가
INSERT INTO student_t VALUES (2206, '장인서', NULL, '여', NULL);
INSERT INTO student_t VALUES (2207, '서준영', NULL, '남', NULL);
INSERT INTO score_t VALUES(2206, '', '', '', '', '', '');
INSERT INTO score_t VALUES(2207, '', '', '', '', '', '');

SELECT * FROM student_t;
SELECT * FROM score_t;

-- 3. 모든컬럼
SELECT * 
  FROM student_t 
  JOIN score_t     -- FULL JOIN 가능한
 USING(stu_id)
 ORDER BY class_name;


/*
 * 이보슬_문제08
 *
 * 1. '컴잘알'동아리와 '독서왕'동아리에 가입한 학생들의 학번, 이름, 나이, 전화번호, 학년, 반, 동아리명, 동아리 담당 교사 을 출력하시오. 
 *   		- INNER JOIN을 사용하여 문제를 해결하도록 한다.
 * 			- STUDENT_TB, LEVEL_TB, CLUB_TB를 사용한다.
 * 
 * 2. '컴잘알' 동아리에 가입한 학생 중 가장 나이 많은 학생의 학생명, 나이, 학년, 반, 담당 교사명 을 출력하시오.
 * 			- JOIN과 서브쿼리를 사용하여 문제를 해결하도록 한다.
 *			- 테이블 세 개를 조인한다.
 *			- 가장 나이 많은 학생을 구할 때 이중 서브쿼리가 필요하다. (만약 다른 방법을 해도 정답이 나온다면 다른 방법을 사용해도 무관)
 * 
 */



-- 1.조회
SELECT stu_id
	 , stu_name
	 , stu_age
	 , stu_phone
	 , level_no
	 , class_no
	 , club_name
	 , club_teacher
  FROM student_tb 
  JOIN level_tb
 USING(stu_id)
  JOIN club_tb
 USING(club_id);
  
SELECT * FROM STUDENT_TB;
SELECT * FROM LEVEL_TB;
SELECT * FROM CLUB_TB;
-- 2. 
SELECT stu_name
 	 , stu_age
 	 , level_no
 	 , class_no
 	 , stu_teacher
  FROM (student_tb s)
  JOIN level_tb l
 USING(stu_id)
  JOIN club_tb c
 USING(club_id)
 WHERE (stu_age, club_id ) IN (SELECT MAX(stu_age), CLUB_ID 
  								 FROM STUDENT_TB
							 GROUP BY club_id
 							   HAVING club_id IN (SELECT club_id 
 							  						FROM club_tb
 							  					   WHERE club_name = '컴잘알'));

-- WHERE STU_AGE IN (SELECT MAX(STU_AGE) FROM STUDENT_TB) 
--   AND CLUB_NAME = '컴잘알' 							  					  
 							  					  
 							  					  
SELECT MAX(stu_age), CLUB_ID 
  FROM STUDENT_TB
 GROUP BY club_id
 HAVING club_id IN (SELECT club_id FROM club_tb WHERE club_name = '컴잘알');

SELECT * FROM STUDENT_TB;

SELECT stu_name
 	 , stu_age
 	 , level_no
 	 , class_no
 	 , stu_teacher
  FROM (student_tb s)
  JOIN level_tb l
 USING(stu_id)
  JOIN club_tb c
 USING(club_id)
 WHERE c.club_name = '컴잘알'
   AND (sstu_age) IN (SELECT max(stu_age)
  					    FROM STUDENT_TB 
  					   GROUP BY stu_age);




/*
 * <김규연>
 * 1. 두 개의 테이블을 생성하세요
 * 		(1) 기사정보(pastry_chef_tb) 테이블을 생성하고 각 컬럼명, 자료형, 제약조건, 제약조건명을 부여하세요.
 * 			 - 제품번호(bread_id, 숫자)
 * 			 - 빵담당기사(pc_name, VARCHAR2(20), NOT NULL)
 * 			 - 담당기사 주소(pc_address, VARCHAR2(50))
 * 			 - 담당기사 전화번호(pc_phone, VARCHAR2(20), CHECK('010'을 포함하고 있는지 확인))
 *  		 - 담당기사 고용일(pc_hiredate, DATE, 기본값(오늘날짜))
 * 			 - 회사 이름(pc_company, VARCHAR2(20), NOT NULL)
 * 			 - 외래키를 이용하여 company_tb의 company_name을 참조할 수 있도록 하세요.
 * 			 - 외래키를 이용하여 bread_tb의 bread_id를 참조할 수 있도록 하세요.
 * 
 * 		(2) 회사 정보(company_tb) 테이블을 생성하고 각 컬럼명, 자료형, 제약조건, 제약조건명을 부여하세요.
 * 			 - 회사이름(company_name, VARCHAR2(20), 기본키)
 * 			 - 회사 주소(company_address, VARCHAR2(50), UNIQUE)
 * 			 - 회사 전화번호(company_phone, VARCHAR2(20), UNIQUE)
 * 
 * 2. 다음의 값들을 추가하세요.
 * 		(1) company_tb 애 다음 값들을 추가하세요.
 * 			 - (  뚜레쥬르,  부산시 연제구, 051-439-1532)
 * 			 - (파리바게트,   서울시 강남구, 02-568-8756)
 *			 - (   성심당, 대구광역시 남구, 053-854-4594)
 * 			 - (  자연드림,  제주시 구좌읍, 064-359-2588)
 * 		(2) pastry_chef_tb 에 다음 값들을 추가하세요.
 * 			 - (1, 김담이, 경기도 안산시 단원구, 010-5466-8892, 20120506, 뚜레쥬르);
 *			 - (2, 송강호,   대구광역시 달서구, 010-4372-8577, 19950102, 파리바게트);
 *			 - (3, 최우식, 경기도 안산시 단원구, 010-7534-3257, 19941125, 파리바게트);
 *			 - (3, 신민아,  서울특별시 동대문구, 010-5534-5687, 19941125, 뚜레쥬르);
 *			 - (5, 조정석,   대구광역시 수성구, 010-6379-9656, 20190718, 성심당);
 * 			 - (6, 유연석, 부산광역시 해운대구,  010-1256-3658,  20210607, 자연드림);
 *			 - (7, 유연석,    충청남도 천안시,             '', 20220309, 자연드림);
 *
 * 3. JOIN을 이용하여 다음 조건에 맞춰서 조회하세요.
 * 		- bread_tb 와 pastry_chef_tb 와 company_tb 테이블을 서로 조인하세요.
 * 		- 다음의 컬럼들이 조회되게 하고 각각의 컬럼에 별칭을 부여해주세요.
 * 				제품번호 -> 현재 년도 + bread_id
 * 				빵이름 -> bread_name
 * 				빵담당기사 -> pc_name
 * 				담당기사 주소 -> pc_address
 * 				담당기사 전화번호 -> pc_phone(해당 값이 NULL 이면 010-0000-0000 이 출력되도록 하세요)
 * 				담당기사 고용일 -> pc_hiredate
 * 				회사 이름 -> company_name
 * 				회사 주소 -> company_address
 * 				회사 전화번호 -> company_phone
 * 		- 담당기사 고용일이 2000년도 이상인 것들만 조회되도록 하세요.
 */

-- 1. 테이블생성
CREATE TABLE pastry_chef_tb(
	   bread_id 	 NUMBER
	 , pc_name 		 VARCHAR2(20) 	 CONSTRAINTS NN_PASTRY_CHEF_TB_PC_NAME NOT NULL
	 , pc_address	 VARCHAR2(50)	
	 , pc_phone		 VARCHAR2(20)	 CONSTRAINTS CK_PASTRY_CHEF_TB_PC_PHONE CHECK(pc_phone LIKE '010%')
	 , pc_hiredate	 DATE
	 , pc_company	 VARCHAR2(20)	 CONSTRAINTS NN_PASTRY_CHEF_TB_PC_COMPANY NOT NULL
	 , CONSTRAINTS FK_PASTRY_CHEF_TB_BREAD_ID FOREIGN KEY(bread_id) REFERENCES bread_tb(bread_id)
	 , CONSTRAINTS FK_PASTRY_CHEF_TB_COMAPNY_TB FOREIGN KEY(pc_company) REFERENCES company_tb(company_name)
);
DROP TABLE PASTRY_CHEF_TB;

CREATE TABLE company_tb(
	   company_name		VARCHAR2(20) CONSTRAINTS PK_COMPANY_TB_COMPANY_NAME    PRIMARY KEY
	 , company_address  VARCHAR2(50) CONSTRAINTS UK_COMPANY_TB_COMPANY_ADDRESS UNIQUE
	 , company_phone	VARCHAR2(20) CONSTRAINTS UK_COMPANY_TB_COMPANY_PHONE   UNIQUE
);

-- 2.INSERT
INSERT INTO company_tb VALUES (   '뚜레쥬르',   '부산시 연제구', '051-439-1532');
INSERT INTO company_tb VALUES ( '파리바게트',   '서울시 강남구', '02-568-8756');
INSERT INTO company_tb VALUES (     '성심당', '대구광역시 남구', '053-854-4594');
INSERT INTO company_tb VALUES (   '자연드림',   '제주시 구좌읍', '064-359-2588');

INSERT INTO pastry_chef_tb VALUES (1, '김담이', '경기도 안산시 단원구', '010-5466-8892', '20120506', '뚜레쥬르');
INSERT INTO pastry_chef_tb VALUES (2, '송강호', '   대구광역시 달서구', '010-4372-8577', '19950102', '파리바게트');
INSERT INTO pastry_chef_tb VALUES (3, '최우식', '경기도 안산시 단원구', '010-7534-3257', '19941125', '파리바게트');
INSERT INTO pastry_chef_tb VALUES (4, '신민아',  '서울특별시 동대문구', '010-5534-5687', '19941125', '뚜레쥬르');
INSERT INTO pastry_chef_tb VALUES (5, '조정석',    '대구광역시 수성구', '010-6379-9656', '20190718', '성심당');
INSERT INTO pastry_chef_tb VALUES (6, '유연석',  '부산광역시 해운대구', '010-1256-3658', '20210607', '자연드림');
INSERT INTO pastry_chef_tb VALUES (7, '유연석',      '충청남도 천안시',              '', '20220309', '자연드림');

-- 3. JOIN
SELECT EXTRACT(YEAR FROM SYSDATE) || bread_id 제품번호
	 , bread_name 빵이름
	 , pc_name 빵담당기사
	 , pc_address "담당기사 주소"
	 , NVL(pc_phone,'010-0000-0000') "담당기사 전화번호"
	 , pc_hiredate "담당기사 고용일"
	 , company_name "회사 이름"
	 , company_address "회사 주소"
	 , company_phone "회사 전화번호"
  FROM bread_tb b
  JOIN pastry_chef_tb p
 USING(bread_id)   
  JOIN company_tb c
    ON (p.pc_company = c.company_name)
 WHERE EXTRACT(YEAR FROM p.pc_hiredate) >= 2000;


SELECT * FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'PASTRY_CHEF_TB'; -- 컬럼확인
SELECT * FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'COMPANY_TB'; 	-- 컬럼확인
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'PASTRY_CHEF_TB'; -- 제약조건확인
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'COMPANY_TB';		-- 제약조건확인
SELECT * FROM PASTRY_CHEF_TB ;
SELECT * FROM COMPANY_TB;


/*
 * 김재은_문제08
 * 
 * 1. emp_mart_tb에 hire_date 컬럼을 추가하시오. (자료형 date)
 * 2. 각 매니저별로 입사일을 추가하시오.
 *   (김봉지 => 2021-10-10), (최박스 => 2020-04-30), (다니엘소스 => 2022-02-13)
 *   (오젤리 => 2022-04-13), (이민트 => 2020-12-20), (윤아리 => 2019-09-29)
 * 3. 각 테이블에 값을 추가하시오.
 * 	  - mart_tb 에 ('손소독제', 4000, '배스앤바디웍', '바디용품', 'O', 3231, 7)
 *    - emp_mart_tb ('한세정', 4300, 7, '2018-07-05')
 * 4. JOIN을 이용하여 emp_mart_tb의 name과 hire_date, mart_tb의 kind을 출력하시오.
 *    이때, 조건을 emp_mart_tb의 manage_sort와 mart_tb의 sort가 같은값으로 찾을 수 있도록 지정하시오.
 *    - hire_date는 00년 00월 00일 형식으로 출력되게 하시오.
 * 	  - 각 별칭은 사진을 참조하시오.
 * 5. 테이블명 변경에 따라 제약조건명을 변경해준다.
 *    - mart_tb에서 (CK_MART_T_POSSIBLE => CK_MART_TB_POSSIBLE), (PK_MART_T_SORT => PK_MART_TB_SORT)
 * 	  - emp_mart_tb에서 (FK_EMP_MART_T_MANAGE_SORT => FK_EMP_MART_TB_MANAGE_SORT)
 */
SELECT * FROM emp_mart_tb;
SELECT * FROM mart_tb;
-- 1. 컬럼 추가
ALTER TABLE emp_mart_tb ADD hire_date DATE;
-- 2. 입사일 추가
UPDATE emp_mart_tb SET hire_date = '2021-10-10' WHERE NAME = '김봉지';
UPDATE emp_mart_tb SET hire_date = '2020-04-30' WHERE NAME = '최박스';
UPDATE emp_mart_tb SET hire_date = '2022-02-13' WHERE NAME = '다니엘소스';
UPDATE emp_mart_tb SET hire_date = '2022-04-13' WHERE NAME = '오젤리';
UPDATE emp_mart_tb SET hire_date = '2020-12-20' WHERE NAME = '이민트';
UPDATE emp_mart_tb SET hire_date = '2019-09-29' WHERE NAME = '윤아리';

-- 3. 값 추가
INSERT INTO mart_tb VALUES ('손소독제', 4000, '배스앤바디웍', '바디용품', 'O', 3231, 7);
INSERT INTO emp_mart_tb VALUES ('한세정', 4300, 7, '2018-07-05');

-- 4. 출력하기
SELECT e.name 매니저이름
     , m.KIND 담당상품
     , TO_CHAR(e.hire_date, 'YY"년" MM"월" DD"일"') 고용일
  FROM emp_mart_tb e
  JOIN mart_tb m 
    ON e.MANAGE_SORT = m.SORT;

-- 5. 제약조건명 변경
ALTER TABLE mart_tb RENAME CONSTRAINTS CK_MART_T_POSSIBLE TO CK_MART_TB_POSSIBLE;
ALTER TABLE mart_tb RENAME CONSTRAINTS PK_MART_T_SORT TO PK_MART_TB_SORT;
ALTER TABLE emp_mart_tb RENAME CONSTRAINTS FK_EMP_MART_T_MANAGE_SORT TO FK_EMP_MART_TB_MANAGE_SORT;


SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'MART_TB';
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'EMP_MART_TB';


