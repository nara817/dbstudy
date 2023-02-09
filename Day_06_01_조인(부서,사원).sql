/*
    드라이브(DRIVE) 테이블과 드리븐(DRIVEN) 테이블
    1. 드라이브(DRIVE) 테이블
        1) 조인 관계를 처리하는 메인 테이블
        2) 1:M 관계에서 1에 해당하는 테이블
        3) 행(ROW)의 개수가 일반적으로 적고, PK를 조인조건으로 사용하기 때문에 인덱스(INDEX)활용이 가능하다.(적은데이터를 가지고 운용하는게 빠름)
    2. 드리븐(DRIVEN) 테이블
        1) 1:M 관계에서 M에 해당하는 테이블
        2) 행(ROW)의 개수가 일반적으로 많고, FK를 조인조건으로 사용하기 때문에 인덱스(INDEX) 활용이 불가능하다.
    3. 조인 성능 향상을 위해서 가급적 드라이브(DRIVE) 테이블을 먼저 작성한다.드리븐(DRIVEN)테이블은 나중에 작성한다.  
 */
-- 1. 내부 조인(두 테이블에 일치하는 정보를 조인한다.)
-- 1) 표준 문법
SELECT E.EMP_NO, E.NAME, D.DEPT_NO, D.DEPT_NAME-- PT15조인 INNER연습문제
  FROM DEPARTMENT_TBL D INNER JOIN EMPLOYEE_TBL E
    ON D.DEPT_NO = E.DEPART;
    
-- 2) 오라클 문법
SELECT E.EMP_NO, E.NAME, D.DEPT_NO, D.DEPT_NAME 
  FROM DEPARTMENT_TBL D, EMPLOYEE_TBL E
 WHERE D.DEPT_NO = E.DEPART;
 
-- 2. 왼쪽 외부조인(왼쪽에 있는 테이블은 일치하는 정보가 없어도 무조건 조인한다.)
-- 실생활에서 

-- 1) 표준 문법●●오라클문법 말고 표준문법으로 공부하기!●●
SELECT D.DEPT_NO, D.DEPT_NAME, E.EMP_NO, E.NAME
  FROM DEPARTMENT_TBL D LEFT OUTER JOIN EMPLOYEE_TBL E
    ON D.DEPT_NO = E.DEPART;
    
-- 2) 오라클 문법
SELECT D.DEPT_NO, D.DEPT_NAME, E.EMP_NO, E.NAME
  FROM DEPARTMENT_TBL D, EMPLOYEE_TBL E
 WHERE D.DEPT_NO = E.DEPART(+);
 
-- 외래키 제약조건의 비활성화(일시 중지)  
-- 제약조건이름 :  FK_EMP_DEPT(DAY_03_03참고
ALTER TABLE EMPLOYEE_TBL -- 제약조건 수정
    DISABLE CONSTRAINT FK_EMP_DEPT;

-- 외래키 제약조건이 없는 상태이므로, 제약조건을 위배하는 데이터를 입력 할 수 있다
INSERT INTO EMPLOYEE_TBL(EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY)
VALUES(EMPLOYEE_SEQ.NEXTVAL, '김성실', 5, '대리', 'F','98/12/01', 3500000);-- 시퀀스(번호생성기 1001부터 시작하도록)
COMMIT;
  
-- 3. 오른쪽 외부조인(오른쪽에 있는 테이블은 일치하는 정보가 없어도 무조건 조인한다.)
--1) 표준문법●●오라클문법 말고 표준문법으로 공부하기!●●
SELECT D.DEPT_NO, D.DEPT_NAME, E.EMP_NO, E.NAME
  FROM DEPARTMENT_TBL D RIGHT JOIN EMPLOYEE_TBL E
    ON D.DEPT_NO = E.DEPART;    
    
-- 2) 오라클 문법
SELECT D.DEPT_NO, D.DEPT_NAME, E.EMP_NO, E.NAME
  FROM DEPARTMENT_TBL D, EMPLOYEE_TBL E
 WHERE D.DEPT_NO(+) = E.DEPART;
 
 -- 외래키 제약조건을 위반하는 데이터 삭제하기
DELETE FROM EMPLOYEE_TBL WHERE EMP_NO = 1005; -- PK를 조건으로 사용하면 인덱스를 타기 때문에 빠르다 / WHERE절을 이용해서, 지울곳 지정
DELETE FROM EMPLOYEE_TBL WHERE NAME = '김성실'; --인덱스를 타지 않는 일반 칼럼은 느리게 동작한다 /  이것 위와 같이 김성실의 정보를 지울 수는 있으나(WHERE는 인덱스가 없어, 풀스캔 해야함), 위의 방법 PK를 사용하기!
COMMIT;

-- 외래키 제약조건의 활성화(다시시작)
-- 제약조건이름 :  FK_EMP_DEPT(DAY_03_03참고
ALTER TABLE EMPLOYEE_TBL
  ENABLE CONSTRAINT FK_EMP_DEPT;

