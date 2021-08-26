

-- #GROUP BY , HAVING
-- 1. ���� �Լ�
SELECT
   COUNT(emp_no) as "�� �����",
   max(birth_de) as "���� � ���",
   min(birth_de) as  "���� ���� ���� ���"
FROM tb_emp;

SELECT
    COUNT(*), --null ���� ī��Ʈ 
    COUNT(direct_manager_emp_no) --null ���� ī��Ʈ
FROM tb_emp;

-- 2. GROUP BY : ���̺� ������ �׷�ȭ�� �� 
-- EX) �μ����� ���� ������ �������, ���� ���̸��� ����� �������, �μ��� �������� �˰� ����

SELECT birth_de,dept_cd
FROM tb_emp
ORDER BY dept_cd ASC; -- ���� :ASC- ������(�⺻��) // DESC(������)


SELECT
    DEPT_CD,
    COUNT(*) AS "�μ��� ������"
    ,MAX(BIRTH_DE) AS "�μ� ����"
    ,MIN(BIRTH_DE) AS "�μ� ������"
FROM tb_emp
GROUP BY DEPT_CD
ORDER BY DEPT_CD
;

-- having�� :�׷�ȭ�� ������� ������ �ɾ� �� ���� ���� �׷�ȭ �Ŀ� ������ �Ǵ�.

SELECT
    DEPT_CD,
     COUNT(*) AS "�μ��� ������"
    ,MAX(BIRTH_DE) AS "�μ� ����"
    ,MIN(BIRTH_DE) AS "�μ� ������"
FROM tb_emp
GROUP BY DEPT_CD
HAVING COUNT(*)>=2
ORDER BY DEPT_CD
;

--������� �޿��� ���� ���� ���� �׼�, ���� ���� ���� �׼�, ��վ׼� ��ȸ 
SELECT * FROM TB_SAL_HIS
ORDER BY EMP_NO, PAY_DE;  --EMP_NO�� ������ �� ���� ���鳢���� PAY_DE�� ������

SELECT
    EMP_NO,
    MAX(PAY_AMT) AS "�ְ� ���ɾ�",
    MIN(PAY_AMT) AS "���� ���ɾ�",
  TO_CHAR( ROUND(AVG(pay_amt),2),'L999,999,999.99') AS "��� ���ɾ�"
FROM TB_SAL_HIS
GROUP BY EMP_NO
ORDER BY EMP_NO;



--��� �޿��� 470���� �̻��� ����� ��ȸ�ϰ� ���� 

SELECT
    EMP_NO,
    MAX(PAY_AMT) AS "�ְ� ���ɾ�",
    MIN(PAY_AMT) AS "���� ���ɾ�",
  TO_CHAR( ROUND(AVG(pay_amt),2),'L999,999,999.99') AS "��� ���ɾ�"
FROM TB_SAL_HIS
GROUP BY EMP_NO
HAVING AVG(pay_amt)>=4500000
ORDER BY EMP_NO;


-- 2019�� 1�Ⱓ ��� �޿��� 470���� �̻��� ����� ��ȸ�ϰ� ���� 
SELECT
    EMP_NO,
    MAX(PAY_AMT) AS "�ְ� ���ɾ�",
    MIN(PAY_AMT) AS "���� ���ɾ�",
  TO_CHAR( ROUND(AVG(pay_amt),2),'L999,999,999.99') AS "��� ���ɾ�"
FROM TB_SAL_HIS
WHERE PAY_DE BETWEEN '20190101' AND '20191231'
GROUP BY EMP_NO
HAVING AVG(pay_amt)>=4500000
ORDER BY EMP_NO;

-- 2019�� 1�Ⱓ ����� ������ �߰� ��ȸ
SELECT --5
    EMP_NO,
    MAX(PAY_AMT) AS "�ְ� ���ɾ�",
    MIN(PAY_AMT) AS "���� ���ɾ�",
    TO_CHAR( ROUND(AVG(pay_amt),2),'L999,999,999.99') AS "��� ���ɾ�",
    TO_CHAR( ROUND(SUM(pay_amt),2),'L999,999,999')  AS "����"
FROM TB_SAL_HIS  --1 
WHERE PAY_DE BETWEEN '20190101' AND '20191231' --2 
GROUP BY EMP_NO --3  having --4
ORDER BY EMP_NO;--6



--���� ORDER BY 
--ASC :������(�⺻��) // DESC: ������
--�׻� SELECT ���� �� �������ٿ� ��ġ
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


-- ���� �� �� ��Ī�� �� �� �ִ�. 
SELECT
    EMP_NO AS ENO, 
    EMP_NM AS ENM, 
    ADDR 
FROM TB_EMP
ORDER BY ENO DESC;



SELECT
    emp_nm
    --,COUNT(emp_no) as cnt count�� ���� 1�ุ ���´�  �Ϲ� �÷������� ��� �Ѵ�.  group by�� ���� 
FROM tb_emp




