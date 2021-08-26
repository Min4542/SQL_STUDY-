
-- ���� ���� 
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
where e.dept_cd = d.dept_cd --���� ���� 
;


--�ڰ��� ���� ���̺� 
SELECT
    *
FROM tb_certi;


--����� ����� �ڰ��� ���� ���̺� 
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


-- 3���� ���̺� ���� 
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
            and a.emp_nm like '��%'
            and c.acqu_de BETWEEN '20190101' and '20191231'

; 




--���� ����

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

INSERT INTO test_b VALUES (1,'������',1);
INSERT INTO test_b VALUES (2,'������',1);
INSERT INTO test_b VALUES (3,'������',2);
INSERT INTO test_b VALUES (4,'������',3);


SELECT * FROM test_a;
SELECT * FROM test_b;


SELECT
    a.id ,  a.content , b.b_id , b.reply
FROM Test_A A, test_b B
where a.id = b.a_id 
;
--cross join : ���� ������ ���� �� ���� ũ�ν��ؼ� ������ 


--#INNER JOIN 
--1. 2�� �̻��� ���̺��� ����� �÷��� ���� �������� ���յǴ� ���α���Դϴ�.
--2. WHERE���� ���� Į������ �������(=)�� ���� ���ε˴ϴ�.

SELECT
    E.EMP_NO, E.EMP_NM, E.ADDR, E.DEPT_CD, D.DEPT_NM
FROM TB_EMP E, tb_dept D
WHERE d.dept_cd = e.dept_cd
    AND e.addr LIKE '%����%'
ORDER BY e.emp_no
;

SELECT
   *
FROM TB_EMP E, tb_dept D
WHERE d.dept_cd = e.dept_cd
    AND e.addr LIKE '%����%'
ORDER BY e.emp_no
;


-- # NATURAL JOIN
-- 1. NATURAL JOIN�� ������ �̸��� ���� �÷��鿡 ���� �ڵ� �����ϴ� ����Դϴ�.
-- 2. ��, �ڵ����� 2�� �̻��� ���̺��� ���� �̸��� ���� �÷��� ã�� INNER������ �����մϴ�.
-- 3. �� �� ���εǴ� ���� �̸��� �÷��� ������ Ÿ���� ���ƾ� �ϸ�, ALIAS�� ���̺���� ���� �� �����ϴ�.
-- 4. SELECT * ������ ����ϸ�, ���� �÷����� �ڵ� �����ϸ� ������տ��� �ѹ��� ǥ��˴ϴ�.
-- �� ���� �� �� �ִ�


SELECT
    E.emp_no, E.emp_nm, E.addr, dept_cd , d.dept_nm
FROM tb_emp E NATURAL JOIN tb_dept D
;

SELECT
    *
FROM tb_emp E NATURAL JOIN tb_dept D
;


-- # USING�� ����
-- 1. NATURAL���ο����� �ڵ����� �̸��� ��ġ�ϴ� ��� �÷��� ���� ������
--    �Ͼ���� USING�� ����ϸ� ���ϴ� �÷��� ���ؼ��� ���������� ������ �����մϴ�.
-- 2. USING�������� ���� �÷��� ���� ALIAS�� ���̺���� ���� �� �����ϴ�.

SELECT
    E.emp_no, E.emp_nm, E.addr, dept_cd , d.dept_nm
FROM tb_emp E  JOIN tb_dept D USING (dept_cd)
;


-- # JOIN ON��
-- 1. ���� ���� ������(ON��)�� �Ϲ� ���� ������(WHERE��)�� �и��ؼ� �ۼ��ϴ� ����Դϴ�.
-- 2. ON���� ����ϸ� JOIN���Ŀ� �� �����̳� ���������� ���� �߰� ������ �� �� �ֽ��ϴ�.

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
WHERE  e.addr LIKE '%����%'
ORDER BY e.emp_no
;

-- SELECT [DISTINCT] { ���̸� .... } 
-- FROM  ���̺� �Ǵ� �� �̸�
-- JOIN  ���̺� �Ǵ� �� �̸�
-- ON    ���� ����
-- WHERE ��ȸ ����
-- GROUP BY  ���� �׷�ȭ
-- HAVING    �׷�ȭ ����
-- ORDER BY  ������ �� [ASC | DESC];




























