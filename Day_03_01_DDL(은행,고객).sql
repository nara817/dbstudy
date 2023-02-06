/*
    DDL
    1. Data Definition Language
    2. 데이터 정의어
    3. 데이터베이스 객체(USER, TABLE squence, VIEW, INDEX 등)를 생성/수정/삭제하는 언어이다.
    4. 완료된 작업을 취소할 수 없다.(COMMIT 할 필요가 없다. ROLLBACK을 할 수 없다.)
    5. 종류
        1) CREAT : 생성
        2) ALTER : 수정(완성된 테이블의 칼럼이름 수정, 타입을 수정 할 경우 등) → CONSTRAINT 만들때는 제약조건이 없을 수있으며, 나중에 추가 할 수 있음
        3) DROP  : 삭제
*/
--테이블 삭제
DROP TABLE CUSTOMER_TBL;
DROP TABLE BANK_TBL;

-- BANK_TBL 테이블 생성
CREATE TABLE BANK_TBL (
    BANK_CODE VARCHAR2(20 BYTE)  NOT NULL, -- 기본키
    BANK_NAME VARCHAR2(30 BYTE),
    CONSTRAINT PK_BANK PRIMARY KEY(BANK_CODE)
);

-- CUSTOMER_TBL 테이블
CREATE TABLE CUSTOMER_TBL (
    NO       NUMBER            NOT NULL, -- 기본키
    NAME     VARCHAR2(30 BYTE) NOT NULL, -- 필수
    PHONE    VARCHAR2(30 BYTE) UNIQUE, -- 중복불가
    AGE      NUMBER            CHECK(AGD BETWEEN 0 AND 100),
    BANK_CODE VARCHAR2(20 BYTE), --외래키
    CONSTRAINT PK_CUSTOMER PRIMARY KEY(NO),
    CONSTRAINT FK_CUSTOMER_BANK FOREIGN KEY(BANK_CODE) REFERENCES BANK_TBL(BANK_CODE)
);

/*
    테이블 변경
    1. 칼럼 추가 : ALTER TABLE 테이블명 ADD 칼럼명(추가할) 데이터타입 [제약조건(생략가능)]
    2. 칼럼 삭제 : ALTER TABLE 테이블명 DROP COLUM 칼럼명
    3. 칼럼 수정 : ALTER TABLE 테이블명 MODIFY 칼럼명(기존에 있는 칼럼중) 데이터타입 [제약조건]
    4. 칼럼 이름 : ALTER TABLE 테이블명 RENAME COLUMN 기존 칼럼명 TO 신규칼럼명
    5. 테이블이름: ALTER TABLE 테이블명 RENAME TO 신규테이블명
*/

-- BANK_TBL 테이블에 연락처(BANK_TBL) 칼럼을 추가하시오.
ALTER TABLE BANK_TBL 
    ADD BANK_TEL VARCHAR2(20 BYTE) NOT NULL;

-- 2. CUSTOMER_TBL 테이블에서 나이(AGE) 칼럼을 삭제하시오.
ALTER TABLE CUSTOMER_TBL
    DROP COLUMN AGE;

-- 3. BANK_TBL  테이블에서 은행명(BANK_CODE) 칼럼의 데이터 타입을 VARCHAR2(15 BYTE)으로 변경하시오.
ALTER TABLE BANK_TBL
    MODIFY BANK_NAME VARCHAR2(15 BYTE);

-- 4. CUSTOMER_TBL 테이블에서 고객명(NAME) 칼럼의 이름을 CUST_NAME으로 변경하시오.
ALTER TABLE CUSTOMER_TBL
    RENAME COLUMN NAME TO CUST_NAME;
    
-- 개인실습.

-- 5. COUSTOMER_TBL 테이블에 GRADE 칼럼을 추가하시오.
-- GRADE 칼럼은 'VIP', 'GOLD', 'SILVER', 'BEONZE' 중 하나의 값만 가질 수 있도록 CHECK 제약조건을 지정하시오.
ALTER TABLE CUSTOMER_TBL
    ADD CUSTOMER_TBL GRADE CHECK('VIP', 'GOLD', 'SILVER', 'BEONZE');

-- 6. BANK_TBL 테이블의 BANK_NAME 칼럼에 NOT NULL 제약조건을 추가하시오.
ALTER TABLE BANK_TBL
    ADD BANK_TBL BANK_NAME VARCHAR2 NOT NULL;
-- 7. COUSTOMER_TBL 테이블에 NO 칼럼의 이름을 CUST_NO로 변경하시오.
ALTER TABLE COUSTOMER_TBL
    RENAME COLUMN NO TO CUST_NO;

-- 8. CUSTOMER_TBL 테이블의 PHONE 칼럼을 삭제하시오.
ALTER TABLE COUSTOMER_TBL
    DROP COLUMN PHONE;
    
-- 9. CUSTOMER_TBL 테이블의 CUST_NAME 칼럼의 NOT NULL 제약조건을 NULL 제약조건으로 변경하시오.
ALTER TABLE COUSTOMBER_TBL
    ADD COUSTOMBER_TBL CUST_NAME NULL;