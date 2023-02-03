/*
STUDENT 학생
    STU_NO 학번 PK
    STU_NAME 이름
    STU_AGE 나이

SUBJECT 과목
    SJT_NO 과목코드 PK
    SJY_NAME 과목명
    PROFESSOR 교수명

ENROLL 수강신청
    ENR_NO 신청번호 PK
    STU_NO 학번 FK
    SJT_NO 과목코드 FK
    
순서: 과목, 학생, 수강신청 생성 후 > 삭제 테이블 생성필요(삭제테이블은 생성 테이블 상단에 위치)
*/

CREAT TABLE STUDENT_TBL (
    SUT_NO VARCHAR2(5 BYTE) NOT NULL,
    STU_NAME VARCHAR2(15 BYTE) NULL,
    STU_AGE NUMBER(3) NULL,
    CONSTRAINT PK_STUDNET PRIMARY KEY(STU_NO)

);