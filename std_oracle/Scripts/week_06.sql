/*
 * 홍유라_문제06
 * 
 * 1. student_t 테이블에 컬럼 2개를 추가하시오.
 * 	 - 컬럼명: stu_gender, 자료형: VARCHAR2(1 CHAR),제약조건:'남', '여' 중에 CHECK
 *     제약조건명: CK_STUDENT_T_STU_GENDER , 컬럼주석: '성별'
 *   - 컬럼명: stu_gpa, 자료형: VARCHAR2(3), 컬럼주석: '등급'
 * 
 * 2. score_t 테이블에 컬럼 2개를 추가하시오.
 *   - 컬럼명: score_total, 자료형: NUMBER DEFAULT(0), 컬럼주석: '과목점수합계'
 *   - 컬럼명: score_avg, 자료형: NUMBER DEFAULT(0), 컬럼주석: '과목점수평균'
 * 
 * 3. INSERT INTO ... VALUES 구문을 사용하여 student_t 테이블에 데이터를 추가한다.
 *   - 학번: 2201, 학생명:'김서준', 학급(반): 'C-01', 성별: '남', 등급: ''
 *   - 학번: 2202, 학생명:'송하은', 학급(반): 'C-02', 성별: '여', 등급: ''
 *   - 학번: 2203, 학생명:'이예린', 학급(반): 'C-01', 성별: '여', 등급: ''
 *   - 학번: 2204, 학생명:'박주원', 학급(반): 'C-01', 성별: '남', 등급: ''
 *   - 학번: 2205, 학생명:'최민지', 학급(반): 'C-02', 성별: '여', 등급: ''
 * 	
 * 
 * 4. 테이블의 모든 행 데이터를 한 번에 삭제하기 위한 명령어는 무엇인지 답하시오.
 * 	  또한, 해당 명령어를 실행 후 데이터를 복구할 수 있는가? 이유까지 함께 설명하시오.
 * 	  (주석으로 답을 작성하도록 한다.)
 */
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'STUDENT_T';
SELECT * FROM USER_COL_COMMENTS WHERE TABLE_NAME = 'STUDENT_T';
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'SCORE_T';
SELECT * FROM USER_COL_COMMENTS WHERE TABLE_NAME = 'SCORE_T';
SELECT * FROM STUDENT_T;
-- 1. 컬럼추가
ALTER TABLE STUDENT_T ADD stu_gender VARCHAR2(1 CHAR) CHECK (stu_gender IN('남', '여'));
ALTER TABLE STUDENT_T RENAME CONSTRAINT SYS_C0011631 TO CK_STUDENT_T_STU_GENDER;
COMMENT ON COLUMN STUDENT_T.STU_GENDER IS '성별';
ALTER TABLE STUDENT_T ADD stu_gpa VARCHAR2(3);
COMMENT ON COLUMN STUDENT_T.STU_GPA IS'등급';

-- 2. 컬럼추가
ALTER TABLE SCORE_T ADD score_total NUMBER DEFAULT(0);
COMMENT ON COLUMN SCORE_T.SCORE_TOTAL IS '과목점수합계';
ALTER TABLE SCORE_T ADD score_avg NUMBER DEFAULT(0);
COMMENT ON COLUMN SCORE_T.SCORE_AVG IS '과목점수평균';

-- 3. 데이터 추가
INSERT INTO STUDENT_T VALUES (2201, '김서준', 'C-01', '남', '');
INSERT INTO STUDENT_T VALUES (2202, '송하은', 'C-02', '여', '');
INSERT INTO STUDENT_T VALUES (2203, '이예린', 'C-01', '여', '');
INSERT INTO STUDENT_T VALUES (2204, '박주원', 'C-01', '남', '');
INSERT INTO STUDENT_T VALUES (2205, '최민지', 'C-02', '여', '');

-- 4. 삭제
-- TRUNCATE를 사용해서 삭제한다.
-- TRUNCATE는 테이블을 초기상태로 돌려놓기 때문에 ROLLBACK이 불가능하다.

