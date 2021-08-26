
-- 조인 기초 
SELECT
    emp_no,emp_nm,dept_cd
FROM tb_emp
;



SELECT
    E.emp_no
    , E.emp_nm
    , E.dept_cd
    , D.dept_nm
FROM tb_emp E, tb_dept D
where e.dept_cd = d.dept_cd --조인 조건 
;


--자격증 정보 테이블 
SELECT
    *
FROM tb_certi;


--사원이 취득한 자격증 정보 테이블 
SELECT
    *
FROM tb_emp_certi;


SELECT
    e.emp_no,e.emp_nm,
    ec.certi_cd,ec.acqu_de
FROM tb_emp E, tb_emp_certi EC
where e.emp_no = ec.emp_no
;

SELECT
    c.certi_cd , c.certi_nm , c.issue_insti_nm,
    ec.acqu_de , ec.emp_no
FROM tb_certi C, tb_emp_certi EC
where c.certi_cd = ec.certi_cd
;


-- 3개의 테이블 조인 
SELECT
    a.emp_no,a.emp_nm,b.certi_cd
    ,b.certi_nm, c.acqu_de
FROM tb_emp A, tb_certi B, tb_emp_certi  C
where a.emp_no = c.emp_no 
            and b.certi_cd = c.certi_cd
; 


SELECT
    a.emp_no,a.emp_nm,b.certi_cd
    ,b.certi_nm, c.acqu_de
FROM tb_emp A, tb_certi B, tb_emp_certi  C
where a.emp_no = c.emp_no 
            and b.certi_cd = c.certi_cd
            and a.emp_nm like '이%'
            and c.acqu_de BETWEEN '20190101' and '20191231'

; 




--조인 예제

CREATE TABLE TEST_A (
    id NUMBER(10) PRIMARY KEY ,
    content VARCHAR2(200)
); 

CREATE TABLE TEST_B (
    b_id NUMBER(10) PRIMARY KEY ,
    reply VARCHAR2(100),
    a_id NUMBER(10) --FK
); 

INSERT INTO test_a VALUES (1,'aaa');
INSERT INTO test_a VALUES (2,'bbb');
INSERT INTO test_a VALUES (3,'ccc');

INSERT INTO test_b VALUES (1,'ㄱㄱㄱ',1);
INSERT INTO test_b VALUES (2,'ㄴㄴㄴ',1);
INSERT INTO test_b VALUES (3,'ㄷㄷㄷ',2);
INSERT INTO test_b VALUES (4,'ㄹㄹㄹ',3);


SELECT * FROM test_a;
SELECT * FROM test_b;


SELECT
    a.id ,  a.content , b.b_id , b.reply
FROM Test_A A, test_b B
where a.id = b.a_id 
;
--cross join : 조인 조건이 없을 때 전부 크로스해서 가져옴 


--#INNER JOIN 
--1. 2개 이상의 테이블이 공통된 컬럼에 의해 논리적으로 결합되는 조인기법입니다.
--2. WHERE절에 사용된 칼럼들이 동등연산자(=)에 의해 조인됩니다.

SELECT
    E.EMP_NO, E.EMP_NM, E.ADDR, E.DEPT_CD, D.DEPT_NM
FROM TB_EMP E, tb_dept D
WHERE d.dept_cd = e.dept_cd
    AND e.addr LIKE '%용인%'
ORDER BY e.emp_no
;

SELECT
   *
FROM TB_EMP E, tb_dept D
WHERE d.dept_cd = e.dept_cd
    AND e.addr LIKE '%용인%'
ORDER BY e.emp_no
;


-- # NATURAL JOIN
-- 1. NATURAL JOIN은 동일한 이름을 갖는 컬럼들에 대해 자동 조인하는 기법입니다.
-- 2. 즉, 자동으로 2개 이상의 테이블에서 같은 이름을 가진 컬럼을 찾아 INNER조인을 수행합니다.
-- 3. 이 때 조인되는 동일 이름의 컬럼은 데이터 타입이 같아야 하며, ALIAS나 테이블명을 붙일 수 없습니다.
-- 4. SELECT * 문법을 사용하면, 공통 컬럼으로 자동 조인하며 결과집합에서 한번만 표기됩니다.
-- 좀 위험 할 수 있다


SELECT
    E.emp_no, E.emp_nm, E.addr, dept_cd , d.dept_nm
FROM tb_emp E NATURAL JOIN tb_dept D
;

SELECT
    *
FROM tb_emp E NATURAL JOIN tb_dept D
;


-- # USING절 조인
-- 1. NATURAL조인에서는 자동으로 이름이 일치하는 모든 컬럼에 대해 조인이
--    일어나지만 USING을 사용하면 원하는 컬럼에 대해서만 선택적으로 조인이 가능합니다.
-- 2. USING절에서도 조인 컬럼에 대해 ALIAS나 테이블명을 붙일 수 없습니다.

SELECT
    E.emp_no, E.emp_nm, E.addr, dept_cd , d.dept_nm
FROM tb_emp E  JOIN tb_dept D USING (dept_cd)
;


-- # JOIN ON절
-- 1. 조인 조건 서술부(ON절)와 일반 조건 서술부(WHERE절)를 분리해서 작성하는 방법입니다.
-- 2. ON절을 사용하면 JOIN이후에 논리 연산이나 서브쿼리와 같은 추가 서술을 할 수 있습니다.

SELECT 
    A.emp_no, A.emp_nm, D.dept_nm, B.acqu_de, B.certi_cd, C.certi_nm
FROM tb_emp A 
JOIN  tb_emp_certi B 
ON A.emp_no = B.emp_no
JOIN  tb_certi C 
ON B.certi_cd = C.certi_cd
JOIN  tb_dept D
ON  A.dept_cd = D.dept_cd
;


SELECT
    E.EMP_NO, E.EMP_NM, E.ADDR, E.DEPT_CD, D.DEPT_NM
FROM TB_EMP E 
JOIN tb_dept D
ON d.dept_cd = e.dept_cd
WHERE  e.addr LIKE '%용인%'
ORDER BY e.emp_no
;

-- SELECT [DISTINCT] { 열이름 .... } 
-- FROM  테이블 또는 뷰 이름
-- JOIN  테이블 또는 뷰 이름
-- ON    조인 조건
-- WHERE 조회 조건
-- GROUP BY  열을 그룹화
-- HAVING    그룹화 조건
-- ORDER BY  정렬할 열 [ASC | DESC];




























