/*
    KEY 제약조건
    1. 기본키(PK:Psimary Key)
        1) 개체무결성
        2) PK는 NOT NULL + UNIQE 해야한다.
    2. 외래키(FK:Foreign Key)
        1) 참조무결성
        2) FK는 참조 하는 값만 가질 수 있다.
*/

/*
    일대다(1:M) 관계
    1. PK와 FK를 가진 테이블 간의 관계이다.
        1) 부모 테이블 : 1, PK를 가진 테이블
        2) 자식 테이블 : M, FK를 가진 테이블
    2. 생성과 삭제 규칙
        1) 생성 규칙 : "반드시" 부모 테이블을 먼저 생성한다.
        2) 삭제 규칙 : "반드시" 자식 테이블을 먼저 삭제한다.
*/
-- 순서
-- 부모테이블 생성 > 자식테이블 생성 > 테이블 삭제

-- 테이블 삭제(삭제테이블은 생성테이블과 반대로) // ●●●생성과 삭제는 반대로●●●
DROP TABLE ORDER_TBL;-- 자식 테이블
DROP TABLE PRODUCT_TBL;-- 부모 테이블

-- 제품 테이블(부모 테이블)생성
CREATE TABLE PRODUCT_TBL (
    PROD_NO NUMBER, --NOT NULL UNIQUE PRIMARY KEY /오류발생/NOT NULL은 생략 가능
    PROD_NAME VARCHAR2(10 BYTE),
    PROD_PRICE NUMBER,
    PROD_STOK NUMBER,
    CONSTRAINT PK_PROD PRIMARY KEY(PROD_NO)
);

-- 주문 테이블(자식 테이블)생성
CREATE TABLE ORDER_TBL (
    ORDER_NO NUMBER NOT NULL,
    USER_ID VARCHAR2(10 BYTE),
    PROD_NO NUMBER,-- 외래키(누굴 참조하는가)REFERENCES PRODUCT_TBL을(PROD_NO에 참조한다)
    ORDER_DATE DATE,
    CONSTRAINT PK_ORDER PRIMARY KEY(ORDER_NO),
    CONSTRAINT FK_ORDER_PROD FOREIGN KEY(PROD_NO) REFERENCES PRODUCT_TBL(PROD_NO)
);

/*
    제약조건 테이블
    1. SYS, SYTEM 관리 계정으로 접속해서 확인하다.
    2.종류
        1) ALL_CONSTRAINTS 모든 제약조건
        2) USER_CONSTRAINTS 사용자 제약조건
        3) DBA_CONSTRAINTS 관리자 제약조건
*/

-- 테이블의 구조를 확인하는 쿼리문(설명)
-- DESCRIBE ALL_CONSTRAINTS;
-- SELECT * FROM ALL_CONSTRAINTS WHERE CONSTRAINT_NAKE LIKE 'PK%';


