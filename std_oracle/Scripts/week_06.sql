

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




