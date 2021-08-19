-- 실습 1 
-- 1. employees테이블에서 first_name, last_name, salary를 조회하세요.

-- 2. departments테이블에서 department_id, department_name, manager_id, location_id를 조회하세요.

-- 3. employees테이블에서 first_name의 별칭을 '이름', salary의 별칭을 '급여'로 조회하세요.

-- 4. employees테이블의 사원정보를 first_name + last_name + '의 급여는 $' + salary + '입니다.' 
--    의 형태로 연결하여 '사원정보' 라는 별칭을 부여하여 하나의 컬럼으로 조회하세요.

-- 5. employees테이블에서 department_id를 중복을 제거하여 조회하세요.

    SELECT
    first_name, last_name, salary
    FROM employees;
    
    SELECT
        department_id, department_name, manager_id, location_id
    FROM departments;
    
     SELECT
    first_name "이름"
    , salary "급여"
    FROM employees;
    
     SELECT
    first_name|| last_name || '의 급여는 $' || salary || '입니다.' "사원정보"
    FROM employees;
    
    
    SELECT DISTINCT
    department_id
    FROM employees;
    