/*
 * 김재은_문제09
 * 
 * 1. mart_tb에 name의 제약조건을 UNIQUE로 추가하시오. (제약조건명은 계속해왔던 방식으로)
 * 
 * 2. 환불 테이블 refund_mart_tb을 생성하시오. (제약조건명은 계속해왔던 방식대로 알아서 만드시오.)
 * 		- name(VARCHAR2(20)) / buy_date(DATE) / refund_date(DATE) / progress(VARCHAR2(20))
 * 		- name은 mart_tb의 name을 참조할 수 있도록 제약조건을 설정하시오.
 * 
 * 3. v_refund_mart_tb를 생성하시오.
 * 		- 생성되어있다면 갱신하도록 하시오.
 * 		- refund_mart_tb에서 컬럼 name, refund_date, progress를 가져오도록 하시오.
 * 
 * 4. v_refund_mart_tb에 값을 추가하시오.
 * 		- ('계란30구', '20220613', '20220710'), ('새우깡', '20220709', '20220712')
 * 
 * 5. v_refund_mart_tb의 progress항목을 update하시오.	
 * 		- 이때, buy_date와 refund_date의 차이가 14이상이면 '환불불가'
 * 		  차이가 7이상이면 '환불신청접수', 그외에는 '환불처리'로 작성하시오.
 * 
 * 
 */

-- 1. UNIQUE 제약조건 추가 
ALTER TABLE mart_tb ADD CONSTRAINT UQ_MART_TB_NAME UNIQUE(name);
-- 2. refund_mart_tb 생성
CREATE TABLE refund_mart_tb(
	   name 		VARCHAR2(20) 	
	 , buy_date		DATE 			CONSTRAINT NN_REFUND_MART_TB_BUY_DATE NOT NULL
	 , refund_date  DATE			CONSTRAINT NN_REFUND_MART_TB_REFUND_DATE NOT NULL
	 , progress     VARCHAR2(20)   
	 , CONSTRAINT FK_REFUND_MART_TB_NAME FOREIGN KEY(name) REFERENCES mart_tb(name)
);


-- 3. view v_refund_mart_tb 생성
CREATE OR REPLACE VIEW v_refund_mart_tb 
	AS SELECT name
			, buy_date
			, refund_date
			, progress
		 FROM refund_mart_tb;
		
SELECT * FROM V_REFUND_MART_TB ;
-- 4. view에 값 넣기
INSERT INTO	v_refund_mart_tb(name, buy_date, refund_date) VALUES ('계란30구', '20220613', '20220710');
INSERT INTO	v_refund_mart_tb(name, buy_date, refund_date) VALUES ('새우깡', '20220709', '20220712');

-- 5. progress 추가하기
UPDATE v_refund_mart_tb 
   SET progress = (CASE WHEN (refund_date - buy_date) >= 14 THEN '환불불가'
   						WHEN (refund_date - buy_date) >= 7 THEN '환불신청접수'
   						ELSE '환불처리'
   						 END);

   						
   						
SELECT * FROM V_REFUND_MART_TB; 

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'MART_TB';
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'REFUND_MART_TB';













