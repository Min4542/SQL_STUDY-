
-- OUTER JOIN 추가 예제 
SELECT * FROM job_history ORDER BY employee_id;

-- 모든 사원의 정보를 조회할건데 혹시 직무 변동 이력이 있으면 함께 조회하고 싶다.
SELECT 
    e.employee_id, e.first_name, e.hire_date ,e.job_id AS "CURRENT JOB"
    , j.start_date, j.end_date , j.job_id AS "LAST JOB"
FROM employees E 
LEFT JOIN job_history J
ON E.employee_id = J.employee_id
ORDER BY J.employee_id
;



-- 실습문제 (JOIN)
-- 1. 사원번호가 103번인 사원의 이름(employee_name)과 매니저 이름(manager_name)을 출력하세요.
SELECT
    A.employee_id, A.first_name, A.manager_id ,b.first_name AS "MANAGER NAME"
FROM employees A
JOIN employees B
ON a.manager_id =B.employee_id
WHERE a.employee_id =103
ORDER BY a.employee_id
;

-- 2. 모든 사원의 first_name과 department_name, 
--    street_address + ',' + city + ',' + state_province를 address라는 alias로 조회하세요.
-- employees, departments, locations 3개 조인
SELECT
    E.first_name, D.department_name , address.street_address || ',' || address.city || ',' || address.state_province AS "address"
FROM employees E 
LEFT  JOIN  departments D 
ON (E.department_id = D.department_id)
LEFT JOIN locations address
ON (address.location_id = D.location_id)
;
-- 3. 103번 사원의 first_name과 department_name, 
--    street_address + ',' + city + ',' + state_province를 address라는 alias로 
--    지정하여 조회하세요.
SELECT
    E.first_name , D.department_name , address.street_address || ',' || address.city || ',' || address.state_province AS "address"
FROM employees E JOIN  departments D 
ON (E.department_id = D.department_id)
JOIN locations address
ON (address.location_id = D.location_id)
WHERE e.employee_id =103;
-- 4. 부서 이름이 IT로 시작하는 사원의 first_name과 department_name, 
--    street_address + ',' + city + ',' + state_province를 address라는 alias로 
--    지정하여 조회하세요.
 SELECT
    E.first_name , D.department_name , address.street_address || ',' || address.city || ',' || address.state_province AS "address"
FROM employees E JOIN  departments D 
ON (E.department_id = D.department_id)
JOIN locations address
ON (address.location_id = D.location_id)
WHERE d.department_name LIKE  'IT%';

-- 5. jobs테이블에서 모든 직무 id(job_id)와 직무명(job_title)을 조회하는데 
--    만약 직무변동 이력이 있다면 해당 이력 정보 
-- (start_date, end_date, job_id, employee_id, first_name, department_id, department_name)
--    도 함께 조회하세요.

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

