/* 이보슬_문제06
 * 
 * <테이블 삭제>
 * 1. STUDENT, STUDENT_LEVEL, STUDENT_CLUB 테이블을 삭제하시오.
 * 
 * 
 * <테이블 생성>
 * "모든 제약조건명은 테이블명과 컬럼명 조합해서 짓는다."
 * 1. level_tb(학년) 테이블을 생성하시오. 
 * 		- stu_id(학번) 	  -> 자료형 : NUMBER			     제약조건 -> PRIMARY KEY
 * 		- level_no(학년)	-> 자료형 : NUMBER 			   DEFAULT(1)
 * 		- class_no(반)	  -> 자료형 : NUMBER
 * 
 * 2. club_tb 테이블을 생성하시오.
 * 		- club_id(동아리id)		  -> 자료형 : NUMBER 		    제약조건 -> PRIMARY KEY
 * 		- club_name(동아리명) 		-> 자료형 : VARCHAR2(30)	  제약조건 -> UNIQUE
 * 		- club_president(회장)	-> 자료형 : VARCHAR2(10)
 * 		- club_total(총인원)		  -> 자료형 : NUMBER
 * 		- club_teacher(담당선생님)	-> 자료형 : VARCHAR2(10)
 * 		
 * 
 * 3. student_tb 테이블을 생성하시오.
 * 	    - stu_id(학번) 			-> 자료형 : NUMBER  		     제약조건 -> PRIMARY KEY
 * 		- stu_name(학생명)		  -> 자료형 : VARCHAR2(10)	
 * 		- stu_age(나이)			  -> 자료형 : NUMBER				   제약조건 -> CHECK : 값이 17,18,19 중 하나인지 확인
 * 		- stu_phone(전화번호)	-> 자료형 : VARCHAR2(20)	
 * 		- stu_address(주소)		-> 자료형 : VARCHAR2(50)
 * 		- club_id(동아리id)		-> 자료형 : NUMBER				   제약조건 -> FOREIGN KEY : club_tb 테이블의 club_id를 참조
 * 
 * <값 추가>

 * 1. level_tb 테이블 (사진1-1)
 * 		- 학번 : 202201, 학년 : 1, 반 : 1
 * 		- 학번 : 202202, 학년 : 2, 반 : 2
 * 		- 학번 : 202203, 학년 : 3, 반 : 2
 * 		- 학번 : 202204, 학년 : 1, 반 : 2
 *		- 학번 : 202205, 학년 : 3, 반 : 3 
 * 		- 학번 : 202206, 학년 : 1, 반 : 1
 * 
 * 2. club_tb 테이블 (사진1-2)
 * 		- 동아리id : 1, 동아리명 : '컴잘알', 회장 : '김태리', 총인원 : 3명, 한예슬
 * 		- 동아리id : 2, 동아리명 : '독서왕', 회장 : '박보검', 총인원 : 2명, 공유
 * 
 * 3. student_tb 테이블 (사진1-3)
 * 		- 학번 : 202201, 학생명 : 김태리, 나이 : 17, 전화번호 : 010-1234-5678, 주소 : 서울시 강남구, 동아리id : 1
 * 		- 학번 : 202202, 학생명 : 강동원, 나이 : 18, 전화번호 : 010-1212-1212, 주소 : 서울시 마포구, 동아리id : 1
 * 		- 학번 : 202203, 학생명 : 수지 , 나이 : 19, 전화번호 : 010-0909-0110, 주소 : 서울시 영등포구, 동아리id : 2
 * 		- 학번 : 202204, 학생명 : 박보검, 나이 : 17, 전화번호 : 010-3040-5060, 주소 : 서울시 마포구, 동아리id : 2
 * 		- 학번 : 202205, 학생명 : 송강, 	 나이 : 19, 전화번호 : 010-9112-2323, 주소 : 경기도 하남시, 동아리id : 1
 * 		- 학번 : 202206, 학생명 : 한소희, 나이 : 17, 전화번호 : 010-6233-6970, 주소 : 경기도 구리시
 * 
 */



