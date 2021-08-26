-- # �ǽ� ����
-- 1. employees, departments���̺��� INNER JOIN�ؼ�
--    first_name, department_id, department_name�� ��ȸ�ϼ���.
SELECT COUNT(*)FROM employees;



SELECT
    E.first_name, D.department_id, D.department_name
FROM employees E, departments D
where d.department_id = e.department_id
;


SELECT
    E.first_name, D.department_id, D.department_name
FROM employees E    
JOIN departments D
on d.department_id = e.department_id
;
-- 2. employees, departments���̺��� NATURAL JOIN�ؼ�
--    first_name, department_id, department_name�� ��ȸ�ϼ���.

SELECT
    E.first_name, department_id, d.department_name --�� �Ⱦ���.
FROM employees E 
NATURAL join departments D --���߷� ���� ������ �Ȱ��� �÷��� ���������� and�� �����Ѵ�.
;

SELECT
    E.first_name, department_id, d.department_name
FROM employees E  
join departments D 
using ( department_id)
;

-- 3. employees, departments���̺��� JOIN ON�� ����ؼ�
--    first_name, department_id, department_name�� ��ȸ�ϼ���.

SELECT
    E.first_name, d.department_id, d.department_name
FROM employees E  
join departments D
on d.department_id = e.department_id
;