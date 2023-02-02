/*
    테이블
    1. 데이버베이스의 가장 대표적인 객체이다.
    2. 데이터를 보관하는 객체이다.
    3. 표 형식으로 데이터를 보관한다.
    4. 테이블 기본 용어
        1) 열 : column, 속성(attribute), 필드(field)
        2) 행 : row, 객체(entity), 레코드(record)
*/

/*
    오라클의 데이터 타입
    1. CHAR(size) : 고정 길이 문자 타입(size : 1 ~ 2000바이트) 모두가 같은 길이의 값을 가지고 있을때(예: 주민등록번호 등) / string으로 보면됨
    2. VARCHAR2(size) : 가변 길이 문자 타입(size : 1 ~ 4000바이트) / (예: 각자의 집 주소 등)  여러개의 CHAR타입으로 보면됨
    3. DATE : 날짜/시간 타입 (Java.sql에 Datte와 매칭하기 위해)
    4. TIMESTAMP : 날짜/시간 타입(좀 더 정밀) (Java.sql TimeStamp와 매칭하기 위해)
    5. NYMBER(p,s) : 정밀도(p)/(숫자를 몇자리를 표시할건지), 스케일(s)/(소수점을 몇라지를 표시할건지)로 표현하는 숫자타입
        1) 정밀도 : 정수부와 소수부를 모두 포함하는 전체 유효숫자가 몇 개 인가?
        2) 스케일 : 소수부와 전체 유효 숫자가 몇 개 인가?
        예시)
            (1) NUMBER : 최대 38자리 숫자를 표현 할 수 있음(size : 22바이트)
            (2) NUMBER(3) : 정수부가 최대 3자리인 숫자(최대999)
            (3) NUMBER(5,2) : 최대 전체 5자리, 소수부 2자리(123.45)
            (4) NUMBER(2,2) : 1 미만의 소수부 2자리인 실수(0.15) /정수부의 0은 유효한 숫자로 보지 않는다(앞뒤 불필요한 0은 자릿수에 포함X) .15 > 숫자 2자리
*/ 
/*
    제약조건(Constraint)
    1. 널
        1) NULL 또는 생략(이름이 비어있어도 상관 없다)
        2) NOT NULL 
    2. 중복 데이터 방지
        UNIQUE
    3. 값의 제한(PRICE 예: 음수, 소수점등)
        CHECK
*/


-- 예시 테이블
DROP TABLE PRODUCT;
CREATE TABLE PRODUCT( --값이 필요한경우 not null셋팅함
    CODE         VARCHAR2(2 BYTE) NOT NULL UNIQUE, -- NOT NULL(이칼럼은 값이 필요하다! UNIQUE 중복데이터 방지!)자바에선 String.code와 동일
    MODEL        VARCHAR2(10 BYTE), 
    CATEGORY     VARCHAR2(5 BYTE),
    PRICE        NUMBER             CHECK(PRICE >=0), -- 자리수 설정안하면 모든숫자라는 뜻(소수점X) / PRICE 가격이 0이상이다
    AMOUNT       NUMBER(2)          CHECK(AMOUNT >=0 AND AMOUNT <= 100), -- 정수 타입 최대 2자리
    MANUFACTURED DATE -- 제조일(MANUFACTURED)
);
    