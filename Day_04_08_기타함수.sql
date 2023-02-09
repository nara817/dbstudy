-- 기타 함수
-- 1. 순위 구하기
--  1) RANK() OVER(ORDER BY 순위구할칼럼 ASC)  : 오름차순 순위(낮은값이 1등인경우), ASC는 생략 가능
--  2) RANK() OVER(ORDER BY 순위구할칼럼 DEST) : 내림차순 순위(높은값이 1등인경우)
--  3) 동점자는 같은 등수로 처리(1등,2등,3등,3등,5등)
--  4) 순위 순으로 정렬된 상태로 조회
-- 실생활: 인기게시글(조회수로 순위구해서, 1~5위)
SELECT
       EMPLOYEE_ID
     , FIRST_NAME || ' ' || LAST_NAME AS NAME
     , SALARY
     , RANK() OVER(ORDER BY SALARY DESC) AS 연봉순위
  FROM
       EMPLOYEES;
/*     EMPLOYEES
WHERE
       연봉순위 <=3; -- 이건안됨, FROM > WHERE순서
*/
-- 2. 분기 처리하기(JOIN의 효과를 가진..)
-- 1) DECODE(표현식
--       , 값1, 결과1
--       , 값2, 결과2
--       , ...)
-- 표현식=값1이면 결과1을 반환, 표현식 =값2면 결과2를 반환, ...
-- 표현식과 값이 동등 비교(=)만 가능하다.
--SELECT SEPARTMENT_ID, DEPARTMENT_NAME
-- FROM DEPARTMENTS; -- EMPLOYEES_TBL 부서번호는 있으나, 부서번호는 없음
SELECT
        EMPLOYEE_ID
      , FIRST_NAME
      , LAST_NAME
      , DEPARTMENT_ID
      , DECODE(DEPARTMENT_ID
          , 10, 'Administration'
          , 20, 'Marketing'
          , 30, 'Purchasing'
          , 40, 'Human Resources'
          , 50, 'Shipping'
          , 60, 'IT') AS DEPARTMENT_ID
  FROM
        EMPLOYEES
  WHERE
        DEPARTMENT_ID IN(10,20,30,40,50,60);

-- 2) 분기 표현식
-- CASE
--     WHEN 조건식1 THEN 결과값1
--     WHEN 조건식2 THEN 결과값2
--     . . .
--     ELSE 결과값N
-- END
-- 연봉(SALARY) 순으로 
SELECT
       EMPLOYEE_ID
     , FIRST_NAME
     , LAST_NAME
     , SALARY
     , CASE 
            WHEN SALARY >= 15000 THEN 'A'
            WHEN SALARY >= 10000 THEN 'B'
            WHEN SALARY >= 5000  THEN 'C'
            ELSE 'D'
       END AS GRADE
  FROM
       EMPLOYEES;
-- 2_1
SELECT
      EMPLOYEE_ID
    , FIRST_NAME
    , LAST_NAME
    , SALARY
    , CASE
          WHEN SALARY >= 17000 THEN '1'
          WHEN SALARY >= 12000 THEN '2'
          WHEN SALARY >= 9000  THEN '3'
          ELSE '4'
      END AS GRADE
FROM
    EMPLOYEES;

-- 3. 행 번호 반환하기(RANK순위와 비슷하지만 더 많이 쓰임!)
-- ROW_NUMBER() OVER(ORDER BY 칼럼 ASC|DESC) 정렬방법은 둘중한가지
-- 정렬 결과에 행 번호를 추가해서 반환하는 함수
SELECT
       ROW_NUMBER() OVER(ORDER BY SALARY DESC) AS 행번호
     , EMPLOYEE_ID
     , FIRST_NAME
     , LAST_NAME
     , SALARY
  FROM
        EMPLOYEES;





