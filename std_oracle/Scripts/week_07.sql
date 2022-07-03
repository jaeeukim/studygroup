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
-->name(가변길이 10자),  salary(숫자), manage_sort(숫자)

-- 1. 테이블명 변경
ALTER TABLE REF_MART_T RENAME TO ref_mart_tb;
ALTER TABLE MART_T RENAME TO mart_tb;
ALTER TABLE EMP_MART_T RENAME TO emp_mart_tb;

-- 2. 제약조건 & 테이블 제거
ALTER TABLE mart_tb DROP CONSTRAINT FK_MART_T_BARCODE;
ALTER TABLE ref_mart_tb DROP CONSTRAINT PK_REF_MART_T_R_BAR;
DROP TABLE ref_mart_tb;

-- 3. 자료형 변경
ALTER TABLE emp_mart_tb MODIFY name VARCHAR2(20);


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
