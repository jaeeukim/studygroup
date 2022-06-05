/*
 * 홍유라_문제04
 * 학생 정보를 관리하는 테이블인 student_t 테이블과
 * 과목 정보를 관리하는 테이블인 subject_t 테이블을 만들어 본다.
 *  1. student_t 테이블
 * 		- 아래의 사진을 참고하여 컬럼명과 데이터 타입을 설정한다.
 * 		  (데이터 타입 크기 : stu_id - 없음	/ stu_name - 20 / class_name - 20)
 * 
 * 		- 아래의 사진을 참고하여 모든 컬럼에 주석(코멘트)을 달아준다.
 * 
 * 		- stu_id 객체를 식별값으로 사용하며 stu_name 은 NULL 값을 허용하지 않도록 한다.
 * 		  (단, 제약조건 설정 시 암묵적으로 정해진 제약조건명을 부여하도록 한다.
 * 		   제약조건은 컬럼 레벨, 테이블 레벨 상관 없이 설정한다.)
 * 
 *  2. subject_t 테이블
 * 		- 아래의 사진을 참고하여 컬럼명과 데이터 타입을 설정한다.
 * 		  (데이터 타입 크기 : stu_id - 없음 / sub_no - 10 / sub_name - 10  / sub_score - 3)
 * 
 * 		- 아래의 사진을 참고하여 모든 컬럼에 주석(코멘트)을 달아준다.
 * 
 * 		- stu_id 를 student_t 의 식별값과 외래키 관계가 될 수 있도록 한다.
 * 		- sub_name 에는 '국어', '영어', '수학', '과학' 만 입력 및 수정 될 수 있도록 한다.
 * 		- sub_score 에는 0 ~ 100 사이의 숫자만 입력 및 수정 될 수 있도록 한다.
 * 		  (단, 제약조건 설정 시 암묵적으로 정해진 제약조건명을 부여하도록 한다.
 * 		   제약조건은 컬럼 레벨, 테이블 레벨 상관 없이 설정한다.)
 * 
 * 		- 두 테이블의 제약조건들이 잘 적용 됐는지 확인한다.
 */

CREATE TABLE student_t (
	  stu_id		NUMBER		
	, stu_name  	VARCHAR2(20)
	, class_name	VARCHAR2(20)
	, CONSTRAINT PK_STUDENT_T_STU_ID PRIMARY KEY(stu_id)
);

ALTER TABLE STUDENT_T MODIFY stu_name CONSTRAINT NN_STUDENT_T_STU_NAME NOT NULL;

COMMENT ON COLUMN student_t.stu_id IS '학번';
COMMENT ON COLUMN student_t.stu_name IS '학생명';
COMMENT ON COLUMN student_t.class_name IS '학급(반)';

CREATE TABLE subject_t (
	  stu_id		NUMBER		
	, sub_no		VARCHAR2(10)
	, sub_name		VARCHAR2(10)
	, sub_score		NUMBER(3)
	, CONSTRAINT CK_SUBJECT_T_SUB_NAME CHECK (sub_name IN('국어', '영어', '수학', '과학'))
	, CONSTRAINT CK_SUBJECT_T_SUB_SCORE CHECK (sub_score BETWEEN 0 AND 100)
	, CONSTRAINT FK_SUBJECT_T_STU_ID FOREIGN KEY(stu_id) REFERENCES student_t(stu_id)
);

COMMENT ON COLUMN subject_t.stu_id IS '학번';
COMMENT ON COLUMN subject_t.sub_no IS '과목코드';
COMMENT ON COLUMN subject_t.sub_name IS '과목명';
COMMENT ON COLUMN subject_t.sub_score IS '점수';


--테이블출력
SELECT * FROM STUDENT_T;
SELECT * FROM subject_t;
--제약조건확인
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='STUDENT_T';
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='SUBJECT_T';
--주석명확인
SELECT * FROM USER_COL_COMMENTS WHERE TABLE_NAME='STUDENT_T';
SELECT * FROM USER_COL_COMMENTS WHERE TABLE_NAME='SUBJECT_T';
--삭제
DROP TABLE STUDENT_T;
DROP TABLE SUBJECT_T;

