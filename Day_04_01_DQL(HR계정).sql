--DESCRIBE EMPLOYEES; -- EMPLOYEES_ID가 숫자인지 문자인지 확인할 수 있음
--DESCRIB EMPLOYEES; 
--DESCRI EMPLOYEES;
DESC EMPLOYEES; -- 줄여서 해당 키워드로도 조회가능

-- 1. EMPLOYEES 테이블에서 FIRST_NAME, LAST_NAME 조회하기
SELECT EMPLOYEES.FIRST_NAME, LAST_NAME --칼럼의 오너는 테이블(EMPLOYEES)
--     ㄴ 1)FIRST_NAME (하위와 다 동일)
--        2)FNAME
--        3)AS FNAME LAST_NAME(=LNAME/AS LNAME)E동일 / AS 별명: 함수,계산식에 주로 쓰임
  FROM HR.EMPLOYEES E; --HR계정이 가지고있는 EMPLOYEE테이블(오너명시)
--     ㄴ E =(HR.EMPLOYEES) 동일 (쿼리문이 길어져서, 테이블에 별명을 줌 칼럼이름 뒤 띄어쓰기 후 별명)/테이블이름은 AS불가

-- 2. EMPLOYEES 테이블에서 DEPARTMENT_ID를 중복 제거하고 조회하기(칼럼이름앞에 DISTINCT키워드)
SELECT DISTINCT DEPARTMENT_ID
  FROM EMPLOYEES;
  
--3. EMPLOYEES 테이블에서 EMPLOYEES_ID가 150인 사원 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
  FROM EMPLOYEES
 WHERE EMPLOYEES_ID = 150; -- 조건 > WHERE절(조건)의 등호(=)는 비교 연산자이다 > EMPLOYEES_ID가 숫자인지 문자인지 확인 필요
 
-- 4. EMPLOYEES 테이블에서 급여(SALARY)가 10000~20000 사이인 사원 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY -- SALARY AS SAL 칼럼 별명 사용불가 2번 '실행순서'의 WHERE절 처리할때 까진 별명 지어 부르지 않기!(EMPLOYEES에서 SAL이 없어서 안됨)
  FROM EMPLOYEES
 WHERE SALARY BETWEEN 10000 AND 20000; -- 동일 SALARY >= 10000 AND <= 20000(크거나같다 작거나 같다)
 
-- 5. EMPLOYEES 테이블에서  DEPARTMENT_ID가 30,40,50인 사원조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT_ID --3
  FROM EMPLOYEES --1실행순서
 WHERE DEPARTMENT_ID IN(30, 40, 50); --2 동일 WHERE DEPARTMENT_ID = 30 OR DEPARTMENT_ID = 40 OR DEPARTMENT_ID = 50;

-- 6. EMPLOYEES 테이블에서 DEPARTMENT_ID가 NULL인 사원 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT_ID
  FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NULL; --  IS NOT NULL

-- 7. EMPLOYEES 테이블에서 PHONE_NUMBER '515'로 시작하는 사원 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, PHONE_NUMBER
  FROM EMPLOYEES
 WHERE PHONE_NUMBER LIKE '515%'; -- PHONE_NUMBER NOT LIKE '515%' > %(만능문자 와이드카드)글자수제한없음 / _(만능문자) 한글자만 허용

-- 8. EMPLOYEES 테이블을 FIRST_NAME의 가나다순(오름차순: Ascdnding Sort)으로 정렬해서 조회하기 ORDER BY ASC
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
 FROM EMPLOYEES
ORDER BY FIRST_NAME ASC; -- ASC는 생략 가능(안적어도 오름차순으로 동작함)

-- 9. EMPLOYEES 테이블을 FIRST_NAME의 높은 SALARY(내림차순: Descending Sort)를 받는 사원순으로 조회하기 ORDER BY DESC
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
 FROM EMPLOYEES
ORDER BY SALARY DESC; -- DESC는 생략 불가

-- 10. EMPLOYEES 테이블의 사원들은 DEPARTMENT_ID순으로 조회하고, 동일한 DEPARTMENT_ID를 가진 사원들은 높은 SALARY순으로 조회하기
-- 1차기준 DEPARTMENT_ID 2차기준 SALARY
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY
 FROM EMPLOYEES
ORDER BY DEPARTMENT_ID ASC, SALARY DESC; -- 1차 정렬 기준, 2차 정렬기준 (,로 구분) / DEPARTMENT_ID는 오름차순, 내림차순 상관없음


