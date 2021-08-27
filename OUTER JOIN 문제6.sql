
-- OUTER JOIN �߰� ���� 
SELECT * FROM job_history ORDER BY employee_id;

-- ��� ����� ������ ��ȸ�Ұǵ� Ȥ�� ���� ���� �̷��� ������ �Բ� ��ȸ�ϰ� �ʹ�.
SELECT 
    e.employee_id, e.first_name, e.hire_date ,e.job_id AS "CURRENT JOB"
    , j.start_date, j.end_date , j.job_id AS "LAST JOB"
FROM employees E 
LEFT JOIN job_history J
ON E.employee_id = J.employee_id
ORDER BY J.employee_id
;



-- �ǽ����� (JOIN)
-- 1. �����ȣ�� 103���� ����� �̸�(employee_name)�� �Ŵ��� �̸�(manager_name)�� ����ϼ���.
SELECT
    A.employee_id, A.first_name, A.manager_id ,b.first_name AS "MANAGER NAME"
FROM employees A
JOIN employees B
ON a.manager_id =B.employee_id
WHERE a.employee_id =103
ORDER BY a.employee_id
;

-- 2. ��� ����� first_name�� department_name, 
--    street_address + ',' + city + ',' + state_province�� address��� alias�� ��ȸ�ϼ���.
-- employees, departments, locations 3�� ����
SELECT
    E.first_name, D.department_name , address.street_address || ',' || address.city || ',' || address.state_province AS "address"
FROM employees E 
LEFT  JOIN  departments D 
ON (E.department_id = D.department_id)
LEFT JOIN locations address
ON (address.location_id = D.location_id)
;
-- 3. 103�� ����� first_name�� department_name, 
--    street_address + ',' + city + ',' + state_province�� address��� alias�� 
--    �����Ͽ� ��ȸ�ϼ���.
SELECT
    E.first_name , D.department_name , address.street_address || ',' || address.city || ',' || address.state_province AS "address"
FROM employees E JOIN  departments D 
ON (E.department_id = D.department_id)
JOIN locations address
ON (address.location_id = D.location_id)
WHERE e.employee_id =103;
-- 4. �μ� �̸��� IT�� �����ϴ� ����� first_name�� department_name, 
--    street_address + ',' + city + ',' + state_province�� address��� alias�� 
--    �����Ͽ� ��ȸ�ϼ���.
 SELECT
    E.first_name , D.department_name , address.street_address || ',' || address.city || ',' || address.state_province AS "address"
FROM employees E JOIN  departments D 
ON (E.department_id = D.department_id)
JOIN locations address
ON (address.location_id = D.location_id)
WHERE d.department_name LIKE  'IT%';

-- 5. jobs���̺��� ��� ���� id(job_id)�� ������(job_title)�� ��ȸ�ϴµ� 
--    ���� �������� �̷��� �ִٸ� �ش� �̷� ���� 
-- (start_date, end_date, job_id, employee_id, first_name, department_id, department_name)
--    �� �Բ� ��ȸ�ϼ���.

SELECT
    J.job_id , J.job_title,
    H.start_date, H.end_date, H.job_id, H.employee_id,
    E.department_id,  d.department_name
FROM jobs J
LEFT JOIN job_history H
ON J.job_id = H.job_id
LEFT JOIN employees E
ON h.employee_id = e.employee_id
LEFT JOIN  departments D
ON E.department_id = D.department_id
;

