-- 1. 테이블 삭제
DROP TABLE STUDENT;
DROP TABLE STUDENT_LEVEL;
DROP TABLE STUDENT_CLUB;

-- 1. 테이블 생성
CREATE TABLE level_tb (
	   stu_id      NUMBER	 CONSTRAINT PK_LEVEL_TB_SUT_ID PRIMARY KEY
	 , level_no    NUMBER	 DEFAULT(1) 
	 , class_no	   NUMBER
);

CREATE TABLE club_tb (
       club_id         NUMBER	     CONSTRAINT PK_CLUB_TB_CLUB_ID PRIMARY KEY
     , club_name       VARCHAR2(30)  CONSTRAINT UQ_CLUB_TB_CLUB_NAME UNIQUE
     , club_president  VARCHAR2(10)  
     , club_total	   NUMBER
     , club_teacuer    VARCHAR2(10)
);

CREATE TABLE student_tb (
       stu_id          NUMBER		CONSTRAINT PK_STUDENT_TB_STU_ID PRIMARY KEY
     , stu_name		   VARCHAR2(10)
     , stu_age		   NUMBER		CONSTRAINT CK_STUDENT_TB_STU_AGE CHECK(stu_age IN ('17', '18', '19'))
     , stu_phone 	   VARCHAR2(20)
     , stu_address	   VARCHAR2(50)
     , club_id		   NUMBER	    
     , CONSTRAINT FK_SUTDENT_TB_CLUB_ID FOREIGN KEY(club_id) REFERENCES CLUB_TB(club_id)
);


-- 1. 값 추가
INSERT INTO level_tb VALUES (202201, 1, 1);
INSERT INTO level_tb VALUES (202202, 2, 2);
INSERT INTO level_tb VALUES (202203, 3, 2);
INSERT INTO level_tb VALUES (202204, 1, 2);
INSERT INTO level_tb VALUES (202205, 3, 3);
INSERT INTO level_tb VALUES (202206, 1, 1);


INSERT INTO club_tb VALUES (1, '컴잘알', '김태리', 3, '한예슬');
INSERT INTO club_tb VALUES (2, '독서왕', '박보검', 2, '공유');


INSERT INTO student_tb VALUES (202201, '김태리', 17, '010-1234-5678', '서울시 강남구', 1);
INSERT INTO student_tb VALUES (202202, '강동원', 18, '010-1212-1212', '서울시 마포구', 1);
INSERT INTO student_tb VALUES (202203, '수지', 19, '010-0909-0110', '서울시 영등포구', 2);
INSERT INTO student_tb VALUES (202204, '박보검', 17, '010-3040-5060', '서울시 마포구', 2);
INSERT INTO student_tb VALUES (202205, '송강', 19, '010-9112-2323', '경기도 하남시', 1);
INSERT INTO student_tb VALUES (202206, '한소희', 17, '010-6233-6970', '경기도 구리시', '');

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'STUDENT_TB';
SELECT * FROM LEVEL_TB;
SELECT * FROM CLUB_TB;
SELECT * FROM STUDENT_TB;

