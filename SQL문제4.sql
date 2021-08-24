-- �ǽ�����

-- 1. employees���̺��� �� ����� �μ��� �μ� ��ȣ(department_id)�� ��� �޿�(salary)�� ��ȸ�ϼ���. 
SELECT --oracle�� null�� ���� ũ�� ����
         nvl (department_id,0) as dep_id
        ,round (AVG(salary),2) as avg_salary
FROM employees
GROUP BY department_id
order by dep_id
;

-- 2. employees���̺��� �μ��� �μ� ��ȣ(department_id)�� �μ��� �� ��� ���� ��ȸ�ϼ���.

SELECT
         nvl (department_id,0) as dep_id
        ,COUNT(employee_id) as total_count
FROM employees
GROUP BY department_id
order by dep_id
;

-- 3. employees���̺��� �μ��� �޿� ����� 8000�� �ʰ��ϴ� �μ��� �μ���ȣ�� �޿� ����� ��ȸ�ϼ���.
SELECT
    department_id,
    round(avg(salary),2) as avg_sal
FROM employees
GROUP BY department_id
HAVING AVG(salary) >8000
ORDER BY department_id
;
-- 4. employees���̺��� �޿� ����� 8000�� �ʰ��ϴ� �� ����(job_id)�� ���Ͽ� 
--    ���� �̸�(job_id)�� SA�� �����ϴ� ����� �����ϰ� ���� �̸��� �޿� ����� 
--    �޿� ����� ���� ������ �����Ͽ� ��ȸ�ϼ���.
SELECT
    job_id,
    ROUND(avg(salary),2)  as avg_sal
FROM employees
WHERE job_id not like 'SA%'
GROUP BY job_id
HAVING avg(salary) > 8000
ORDER BY avg_sal desc
;









