
SELECT first_name, last_name, salary
FROM employees
WHERE LOWER(last_name) = 'king' ;


-- # �ǽ����� 
-- 1. employees ���̺��� ��� ����� first_name�� first_name�� ���� ���� ��ȸ�ϼ���.
SELECT
   first_name,
    LENGTH(first_name) AS "�̸� ���ڼ�"
FROM employees;
-- 2. employees ���̺��� first_name�� LAST_name�� �� ���� ������ �̸��� ��ȸ�ϼ���.
SELECT
  first_name,
  last_name,
  CONCAT( first_name, last_name) AS "FULL NAME"
FROM employees;
-- 3. employees ���̺��� job_id�� it_prog�� ����� first_name�� salary�� ����ϼ���.
SELECT
RPAD( SUBSTR(first_name, 1 ,3), LENGTH(first_name), '*') AS NAME,
LPAD(salary,10,'*') AS salary
FROM employees
WHERE LOWER(job_id) = 'it_prog' OR UPPER(JOB_ID)='IT_PROG';

--  ����1 ) ���ϱ� ���� ���� �ҹ��ڷ� �Է��� ��!
--  ����2 ) �̸��� �� 3���ڱ����� ����ϰ� �������� *�� ��ŷ�� ��. �� ���� ��Ī�� name�Դϴ�.
--  ����3 ) �޿��� ��ü 10�ڸ��� ����ϵ� �������ڸ��� *�� ����մϴ�. �� ���� ��Ī�� salary�Դϴ�.