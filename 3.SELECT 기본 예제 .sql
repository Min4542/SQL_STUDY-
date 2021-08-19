

--SELECT 기본 
SELECT
 certi_cd,certi_nm
FROM  TB_CERTI;

SELECT
 certi_nm
FROM  TB_CERTI;

SELECT
  *
FROM  TB_CERTI;

--SELECT 뒤에는 ALL이 생략되어 있음
--DISTINCT :중복값 제외
SELECT 
    issue_insti_nm
FROM TB_CERTI;

SELECT DISTINCT
    issue_insti_nm
FROM TB_CERTI;

SELECT DISTINCT
    issue_insti_nm,certi_nm
FROM TB_CERTI;

--열 별칭 지정 (ALIAS)
SELECT
certi_cd AS "자격증 코드"
,certi_nm AS " 자격증 이름"
,issue_insti_nm  "발행기관명"
FROM TB_CERTI;

--결합연산자(||)를 사용한 컬럼데이터 결합 
SELECT
        certi_nm||'('||certi_cd||')-'|| issue_insti_nm AS "자격증 정보"
FROM TB_CERTI;


--더미 테이블 (DUAL) : 단순 연산결과를 조회하고 싶을 때

SELECT
    (3 + 7) * 5 / 10 AS "연산결과"
FROM DUAL;

    
    
--WHERE 조건절 : 조회결과 행을 제한하는 조건절 
SELECT * FROM tb_emp;

SELECT
    emp_no,emp_nm,addr
FROM tb_emp
WHERE sex_cd =1;

--PK로 조건을 제한하면 무조건 단일행리 조회됩니다.
SELECT
emp_no,emp_nm,tel_no
FROM TB_EMP
WHERE emp_no =1000000010;

--비교연산자 (=,<>,<,<=,>,>=)
--SQL 비교연산자(BETWEEN,IN,LIKE)

SELECT
emp_no,emp_nm,BIRTH_DE,TEL_NO
FROM TB_EMP
WHERE BIRTH_DE>='19900101' AND  BIRTH_DE <= '19991231';
 

--BTWEEN 연산자
SELECT
emp_no,emp_nm,BIRTH_DE,TEL_NO
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19900101' AND '19991231';




--IN 연산자 
SELECT
emp_no,emp_nm,DEPT_CD
FROM TB_EMP
WHERE DEPT_CD = '100004'
                OR  DEPT_CD = '100006';




SELECT
emp_no,emp_nm,DEPT_CD
FROM TB_EMP
WHERE DEPT_CD  IN ('100004','100006');

SELECT
emp_no,emp_nm,DEPT_CD
FROM TB_EMP
WHERE DEPT_CD NOT IN ('100004','100006');


--LIKE 연산자 
--와일드카드 매핑 - %:1글자 이상 포함,  _:딱 1글자 포함
SELECT
emp_no,emp_nm
FROM TB_EMP
WHERE EMP_NM LIKE '이%';



SELECT
emp_no,emp_nm
FROM TB_EMP
WHERE EMP_NM LIKE '%심';

SELECT
emp_no,emp_nm
FROM TB_EMP
WHERE EMP_NM LIKE '이_';

--성씨가 김씨이면서, 부서가 100003,100004,100006번 중에 하나이면서 
--90년대생인 사원의 사번, 이름, 생일, 부서코드를 조회

SELECT
    emp_no,emp_nm,BIRTH_DE,DEPT_CD
FROM TB_EMP
WHERE EMP_NM LIKE '김%' 
                            AND DEPT_CD IN ('100003','100004','100006')
                                AND  BIRTH_DE BETWEEN '19900101' AND '19991231';


SELECT
    EMP_NM, ADDR, TEL_NO
FROM TB_EMP
WHERE ADDR LIKE '%수원%';



--NULL값 조회 
SELECT
    EMP_NO, EMP_NM, DIRECT_MANAGER_EMP_NO
FROM TB_EMP
WHERE DIRECT_MANAGER_EMP_NO  IS NULL; --NULL은 IS로만 비교 


SELECT
    EMP_NO, EMP_NM, DIRECT_MANAGER_EMP_NO
FROM TB_EMP
WHERE DIRECT_MANAGER_EMP_NO  IS NOT NULL;


--부정 비교연산자 
SELECT
emp_no,emp_nm,SEX_CD,DEPT_CD
FROM TB_EMP
WHERE EMP_NM LIKE '이%'
                AND sex_cd <> 1; -- <> == !=





