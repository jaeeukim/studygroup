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

