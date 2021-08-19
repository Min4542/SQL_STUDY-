CREATE TABLE BOARD (
    --컬럼 추가 
    BNO NUMBER(10),
    TITLE VARCHAR2(200) NOT NULL ,
    CONTENT VARCHAR2(2000),
    WRITER VARCHAR2(50) NOT NULL,
    REG_DATE DATE NOT NULL
    
);

--DML : 데이터 조작어 
--SELECT, INSERT, UPDATE, DELETE

--데이터 삽입 
INSERT INTO BOARD
       (BNO, TITLE, CONTENT, WRITER, REG_DATE)
VALUES
        (1, '안녕','재미있는 내용', '마이콜', SYSDATE);
        
        

--NOT NULL 제약조건에 걸림(TITLE)
INSERT INTO BOARD
       (BNO,  CONTENT, WRITER, REG_DATE)
VALUES
        (1, '재미있는 내용', '마이콜', SYSDATE);
        
        
--PK 제약 조건으로 글번호 중복 
 INSERT INTO BOARD
       (BNO, TITLE, WRITER, REG_DATE)
VALUES
        (1, '새로운 글이야', '마이콜', SYSDATE);
        
        
        
INSERT INTO BOARD
       (BNO, TITLE, WRITER, REG_DATE)
VALUES
        (2, '새로운 글이야', '마이콜', SYSDATE);
        
        
        
--테이블의 모든 컬럼을 순서대로 채울 경우 컬럼지정을 생략 가능 
INSERT INTO BOARD
       --컬럼을 다 넣으면 생략 가능
VALUES
        (3, '3번 글','글 내용 ㅇㄴㅇㄴㅇ', '둘리', SYSDATE);
        
          SELECT * FROM BOARD;
        
              COMMIT;
              
              
--데이터 수정 
UPDATE BOARD 
SET content = '수정된 철수'
WHERE BNO = 2;
        
UPDATE BOARD
SET title = '수정된 제목'
,content = '수정수정'
WHERE bno =1;
        
--UPDATE 절에서 WHERE가 생략되면 전체수정되므로 주의 
UPDATE BOARD
SET content = '메롱';
        
--데이터 삭제 
DELETE FROM BOARD
WHERE bno = 2;

ROLLBACK;

COMMIT;

INSERT INTO BOARD
       (BNO, TITLE, CONTENT, WRITER, REG_DATE)
VALUES
        (4, '임시 테스트','테스트', '박테스트', SYSDATE);


SELECT * FROM board;

ROLLBACK;

INSERT INTO BOARD
       (BNO, TITLE, CONTENT, WRITER, REG_DATE)
VALUES
        (4, '임시 테스트','테스트', '박테스트', SYSDATE);
        ROLLBACK;
        
INSERT INTO BOARD
       (BNO, TITLE, CONTENT, WRITER, REG_DATE)
VALUES
        (4, '임시 테스트','테스트', '박테스트', SYSDATE);
ROLLBACK;

INSERT INTO BOARD
       (BNO, TITLE, CONTENT, WRITER, REG_DATE)
VALUES
        (4, '임시 테스트','테스트', '박테스트', SYSDATE);
COMMIT;


--전체 데이터 삭제-- 
--1. WHERE절을 생략한 DELETE절 (ROLLBACK 가능 )
DELETE FROM BOARD;

SELECT * FROM BOARD;
ROLLBACK;
        
--2. TRUNCATE TABLE 을 사용한 방법 (ROLLBACK 불가능 / 테이블 구조는 삭제되지 않음)--
TRUNCATE TABLE BOARD;

--3. DROP TABLE (ROLLBACK 불가능 / 테이블 구조도 삭제 )--
DROP TABLE BOARD;


        
        

          
    