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
    ON e.MANAGE_SORT = m.SORT ;

-- 5. 제약조건명 변경
ALTER TABLE mart_tb RENAME CONSTRAINTS CK_MART_T_POSSIBLE TO CK_MART_TB_POSSIBLE;
ALTER TABLE mart_tb RENAME CONSTRAINTS PK_MART_T_SORT TO PK_MART_TB_SORT;
ALTER TABLE emp_mart_tb RENAME CONSTRAINTS FK_EMP_MART_T_MANAGE_SORT TO FK_EMP_MART_TB_MANAGE_SORT;


SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'MART_TB';
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'EMP_MART_TB';


