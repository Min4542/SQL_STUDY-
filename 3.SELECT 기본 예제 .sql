

--SELECT �⺻ 
SELECT
 certi_cd,certi_nm
FROM  TB_CERTI;

SELECT
 certi_nm
FROM  TB_CERTI;

SELECT
  *
FROM  TB_CERTI;

--SELECT �ڿ��� ALL�� �����Ǿ� ����
--DISTINCT :�ߺ��� ����
SELECT 
    issue_insti_nm
FROM TB_CERTI;

SELECT DISTINCT
    issue_insti_nm
FROM TB_CERTI;

SELECT DISTINCT
    issue_insti_nm,certi_nm
FROM TB_CERTI;

--�� ��Ī ���� (ALIAS)
SELECT
certi_cd AS "�ڰ��� �ڵ�"
,certi_nm AS " �ڰ��� �̸�"
,issue_insti_nm  "��������"
FROM TB_CERTI;

--���տ�����(||)�� ����� �÷������� ���� 
SELECT
        certi_nm||'('||certi_cd||')-'|| issue_insti_nm AS "�ڰ��� ����"
FROM TB_CERTI;


--���� ���̺� (DUAL) : �ܼ� �������� ��ȸ�ϰ� ���� ��

SELECT
    (3 + 7) * 5 / 10 AS "������"
FROM DUAL;

    
    
--WHERE ������ : ��ȸ��� ���� �����ϴ� ������ 
SELECT * FROM tb_emp;

SELECT
    emp_no,emp_nm,addr
FROM tb_emp
WHERE sex_cd =1;

--PK�� ������ �����ϸ� ������ �����ฮ ��ȸ�˴ϴ�.
SELECT
emp_no,emp_nm,tel_no
FROM TB_EMP
WHERE emp_no =1000000010;

--�񱳿����� (=,<>,<,<=,>,>=)
--SQL �񱳿�����(BETWEEN,IN,LIKE)

SELECT
emp_no,emp_nm,BIRTH_DE,TEL_NO
FROM TB_EMP
WHERE BIRTH_DE>='19900101' AND  BIRTH_DE <= '19991231';
 

--BTWEEN ������
SELECT
emp_no,emp_nm,BIRTH_DE,TEL_NO
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19900101' AND '19991231';




--IN ������ 
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


--LIKE ������ 
--���ϵ�ī�� ���� - %:1���� �̻� ����,  _:�� 1���� ����
SELECT
emp_no,emp_nm
FROM TB_EMP
WHERE EMP_NM LIKE '��%';



SELECT
emp_no,emp_nm
FROM TB_EMP
WHERE EMP_NM LIKE '%��';

SELECT
emp_no,emp_nm
FROM TB_EMP
WHERE EMP_NM LIKE '��_';

--������ �达�̸鼭, �μ��� 100003,100004,100006�� �߿� �ϳ��̸鼭 
--90������ ����� ���, �̸�, ����, �μ��ڵ带 ��ȸ

SELECT
    emp_no,emp_nm,BIRTH_DE,DEPT_CD
FROM TB_EMP
WHERE EMP_NM LIKE '��%' 
                            AND DEPT_CD IN ('100003','100004','100006')
                                AND  BIRTH_DE BETWEEN '19900101' AND '19991231';


SELECT
    EMP_NM, ADDR, TEL_NO
FROM TB_EMP
WHERE ADDR LIKE '%����%';



--NULL�� ��ȸ 
SELECT
    EMP_NO, EMP_NM, DIRECT_MANAGER_EMP_NO
FROM TB_EMP
WHERE DIRECT_MANAGER_EMP_NO  IS NULL; --NULL�� IS�θ� �� 


SELECT
    EMP_NO, EMP_NM, DIRECT_MANAGER_EMP_NO
FROM TB_EMP
WHERE DIRECT_MANAGER_EMP_NO  IS NOT NULL;


--���� �񱳿����� 
SELECT
emp_no,emp_nm,SEX_CD,DEPT_CD
FROM TB_EMP
WHERE EMP_NM LIKE '��%'
                AND sex_cd <> 1; -- <> == !=