/* <김규연>
 * bread_t 테이블과 bread_ref 테이블을 생성하고 아래와 같이 다시 생성해주세요.(복붙하세용!)
 * 1. 테이블을 생성(bread_t)하고 각 컬럼명, 자료형, 제약조건, 제약조건명을 부여하세요.
 * 컬럼 : 1. 재품번호(bread_id, 숫자, 기본키)
 *       2. 빵이름(bread_name, 가변길이 20자, NOT NULL)
 * 		 3. 빵갯수(bread_total, 숫자, X -> 기본값(0))
 *       4. 빵종류(bread_type, 가변길이 20자, CHECK(식빵, 일반빵, 크림빵, 조리빵, 패스츄리빵, 도넛, 유럽건강빵 중에 확인)
 * 		 5. 금액(bread_price, 숫자, X -> 기본값(0))
 * 2. 참조 태이블(date_manager_t)을 생성하고 각 컬럼명, 자료형, 제약조건, 제약조건명을 부여하새요.
 * 컬럼 : 1. 재품번호(bread_id, 숫자, 기본키)
 * 		 2. 빵생산날짜(dm_proddate, 날짜, X -> 기본값(오늘날짜))
 *       3. 비고(dm_note, 가변길이 100자, NOT NULL)
 * 3. 외래키를 사용하여 date_manager_t 테이블에 bread_id가 bread_t 테이블에 bread_id을 참조할 수 있도록 하세요.
 * 4. 주석도 같이 달아주세요.
 * 5. bread_t 테이블에 사진속처럼 빵7개를 추가하세요.
 * 6. bread_t에 피자빵 갯수를 15개로 바꾸세요.
 * 7. date_manager_t 테이블에 사진속처럼 추가하세요.
 * 8. date_manager_t에 dm_note를 생산날짜에서 
 * 							  6일이상 지나면 '이 제품은 팔 수 없습니다.'
 * 							  5일이 지나면 '유통기한이 지났습니다.'
 * 							  4일이 지나면 '유통기한이 1일 남았습니다.'
 * 							  3일이 지나면 '유통기한이 2일 남았습니다.'
 * 							  2일이 지나면 '유통기한이 3일 남았습니다.'
 * 							  1일이 지나면 '유통기한이 4일 남았습니다.'
 * 							  오늘 날짜와 같으면 '당일 생산 빵입니다.
 * 							  나머지는 '아직 생산되지 않은 빵입니다.' 라고 출력되도록 하세요.
 */
-- DATE_MANAGER_T에서 dm_note에 NOT NULL 확인물어보기

-- 1. 컬럼명 변경
ALTER TABLE BREAD_T RENAME COLUMN bread_no TO bread_id;
ALTER TABLE BREAD_T RENAME COLUMN bread_num TO bread_total;

-- 2. date_manager_t 생성
CREATE TABLE date_manager_t (
	   bread_id		  NUMBER    		CONSTRAINT PK_DATE_MANAGER_T_BREAD_ID  PRIMARY KEY
	 , dm_proddate	  DATE     		    DEFAULT(SYSDATE)
	 , dm_note		  VARCHAR2(100) 	CONSTRAINT NN_DATE_MANAGER_T_DM_NOTE NOT NULL
);

-- 3. 외래키 등록
ALTER TABLE date_manager_t MODIFY CONSTRAINT FOREIGN KEY(bread_id) REFERENCES bread_t(bread_id);
ALTER TABLE date_manager_t RENAME CONSTRAINT SYS_C0011640 TO FK_DATE_MAMAGER_T_BREAD_ID;

-- 4. 주석 등록
COMMENT ON COLUMN date_manager_t.bread_id IS '제품번호';
COMMENT ON COLUMN date_manager_t.dm_proddate IS '빵생산날짜';
COMMENT ON COLUMN date_manager_t.dm_note IS '비고';

-- 5. INSERT 
INSERT INTO bread_t VALUES (1, '소보로빵', 10, 1500, '일반빵');
INSERT INTO bread_t VALUES (2, '슈크림빵', 10, 1500, '크림빵');
INSERT INTO bread_t VALUES (3, '피자빵', 15, 1800, '조리빵');
INSERT INTO bread_t VALUES (4, '앙버터라우겐', 5, 2300, '유럽건강빵');
INSERT INTO bread_t VALUES (5, '옛날꽈배기', 20, 1200, '도넛');
INSERT INTO bread_t VALUES (6, '순우유식빵', 5, 4000, '식빵');
INSERT INTO bread_t VALUES (7, '바통크래쉬', 8, 3200, '패스츄리빵');

-- 6. 갯수 변경
UPDATE bread_t SET BREAD_TOTAL=15 WHERE BREAD_NAME='피자빵';

