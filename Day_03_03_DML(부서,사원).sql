/*
    DML
    1. Data manipulation Language
    2. 데이터 조작어
    3. 데이터(행, Row)를 삽입, 수정, 삭제할 때 사용하는 언어이다.
    4. DML 사용 후에는 COMMIT 또는 ROLLBACK 처리를 해야한다.★
    5. 종류
        1) 삽입 : INSERT INTO VALUES
        2) 수정 : UPDATE SET WHERE
        3) 삭제 : DELETE FROM WHERE
     - 트랜잭션이 필요한 SQL
        COMMIT 필요 - INSERT,UPDATE,DELETE 
*/

-- 참고. DML을 INSERT,UPDATE,DELETE + SELECT로 보는 경우도 있다.

-- 테이블 삭제
DROP TABLE EMPLOYEE_TBL;
DROP TABLE DEPARTMENT_TBL;

-- DEPARTMENT_TBL 테이블 생성
CREATE TABLE DEPARTMENT_TBL (
    DEPT_NO   NUMBER            NOT NULL,
    DEPT_NAME VARCHAR2(15 BYTE) NOT NULL,
    LOCATION  VARCHAR2(15 BYTE) NOT NULL
);

-- EMPLOYEE_TBL 테이블 생성
CREATE TABLE EMPLOYEE_TBL (
    EMP_NO    NUMBER            NOT NULL,
    NAME      VARCHAR2(20 BYTE) NOT NULL,
    DEPART    NUMBER            NULL,
    POSITION  VARCHAR2(20 BYTE) NULL,
    GENDER    CHAR(2 BYTE)      NULL,
    HIRE_DATE DATE              NULL, 
    SALARY    NUMBER            NULL
);

-- 기본키
ALTER TABLE DEPARTMENT_TBL
    ADD CONSTRAINT PK_DEPT PRIMARY KEY(DEPT_NO);
ALTER TABLE EMPLOYEE_TBL
    ADD CONSTRAINT PK_EMP PRIMARY KEY(EMP_NO);

-- 외래키
ALTER TABLE EMPLOYEE_TBL
    ADD CONSTRAINT FK_EMP_DEPT FOREIGN KEY(DEPART) 
        REFERENCES DEPARTMENT_TBL(DEPT_NO)
            ON DELETE SET NULL;

-- 시퀀스(번호 생성기) 삭제
DROP SEQUENCE DEPARTMENT_SEQ;

-- 시퀀스(번호 생성기) 만들기
CREATE SEQUENCE DEPARTMENT_SEQ -- DEPARTMENT_SEQ이름은 사용자가 임의정의 하는것, 아무거나 만들어도 상관없음
    INCREMENT BY 1 -- 1씩 증가하는 번호를 만든다. (생략가능) (옵션추가)
    START WITH 1   -- 1부터 번호를 만든다. (생략가능)
    NOMAXVALUE     -- 번호의 상한선이 없다(최대값이 없음). (생략가능) MAXVALUE 100 : 번호를 100까지만 생성한다.
    NOMINVALUE     -- 번호의 하한선이 없다(최소값이 없음). (생략가능) MINVALUE 100 : 번호의 최소값이 100이다.
    NOCYCLE        -- 번호 순환이 없다 (생략가능)                            CYCLE : 번호가 MAXVALUE에 도달하면 다음 번호는 MINVALUE이다.
    NOCACHE        -- 메모리 캐시를 사용하지 않는다.★★★                      CACHE : 메모리 캐시를 사용한다(사용하지 않는 것이 좋다.) - (번호를 미리 뽑아두고,사용 번호가 점프해버림)
    ORDER          -- 번호 건너뛰기가 없다.                                 NOORDER: 번호 건너뛰기가 가능하다.
;

                                -- 번호를 처음 뽑으면 1번나옴
-- 시퀀스에서 번호 뽑는 함수: NEXTVAL > 쓰기만 하면 1번이 시작되며, 이후 순차적으로 번호 증가함
-- 시퀀스 이름.NEXTVAL / 예) DEPARTMENT_SEQ.NEXTVAL
-- SELECT DEPARTMENT_SEQ.NEXTVAL FROM DUAL; -- (확인 끝나면 사용하지말기, 번호표 뽑아서 버리는짓!)오라클에서는 테이블에 없는 데이터를 조회하려면 DAUL 테이블을 사용한다.
--     └   조회내용  ┘         └아무의미 없으나 적어야 실행됨 
-- SELECT SEQ.NEXTVAL; > MYSQL
-- 데이터 입력하기(Parent Key를 먼저 입력해야한다.)
INSERT INTO DEPARTMENT_TBL(DEPT_NO, DEPT_NAME, LOCATION) VALUES(DEPARTMENT_SEQ.NEXTVAL,'영업부','대구'); -- 1번째 뽑기
INSERT INTO DEPARTMENT_TBL(DEPT_NO, DEPT_NAME, LOCATION) VALUES(DEPARTMENT_SEQ.NEXTVAL,'인사부','서울'); -- 2번째 뽑기 
INSERT INTO DEPARTMENT_TBL(DEPT_NO, DEPT_NAME, LOCATION) VALUES(DEPARTMENT_SEQ.NEXTVAL,'총무부','대구'); -- 3번째 뽑기 
INSERT INTO DEPARTMENT_TBL(DEPT_NO, DEPT_NAME, LOCATION) VALUES(DEPARTMENT_SEQ.NEXTVAL,'기획부','서울'); -- 4번째 뽑기
COMMIT;


-- 시퀀스(번호 생성기) 삭제
DROP SEQUENCE EMPLOYEE_SEQ;

-- 시퀀스(번호 생성기) 만들기
CREATE SEQUENCE EMPLOYEE_SEQ
        START WITH 1001
        NOCACHE;

-- 사원(EMPLOYEE) INSERT 데이터 입력하기
INSERT INTO EMPLOYEE_TBL VALUES(EMPLOYEE_SEQ.NEXTVAL, '구창민',1,'과장','M','95-05-01',5000000); -- 날짜 - , /  둘다 상관 없음
INSERT INTO EMPLOYEE_TBL VALUES(EMPLOYEE_SEQ.NEXTVAL, '김민서',1,'사원','M','17-09-01',2500000);
INSERT INTO EMPLOYEE_TBL VALUES(EMPLOYEE_SEQ.NEXTVAL, '이은영',2,'부장','M','90/09/01',5500000);
INSERT INTO EMPLOYEE_TBL VALUES(EMPLOYEE_SEQ.NEXTVAL, '한성일',2,'과장','M','93/04/04',5000000);
COMMIT;

