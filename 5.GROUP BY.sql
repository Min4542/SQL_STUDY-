

-- #GROUP BY , HAVING
-- 1. 집계 함수
SELECT
   COUNT(emp_no) as "총 사원수",
   max(birth_de) as "가장 어린 사람",
   min(birth_de) as  "가장 나이 많은 사람"
FROM tb_emp;

SELECT
    COUNT(*), --null 포함 카운트 
    COUNT(direct_manager_emp_no) --null 제외 카운트
FROM tb_emp;

-- 2. GROUP BY : 테이블 내에서 그룹화할 때 
-- EX) 부서별로 가장 어린사람의 생년월일, 가장 나이많은 사람의 생년월일, 부서별 직원수를 알고 싶음

SELECT birth_de,dept_cd
FROM tb_emp
ORDER BY dept_cd ASC; -- 정렬 :ASC- 오름차(기본값) // DESC(내림차)


SELECT
    DEPT_CD,
    COUNT(*) AS "부서별 직원수"
    ,MAX(BIRTH_DE) AS "부서 막내"
    ,MIN(BIRTH_DE) AS "부서 연장자"
FROM tb_emp
GROUP BY DEPT_CD
ORDER BY DEPT_CD
;

-- having절 :그룹화된 결과에서 조건을 걸어 행 수를 제한 그룹화 후에 조건을 건다.

SELECT
    DEPT_CD,
     COUNT(*) AS "부서별 직원수"
    ,MAX(BIRTH_DE) AS "부서 막내"
    ,MIN(BIRTH_DE) AS "부서 연장자"
FROM tb_emp
GROUP BY DEPT_CD
HAVING COUNT(*)>=2
ORDER BY DEPT_CD
;

--사원별로 급여를 제일 많이 받은 액수, 제일 적게 받은 액수, 평균액수 조회 
SELECT * FROM TB_SAL_HIS
ORDER BY EMP_NO, PAY_DE;  --EMP_NO로 정렬한 후 같은 값들끼리는 PAY_DE로 재정렬

SELECT
    EMP_NO,
    MAX(PAY_AMT) AS "최고 수령액",
    MIN(PAY_AMT) AS "최저 수령액",
  TO_CHAR( ROUND(AVG(pay_amt),2),'L999,999,999.99') AS "평균 수령액"
FROM TB_SAL_HIS
GROUP BY EMP_NO
ORDER BY EMP_NO;



--평균 급여가 470만원 이상인 사원만 조회하고 싶음 

SELECT
    EMP_NO,
    MAX(PAY_AMT) AS "최고 수령액",
    MIN(PAY_AMT) AS "최저 수령액",
  TO_CHAR( ROUND(AVG(pay_amt),2),'L999,999,999.99') AS "평균 수령액"
FROM TB_SAL_HIS
GROUP BY EMP_NO
HAVING AVG(pay_amt)>=4500000
ORDER BY EMP_NO;


-- 2019년 1년간 평균 급여가 470만원 이상인 사원만 조회하고 싶음 
SELECT
    EMP_NO,
    MAX(PAY_AMT) AS "최고 수령액",
    MIN(PAY_AMT) AS "최저 수령액",
  TO_CHAR( ROUND(AVG(pay_amt),2),'L999,999,999.99') AS "평균 수령액"
FROM TB_SAL_HIS
WHERE PAY_DE BETWEEN '20190101' AND '20191231'
GROUP BY EMP_NO
HAVING AVG(pay_amt)>=4500000
ORDER BY EMP_NO;

-- 2019년 1년간 사원별 연봉을 추가 조회
SELECT --5
    EMP_NO,
    MAX(PAY_AMT) AS "최고 수령액",
    MIN(PAY_AMT) AS "최저 수령액",
    TO_CHAR( ROUND(AVG(pay_amt),2),'L999,999,999.99') AS "평균 수령액",
    TO_CHAR( ROUND(SUM(pay_amt),2),'L999,999,999')  AS "연봉"
FROM TB_SAL_HIS  --1 
WHERE PAY_DE BETWEEN '20190101' AND '20191231' --2 
GROUP BY EMP_NO --3  having --4
ORDER BY EMP_NO;--6



--정렬 ORDER BY 
--ASC :오름차(기본값) // DESC: 내림차
--항상 SELECT 절의 맨 마지막줄에 위치
SELECT
    EMP_NO, EMP_NM, ADDR 
FROM TB_EMP
ORDER BY EMP_NO DESC;

SELECT
    EMP_NO, EMP_NM, ADDR 
FROM TB_EMP
ORDER BY EMP_NM DESC;

SELECT
    EMP_NO, EMP_NM, ADDR 
FROM TB_EMP
ORDER BY 2 DESC;


SELECT
    EMP_NO, EMP_NM, ADDR 
FROM TB_EMP
ORDER BY EMP_NM DESC, EMP_NO DESC;


-- 정렬 할 때 별칭을 쓸 수 있다. 
SELECT
    EMP_NO AS ENO, 
    EMP_NM AS ENM, 
    ADDR 
FROM TB_EMP
ORDER BY ENO DESC;



SELECT
    emp_nm
    --,COUNT(emp_no) as cnt count를 쓰면 1행만 나온다  일반 컬럼끼리만 써야 한다.  group by는 제외 
FROM tb_emp




