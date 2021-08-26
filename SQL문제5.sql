-- # 실습 문제
-- 1. employees, departments테이블을 INNER JOIN해서
--    first_name, department_id, department_name을 조회하세요.
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
-- 2. employees, departments테이블을 NATURAL JOIN해서
--    first_name, department_id, department_name을 조회하세요.

SELECT
    E.first_name, department_id, d.department_name --잘 안쓴다.
FROM employees E 
NATURAL join departments D --내추럴 조인 문제점 똑같은 컬럼이 복수있으면 and로 연결한다.
;

SELECT
    E.first_name, department_id, d.department_name
FROM employees E  
join departments D 
using ( department_id)
;

-- 3. employees, departments테이블을 JOIN ON을 사용해서
--    first_name, department_id, department_name을 조회하세요.

SELECT
    E.first_name, d.department_id, d.department_name
FROM employees E  
join departments D
on d.department_id = e.department_id
;