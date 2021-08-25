
-- 조인 기초 
SELECT
    emp_no,emp_nm,dept_cd
FROM tb_emp
;



SELECT
    E.emp_no
    , E.emp_nm
    , E.dept_cd
    , D.dept_nm
FROM tb_emp E, tb_dept D
where e.dept_cd = d.dept_cd --조인 조건 
;


--자격증 정보 테이블 
SELECT
    *
FROM tb_certi;


--사원이 취득한 자격증 정보 테이블 
SELECT
    *
FROM tb_emp_certi;


SELECT
    e.emp_no,e.emp_nm,
    ec.certi_cd,ec.acqu_de
FROM tb_emp E, tb_emp_certi EC
where e.emp_no = ec.emp_no
;

SELECT
    c.certi_cd , c.certi_nm , c.issue_insti_nm,
    ec.acqu_de , ec.emp_no
FROM tb_certi C, tb_emp_certi EC
where c.certi_cd = ec.certi_cd
;


-- 3개의 테이블 조인 
SELECT
    a.emp_no,a.emp_nm,b.certi_cd
    ,b.certi_nm, c.acqu_de
FROM tb_emp A, tb_certi B, tb_emp_certi  C
where a.emp_no = c.emp_no 
            and b.certi_cd = c.certi_cd
; 


SELECT
    a.emp_no,a.emp_nm,b.certi_cd
    ,b.certi_nm, c.acqu_de
FROM tb_emp A, tb_certi B, tb_emp_certi  C
where a.emp_no = c.emp_no 
            and b.certi_cd = c.certi_cd
            and a.emp_nm like '이%'
            and c.acqu_de BETWEEN '20190101' and '20191231'

; 




--조인 예제

CREATE TABLE TEST_A (
    id NUMBER(10) PRIMARY KEY ,
    content VARCHAR2(200)
); 

CREATE TABLE TEST_B (
    b_id NUMBER(10) PRIMARY KEY ,
    reply VARCHAR2(100),
    a_id NUMBER(10) --FK
); 

INSERT INTO test_a VALUES (1,'aaa');
INSERT INTO test_a VALUES (2,'bbb');
INSERT INTO test_a VALUES (3,'ccc');

INSERT INTO test_b VALUES (1,'ㄱㄱㄱ',1);
INSERT INTO test_b VALUES (2,'ㄴㄴㄴ',1);
INSERT INTO test_b VALUES (3,'ㄷㄷㄷ',2);
INSERT INTO test_b VALUES (4,'ㄹㄹㄹ',3);


SELECT * FROM test_a;
SELECT * FROM test_b;


SELECT
    a.id ,  a.content , b.b_id , b.reply
FROM Test_A A, test_b B
where a.id = b.a_id 
;
--cross join : 조인 조건이 없을 때 전부 크로스해서 가져옴 














