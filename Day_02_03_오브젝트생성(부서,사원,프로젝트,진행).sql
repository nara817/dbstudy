-- 테이블 삭제
DROP TABLE PROCEEDING_TBL;
DROP TABLE PROJECT_TBL;
DROP TABLE EMPLOYEE_TBL;
DROP TABLE DEPARTMENT_TBL;

-- 부서 테이블 생성
CREATE TABLE DEPARTMENT_TBL (
    DEPT_NO       VARCHAR2(15 BYTE) NOT NULL, -- 부서번호
    DEPT_NAME     VARCHAR2(30 BYTE) NULL, -- 부서명
    DEPT_LOCATION VARCHAR2(50 BYTE) NULL, -- 부서위치
    CONSTRAINT PK_DEPT PRIMARY KEY(DEPT_NO)
);

-- 사원 테이블 생성
-- 2) 외래키에 지정할 수 있는 외래키 장착해보기 ON DELETE SET NULL
CREATE TABLE EMPLOYEE_TBL (
    EMP_NO     NUMBER            NOT NULL, -- 사원번호
    DEPT_NO    VARCHAR2(15 BYTE) NULL, -- 부서번호
    POSITION   CHAR(10 BYTE)     NULL, -- 직급
    NAME       VARCHAR2(15 BYTE) NULL, -- 이름
    HIRE_DATE  DATE              NULL, -- 입사일자
    SALARY     NUMBER            NULL, -- 연봉
    CONSTRAINT PK_EMP PRIMARY KEY(EMP_NO),
    CONSTRAINT FK_EMP_DEPT FOREIGN KEY(DEPT_NO) REFERENCES DEPARTMENT_TBL(DEPT_NO) ON DELETE SET NULL-- 2) 부서는 없어질 수 있다
);                                                                                  -- 부서가 없어지면, 사원의 부서정보만 NULL 처리된다(다른정보는 다 남음)

-- 프로젝트 테이블 생성
CREATE TABLE PROJECT_TBL (
    PJT_NAME    VARCHAR2(30 BYTE) NULL, -- 프로젝트명
    PJT_NO      NUMBER            NOT NULL, -- 프로젝트번호
    BEGIN_DATE  DATE              NULL, -- 시작일자
    END_DATE    DATE              NULL, -- 종료일자
    CONSTRAINT PK_PJT PRIMARY KEY(PJT_NO)
);

-- 프로젝트진행 테이블 생성
-- 2) 외래키에 지정할 수 있는 외래키 장착해보기 ON DELETE SET NULL
CREATE TABLE PROCEEDING_TBL (
    PCD_NO    NUMBER NOT NULL, -- 진행번호
    EMP_NO    NUMBER NULL, -- 사원번호
    PJT_NO    NUMBER NULL, -- 프로젝트 번호
    PJT_STATE NUMBER NOT NULL, -- 프로젝트진행상태
    CONSTRAINT PK_PCD PRIMARY KEY(PCD_NO),
    CONSTRAINT FK_PCD_EMP FOREIGN KEY(EMP_NO) REFERENCES EMPLOYEE_TBL(EMP_NO) ON DELETE SET NULL, -- 2) 
    CONSTRAINT FK_PCD_PJT FOREIGN KEY(PJT_NO) REFERENCES PROJECT_TBL(PJT_NO) ON DELETE SET NULL -- 2) 
);