-- 7. date_manager_t 추가
INSERT INTO date_manager_t VALUES (1, '2022-06-25', 'E');
INSERT INTO date_manager_t VALUES (2, '2022-06-26', 'E');
INSERT INTO date_manager_t VALUES (3, '2022-06-24', 'E');
INSERT INTO date_manager_t VALUES (4, '2022-06-27', 'D');
INSERT INTO date_manager_t VALUES (5, '2022-06-28', 'D');
INSERT INTO date_manager_t VALUES (6, '2022-06-23', 'D');
INSERT INTO date_manager_t VALUES (7, '2022-06-29', 'D');

UPDATE date_manager_t
   SET dm_note = '이 제품은 팔 수 없습니다.'
 WHERE (SYSDATE - date_manager_t.dm_proddate) >= 6 ;
UPDATE date_manager_t
   SET dm_note = '유통기한이 지났습니다.'
 WHERE ((SYSDATE - date_manager_t.dm_proddate) >= 5 
	   AND (SYSDATE - date_manager_t.dm_proddate) < 6);
UPDATE date_manager_t
   SET dm_note = '유통기한이 1일 남았습니다.'
 WHERE ((SYSDATE - date_manager_t.dm_proddate) >= 4 
	   AND (SYSDATE - date_manager_t.dm_proddate) < 5);
UPDATE date_manager_t
   SET dm_note = '유통기한이 2일 남았습니다.'
 WHERE ((SYSDATE - date_manager_t.dm_proddate) >= 3 
	   AND (SYSDATE - date_manager_t.dm_proddate) < 4);
UPDATE date_manager_t
   SET dm_note = '유통기한이 3일 남았습니다.'
 WHERE ((SYSDATE - date_manager_t.dm_proddate) >= 2 
	   AND (SYSDATE - date_manager_t.dm_proddate) < 3);
UPDATE date_manager_t
   SET dm_note = '유통기한이 4일 남았습니다.'
 WHERE ((SYSDATE - date_manager_t.dm_proddate) >= 1 
	   AND (SYSDATE - date_manager_t.dm_proddate) < 2);
UPDATE date_manager_t
   SET dm_note = '당일 생산 빵입니다.'
 WHERE ((SYSDATE - date_manager_t.dm_proddate) >= 0 
	   AND (SYSDATE - date_manager_t.dm_proddate) < 1);	  
UPDATE date_manager_t
   SET dm_note = '아직 생산되지 않은 빵입니다.'
 WHERE (SYSDATE - date_manager_t.dm_proddate) < 0;

SELECT * FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'BREAD_T';	  
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'BREAD_T';
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'DATE_MANAGER_T';
SELECT * FROM ALL_COL_COMMENTS WHERE TABLE_NAME = 'BREAD_T';
SELECT * FROM ALL_COL_COMMENTS WHERE TABLE_NAME = 'DATE_MANAGER_T';

SELECT * FROM BREAD_T;
SELECT * FROM DATE_MANAGER_T ;

/* 
CREATE TABLE bread_t (
	  bread_id      VARCHAR2(20)       CONSTRAINT PK_BREAD_T_BREAD_NO PRIMARY KEY
	, bread_name    VARCHAR2(20)  CONSTRAINT NN_BREAD_T_BREAD_NAME NOT NULL
	, bread_total   NUMBER        DEFAULT(0)
	, bread_type    VARCHAR2(20)  DEFAULT(0)
	, bread_price   NUMBER 		  DEFAULT(0)
);
-- 2, 3
CREATE TABLE bread_ref (
	  BREAD_NO      NUMBER        CONSTRAINT  PK_BREAD_REF_BREAD_NO   PRIMARY KEY
	, BREAD_TEXT    VARCHAR2(20)  NOT NULL
	, CONSTRAINT FK_BREAD_REF_BREAD_NO FOREIGN KEY(BREAD_NO) REFERENCES bread_t(BREAD_NO)
);
음.. INSERT에 조건문을..넣는다? 
INSERT INTO date_manager_t(dm_note) VALUES(
	   CASE WHEN (SYSDATE - DATE_MANAGER_T.dm_proddate) >=6 THEN '이 제품은 팔 수 없습니다.'
		    WHEN (SYSDATE - DATE_MANAGER_T.dm_proddate) >=5 THEN '유통기한이 지났습니다.'
		    WHEN (SYSDATE - DATE_MANAGER_T.dm_proddate) >=4 THEN '유통기한이 1일 남았습니다.'
		    WHEN (SYSDATE - DATE_MANAGER_T.dm_proddate) >=3 THEN '유통기한이 2일 남았습니다.'
		    WHEN (SYSDATE - DATE_MANAGER_T.dm_proddate) >=2 THEN '유통기한이 3일 남았습니다.'
		    WHEN (SYSDATE - DATE_MANAGER_T.dm_proddate) >=1 THEN '유통기한이 4일 남았습니다.'
		    WHEN (SYSDATE - DATE_MANAGER_T.dm_proddate) = 0 THEN '당일 생산 빵입니다.'
		    ELSE '아직 생산되지 않은 빵입니다.'   
		END);

*/


