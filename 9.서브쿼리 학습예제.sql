

--# ������ �������� 
--���������� ��ȸ ����� 1�� ������ ��� 

--�μ���ȣ�� 100004���� �μ��� ��� ������� ��ȸ 

SELECT
    *    
FROM TB_EMP
WHERE DEPT_CD= '100004'
;

--�̳��� �����ִ� �μ��� ��� ������� ��ȸ

SELECT * FROM TB_EMP;

SELECT
    *    
FROM TB_EMP
WHERE DEPT_CD IN (

SELECT DEPT_CD FROM TB_EMP WHERE EMP_NM = '�̰���'

) --�̳��� �����ִ� �μ� �ڵ� �̰� �������� 
;


--20200525�� ���� �޿��� ȸ���� 20200525 ��ü ��� �޿����� ���� ������� ���� ��ȸ

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
; --������ ���� ���� ���� �÷�


-- #���� �� �������� 
--�������� ��ȸ �Ǽ��� ���� ���� ��

--�ѱ������ͺ��̽���������� �߱��� �ڰ����� ������ �ִ� �����ȣ�� ���� �ڰ��� ������ ��ȸ
SELECT * FROM tb_certi WHERE issue_insti_nm = '�ѱ������ͺ��̽������';

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
                SELECT CERTI_CD FROM tb_certi WHERE issue_insti_nm = '�ѱ������ͺ��̽������'
                                )
        AND A.emp_no = B.emp_no
GROUP BY A.emp_no ,B.EMP_nm
ORDER BY A.emp_no
; --������ ���� ���� ���� �÷�



--# ���� �÷� �������� 

--�μ����� 2�� �̻��� �μ� �߿��� �� �μ��� ���� ���� ���� ����� ��������� ��ȸ 

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



--EXISTS ��

--�ּҰ� ������ �������� �ٹ��ϰ� �ִ� �μ����� ��ü������ ��ȸ
SELECT DISTINCT
    a.dept_cd , a.dept_nm
FROM TB_DEPT A , tb_emp B
WHERE a.dept_cd = b.dept_cd
    AND b.addr LIKE '%����%'
ORDER BY A.DEPT_CD
;

SELECT
    *
FROM tb_emp WHERE ADDR LIKE '%����%';

SELECT
    a.dept_cd , a.dept_nm
FROM tb_dept A
WHERE EXISTS(
                    SELECT
                        1
                    FROM tb_emp B
                    WHERE B.ADDR LIKE '%����%'
                        AND a.dept_cd = b.dept_cd
)
;


 SELECT
        1
        FROM tb_emp
        WHERE ADDR LIKE '%����%';



--#��Į�� �������� (SELECT���� ���� ��������)

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



--#�ζ��� �� (FROM�� �ȿ� �ִ� ��������)

SELECT
 x.emp_nm , x.dept_nm
FROM (SELECT
    a.emp_no , a.emp_nm 
    , b.dept_nm
    ,a.addr , A.BIRTH_DE , a.sex_cd
FROM TB_EMP A
JOIN tb_dept B
ON a.dept_cd = b.dept_cd) X --���� ���̺� 
;

