/*
 * 이보슬_문제04
 * 
 * 간단한 학생 관리 테이블을 생성해본다. (※ 테이블 생성 순서에 주의한다.)
 *
 * <STUDENT 테이블>
 * 1. STUDENT 테이블에는 STU_NO, STU_NAME 컬럼을 생성한다. (글자는 10자 이상으로 한다.)
 * 		- 컬럼타입은 <STUDENT 테이블 생성 사진>을 확인한다.
 * 		- STU_NO은 제약조건을 PRIMARY KEY로 설정하고, STU_NAME은 NOT NULL로 설정한다. (제약조건명은 따로 설정하지 않는다.)
 * 		- STUDENT 테이블의 STU_NO 컬럼은 STUDENT_LEVEL 테이블의 STU_NO 컬럼을 참조하도록 한다.  
 * 2. 테이블 생성이 끝난 뒤
 * 		- STU_NO의 PRIMARY KEY 제약조건명을 PK_STUDENT_STU_NO 으로 변경해준다.
 * 		- STU_NO의 FOREIGN KEY 제약조건명을 FK_STUDENT_STU_NO 으로 변경해준다.
 * 	 	- STU_NAME의 NOT NULL 제약조건명은 NN_STUDENT_STU_NAME 으로 변경해준다. 
 *    - <STUDENT 테이블 제약조건 사진> 참고
 * 
 *  <STUDENT_LEVEL 테이블>
 * 1. STUDENT_LEVEL 테이블은 STU_NO, LEVEL_NO, CLASS, TEACHER 컬럼을 갖도록 한다. (제약조건은 따로 설정하지 않는다.)
 * 		- STU_NO 컬럼에 PRIMARY KEY 제약조건을 설정해주고 제약조건명은 PK_STUDENT_LEVEL_STU_NO 로 지어준다.
 * 		- 컬럼타입은 <STUDENT_LEVEL 테이블 생성 사진>을 확인한다.
 * 2. 테이블 생성이 끝난 뒤 
 * 		- LEVEL_NO 컬럼에는 값이 1,2,3만 들어올 수 있도록 CHECK 제약조건을 추가해주고 제약조건명은 CK_STUDENT_LEVEL_LEVEL_NO 로 지어준다.
 *    - <STUDENT_LEVEL 테이블 제약조건 사진> 참고
 */




/*
 * 김재은_문제04
 *  1. MART_T 테이블을 생성한다.
 *   ->  name(가변길이 20자), price(숫자), company(가변길이 20자)
 *     , kind(고정길이 1자), possible(고정길이 1자), barcode(숫자)로 생성해준다.
 * 
 *  2. ref_mart_t 테이블을 생성한다. [참조에 사용될 테이블이다.]
 *   -> r_bar(숫자), note(가변길이 20자)
 *      r_bar는 primary key를 부여한다.
 * 
 * - 이때, company의 값에 입력이 없다면 '없음'이 출력되게 하시오.
 * - possible에서 'O'와 'X'로 입력되었는지 확인하는 제약조건을 추가하시오.
 * - name에는 PK_MART_T_NAME이라는 primary key 제약조건을 부여하시오.
 * - barcode는 ref_mart_t 테이블에서 r_bar을 외래키로 참조 할 수 있게 하시오.
 * - MART_T테이블에서 각 컬럼에는 주석을 달아준다.
 *   (name-상품명, price-가격, company-제조사, kind-종류, 
 *    possible-구매가능여부, barcode-바코드)
 */


CREATE TABLE MART_T (
	  name		VARCHAR2(20)
	, price		NUMBER
	, company	VARCHAR2(20)   DEFAULT('없음')
	, kind 		VARCHAR2(20)
	, possible 	CHAR(1)		   CHECK(possible IN('O', 'X'))
	, barcode   NUMBER
	, CONSTRAINT PK_MART_T_NAME PRIMARY KEY (name) 
	, FOREIGN KEY(barcode) REFERENCES ref_mart_t(r_bar)
);

CREATE TABLE ref_mart_t (
   	  r_bar	  NUMBER  		PRIMARY KEY
   	, note    VARCHAR2(20)
);

COMMENT ON COLUMN MART_T.NAME IS '상품명';
COMMENT ON COLUMN MART_T.PRICE IS '가격';
COMMENT ON COLUMN MART_T.COMPANY IS '제조사';
COMMENT ON COLUMN MART_T.KIND IS '종류';
COMMENT ON COLUMN MART_T.POSSIBLE IS '구매가능여부';
COMMENT ON COLUMN MART_T.BARCODE IS '바코드';

-----------------------------------------------------------------------
-- 주석확인
SELECT * FROM USER_COL_COMMENTS WHERE TABLE_NAME='MART_T';
-- 삭제
DROP TABLE MART_T;
DROP TABLE REF_MART_T;
-- 출력
SELECT * FROM MART_T;
SELECT * FROM ref_MART_T;
-- 
SELECT * FROM USER_TAB_COLUMNS WHERE TABLE_NAME='MART_T';
SELECT * FROM USER_TAB_COLUMNS WHERE TABLE_NAME='REF_MART_T';
-- 제약조건명확인
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='MART_T';
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='REF_MART_T';