/*
 * 김재은_문제06
 * 
 * 4,5 주차에 생성한 테이블을 사용하여 문제를 해결하시오.
 * 
 * 1. MART_T의 possible컬럼의 제약조건명을 CK_MART_T_POSSIBLE로 변경하시오.
 * 2. MART_T의 barcode컬럼의 제약조건명을 FK_MART_T_BARCODE로 변경하시오.
 * 3. INSERT를 사용하요 REF_MART_T에 r_bar 컬럼에 값을 추가하시오.
 * 	  (1234), (2345), (7890), (3456), (1004), (0000) 
 * 4. INSERT를 사용하여 MART_T에 값을 추가하시오.
 * 	  (새우깡, 1500, 농심, 봉지과자, O, 1234, 0001)
 * 	  (빅파이, 3000, 크라운, 박스형과자, O, 2345, 0002)
 * 	  (케챱, 4000, 오뚜기, 소스, O, 7890, 0003)
 *    (스타믹스, 2000, 하리보, 젤리, X, 3456, 0004)
 * 5. DELETE문을 사용하여 REF_MART_T에 r_bar컬럼에 값이 0000인 값을 지우시오
 */

--NAME, PRICE, COMPANY, KIND, POSSIBLE, BARCODE, SORT

-- 1, 2. 제약조건명변경
ALTER TABLE MART_T RENAME CONSTRAINT SYS_C0010068 TO CK_MART_T_POSSIBLE;
ALTER TABLE MART_T RENAME CONSTRAINT SYS_C0010070 TO RK_MART_T_R_BAR;
-- 3. INSERT 추가문 (REF_MART_T)
INSERT INTO REF_MART_T(r_bar) VALUES (1234);
INSERT INTO REF_MART_T(r_bar) VALUES (2345);
INSERT INTO REF_MART_T(r_bar) VALUES (7890);
INSERT INTO REF_MART_T(r_bar) VALUES (3456);
INSERT INTO REF_MART_T(r_bar) VALUES (1004);
INSERT INTO REF_MART_T(r_bar) VALUES (8282);
INSERT INTO REF_MART_T(r_bar) VALUES (8282);
INSERT INTO REF_MART_T(r_bar) VALUES (0000);
-- 4. INSERT 추가문 (MART_T)
INSERT INTO MART_T VALUES('새우깡', 1500, '농심', '봉지과자', 'O', 1234, 0001);
INSERT INTO MART_T VALUES('빅파이', 3000, '크라운', '박스형과자', 'O', 2345, 0002);
INSERT INTO MART_T VALUES('케챱', 4000, '오뚜기', '소스', 'O', 7890, 0003);
INSERT INTO MART_T VALUES('스타믹스', 2000, '하리보', '젤리', 'X', 3456, 0004);
-- 5. DELETE 문
DELETE FROM REF_MART_T WHERE r_bar=0000; 
-- 출력문
SELECT * FROM MART_T;
SELECT * FROM REF_MART_T;
-- MART_T 제약조건조회
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'MART_T';




