

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