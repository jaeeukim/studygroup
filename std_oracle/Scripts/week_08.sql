/*
 * 김재은_문제08
 * 
 * 1. emp_mart_tb에 hire_date 컬럼을 추가하시오. (자료형 date)
 * 2. 각 매니저별로 입사일을 추가하시오.
 *   (김봉지 => 2021-10-10), (최박스 => 2020-04-30), (다니엘소스 => 2022-02-13)
 *   (오젤리 => 2017-04-13), (이민트 => 2020-12-20), (윤아리 => 2019-09-29)
 * 3. JOIN을 이용하여 emp_mart_tb에 name과 hire_date, mart_tb에 name을 출력하시오.
 *    이때, emp_mart_tb의 manage_sort와 mart_tb의 sort가 같은값으로 검색할 수 있도록 조건을 작성하시오.
 *    - hire_date는 00년 00월 00일 형식으로 출력되게 하시오.
 * 	  - 각 별칭은 사진을 참조하시오.
 * 
 */
SELECT * FROM emp_mart_tb;
SELECT * FROM mart_tb;
-- 1. 컬럼 추가
ALTER TABLE emp_mart_tb ADD hire_date DATE;
-- 2. 입사일 추가
UPDATE emp_mart_tb SET hire_date = '2021-10-10' WHERE NAME = '김봉지';
UPDATE emp_mart_tb SET hire_date = '2020-04-30' WHERE NAME = '최박스';
UPDATE emp_mart_tb SET hire_date = '2022-02-13' WHERE NAME = '다니엘소스';
UPDATE emp_mart_tb SET hire_date = '2017-04-13' WHERE NAME = '오젤리';
UPDATE emp_mart_tb SET hire_date = '2020-12-20' WHERE NAME = '이민트';
UPDATE emp_mart_tb SET hire_date = '2019-09-29' WHERE NAME = '윤아리';

-- 3. 출력하기
SELECT e.name 매니저이름
     , TO_CHAR(e.hire_date, 'YY"년" MM"월" DD"일"') 고용일
     , m.NAME 담당상품명
  FROM emp_mart_tb e
  JOIN mart_tb m 
    ON e.MANAGE_SORT = m.SORT ;

