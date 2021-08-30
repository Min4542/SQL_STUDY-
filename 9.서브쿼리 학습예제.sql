

--# 단일행 서브쿼리 
--서브쿼리의 조회 결과가 1건 이하인 경우 

--부서번호가 100004번인 부서의 모든 사원정보 조회 

SELECT
    *    
FROM TB_EMP
WHERE DEPT_CD= '100004'
;

--이나라가 속해있는 부서의 모든 사원정보 조회

SELECT * FROM TB_EMP;

SELECT
    *    
FROM TB_EMP
WHERE DEPT_CD IN (

SELECT DEPT_CD FROM TB_EMP WHERE EMP_NM = '이관심'

) --이나라가 속해있는 부서 코드 이게 서브쿼리 
;


--20200525에 받은 급여가 회사의 20200525 전체 평균 급여보다 높은 사원들의 정보 조회

SELECT
    A.emp_no , A.emp_nm, b.pay_de , b.pay_amt
FROM TB_EMP A 
JOIN tb_sal_his B
ON A.emp_no = B.emp_no
WHERE b.pay_de = '20200525'
AND b.pay_amt>= (
SELECT
    AVG(PAY_AMT)
FROM TB_SAL_HIS
WHERE PAY_DE = '20200525'
)
ORDER BY a.emp_no, b.pay_de
;

SELECT
    AVG(PAY_AMT)
FROM TB_SAL_HIS
WHERE PAY_DE = '20200525'
; --단일행 서브 쿼리 단일 컬럼


-- #다중 행 서브쿼리 
--서브쿼리 조회 건수가 여러 행인 것

--한국데이터베이스진흥원에서 발급한 자격증을 가지고 있는 사원번호와 보유 자격증 개수를 조회
SELECT * FROM tb_certi WHERE issue_insti_nm = '한국데이터베이스진흥원';

SELECT 
 A.emp_no, b.emp_nm , COUNT(A.certi_cd)
FROM tb_emp_certi A ,tb_emp B
WHERE A.certi_cd IN ('100001','100002','100003','100004','100005')
        AND A.emp_no = B.emp_no
GROUP BY A.emp_no ,B.EMP_nm
ORDER BY A.emp_no
;


SELECT 
 A.emp_no, b.emp_nm , COUNT(A.certi_cd)
FROM tb_emp_certi A ,tb_emp B
WHERE A.certi_cd IN (
                SELECT CERTI_CD FROM tb_certi WHERE issue_insti_nm = '한국데이터베이스진흥원'
                                )
        AND A.emp_no = B.emp_no
GROUP BY A.emp_no ,B.EMP_nm
ORDER BY A.emp_no
; --다중행 서브 쿼리 단일 컬럼



--# 다중 컬럼 서브쿼리 

--부서원이 2명 이상인 부서 중에서 각 부서의 가장 나이 많은 사람의 사원정보를 조회 

SELECT
    a.emp_no, a.emp_nm, a.birth_de, a.dept_cd, B.DEPT_NM
FROM tb_emp A
JOIN TB_DEPT B
ON a.dept_cd = b.dept_cd
WHERE (A.DEPT_CD ,A.birth_de) IN  (
                                        SELECT
                                        DEPT_CD,  MIN(birth_de)
                                        FROM tb_emp
                                        GROUP BY dept_cd 
                                        HAVING COUNT(*) >=2
        
                                                    )
ORDER BY a.emp_no
;


SELECT
  DEPT_CD,  MIN(birth_de)
FROM tb_emp
GROUP BY dept_cd 
HAVING COUNT(*) >=2
;



--EXISTS 문

--주소가 강남인 직원들이 근무하고 있는 부서들의 전체정보를 조회
SELECT DISTINCT
    a.dept_cd , a.dept_nm
FROM TB_DEPT A , tb_emp B
WHERE a.dept_cd = b.dept_cd
    AND b.addr LIKE '%강남%'
ORDER BY A.DEPT_CD
;

SELECT
    *
FROM tb_emp WHERE ADDR LIKE '%강남%';

SELECT
    a.dept_cd , a.dept_nm
FROM tb_dept A
WHERE EXISTS(
                    SELECT
                        1
                    FROM tb_emp B
                    WHERE B.ADDR LIKE '%강남%'
                        AND a.dept_cd = b.dept_cd
)
;


 SELECT
        1
        FROM tb_emp
        WHERE ADDR LIKE '%강남%';



--#스칼라 서브쿼리 (SELECT절에 들어가는 서브쿼리)

SELECT
    a.emp_no , a.emp_nm 
    , b.dept_nm
    ,a.addr , A.BIRTH_DE , a.sex_cd
FROM TB_EMP A
JOIN tb_dept B
ON a.dept_cd = b.dept_cd
;

SELECT
    a.emp_no , a.emp_nm 
    , (SELECT b.dept_nm FROM tb_dept B WHERE A.DEPT_CD = B.DEPT_CD) AS DEPT_NM
    ,a.addr , A.BIRTH_DE , a.sex_cd
FROM TB_EMP A
 
;



--#인라인 뷰 (FROM절 안에 넣는 서브쿼리)

SELECT
 x.emp_nm , x.dept_nm
FROM (SELECT
    a.emp_no , a.emp_nm 
    , b.dept_nm
    ,a.addr , A.BIRTH_DE , a.sex_cd
FROM TB_EMP A
JOIN tb_dept B
ON a.dept_cd = b.dept_cd) X --가상 테이블 
;

























