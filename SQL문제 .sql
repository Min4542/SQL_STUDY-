-- �ǽ� 1 
-- 1. employees���̺��� first_name, last_name, salary�� ��ȸ�ϼ���.

-- 2. departments���̺��� department_id, department_name, manager_id, location_id�� ��ȸ�ϼ���.

-- 3. employees���̺��� first_name�� ��Ī�� '�̸�', salary�� ��Ī�� '�޿�'�� ��ȸ�ϼ���.

-- 4. employees���̺��� ��������� first_name + last_name + '�� �޿��� $' + salary + '�Դϴ�.' 
--    �� ���·� �����Ͽ� '�������' ��� ��Ī�� �ο��Ͽ� �ϳ��� �÷����� ��ȸ�ϼ���.

-- 5. employees���̺��� department_id�� �ߺ��� �����Ͽ� ��ȸ�ϼ���.

    SELECT
    first_name, last_name, salary
    FROM employees;
    
    SELECT
        department_id, department_name, manager_id, location_id
    FROM departments;
    
     SELECT
    first_name "�̸�"
    , salary "�޿�"
    FROM employees;
    
     SELECT
    first_name|| last_name || '�� �޿��� $' || salary || '�Դϴ�.' "�������"
    FROM employees;
    
    
    SELECT DISTINCT
    department_id
    FROM employees;
    