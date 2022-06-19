
/*
 * 김재은_문제05
 * 
 * 4주차에 생성한 MART_T 테이블을 사용하여 문제를 해결하시오.
 * 1. kind 컬럼의 크기를 가변길이20자로 늘리시오.
 * 2. sort 컬럼을 추가하시오.
 *    (타입은 숫자형, 제약조건은 primary key로 부여하시오)
 * 3. sort의 제약조건명을 PK_MART_T_SORT 로 변경하시오.
 * 4. ref_mart_t 테이블의 r_bar의 제약조건명을 PK_REF_MART_T_R_BAR로 변경하시오.
 * 5. EMP_MART_T 테이블을 생성하시오.
 *    ->name(가변길이 10자),  salary(숫자), manage_sort(숫자)
 *    (manage_sort는 MART_T의 sort를 외래키로 참조하도록 하시오.)
 * 6. manage_sort의 제약조건명을 PK_REF_MART_T_R_BAR로 변경한다.
 * 7. 각 주석을 추가로 달아준다
 * 	 - MART_T에 SORT에는 '분류코드'
 * 	 - EMP_MART_T에 NAME에는 '이름', SALARY에는 '연봉', MANAGE_SORT에는 '담당분류코드'를 작성한다.
 */

SELECT * FROM MART_T;

-- 1. 컬럼 길이 늘리기
ALTER TABLE MART_T MODIFY KIND VARCHAR2(20);
-- 2. 컬럼 추가
ALTER TABLE MART_T ADD sort NUMBER PRIMARY KEY;
-- 3 4. 제약조건명 변경
ALTER TABLE MART_T RENAME CONSTRAINT SYS_C0010856 TO PK_MART_T_SORT;
ALTER TABLE REF_MART_T RENAME CONSTRAINT SYS_C0010067 TO PK_REF_MART_T_R_BAR;
-- 5. 테이블생성
CREATE TABLE EMP_MART_T (
	  name 	    	VARCHAR2(10)
	, salary    	NUMBER
	, manage_sort	NUMBER 
	, FOREIGN KEY(manage_sort) REFERENCES MART_T(sort)
);
-- 6. 제약조건명 변경
ALTER TABLE EMP_MART_T RENAME CONSTRAINT SYS_C0010857 TO FK_EMP_MART_T_MANAGE_SORT;
-- 7. 주석달기
COMMENT ON COLUMN MART_T.SORT IS '분류코드';
COMMENT ON COLUMN EMP_MART_T.NAME IS '이름';
COMMENT ON COLUMN EMP_MART_T.SALARY IS '연봉';
COMMENT ON COLUMN EMP_MART_T.MANAGE_SORT IS '담당분류코드';

-- 제약조건 조회
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'MART_T';
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'EMP_MART_T';
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'REF_MART_T';
-- 주석 조회
SELECT * FROM USER_COL_COMMENTS WHERE TABLE_NAME = 'MART_T';
SELECT * FROM USER_COL_COMMENTS WHERE TABLE_NAME = 'EMP_MART_T';
-- 컬럼명/타입 확인
SELECT * FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'MART_T';
