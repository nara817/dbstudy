-- HR계정으로 접속 후 풀기!
-- 중복제거 DISTINCT / 알파벳 순 정렬ASC
-- 1. EMPLOYEES 테이블에서 JOB_ID를 조회하시오. 동일한 JOB_ID는 한 번만 출력하고 알파벳 순으로 정렬하여 조회하시오.
SELECT DISTINCT JOB_ID
  FROM EMPLOYEES
ORDER BY JOB_ID;
-- 2. EMPLOYEES 테이블에서 DEPARTMENT_ID가 50인 사원 중에서 SALARY가 5000 이상인 사원을 조회하시오. 
SELECT 사원정보
  FROM 사원테이블
 WHERE DEPARTMENT_ID가 50인 사원
   AND SALARY가 5000이상;

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID --DEPARTMENT_ID 사유확인
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 50
   AND SALARY >= 5000;

-- 3. EMPLOYEES 테이블에서 FIRST_NAME이 'Steven', LAST_NAME이 'King'인 사원을 조회하시오.
SELECT 사원정보
  FROM 사원테이블
 WHERE FIRST_NAME이 'Steven'
   AND  LAST_NAME이 'King';

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE FIRST_NAME = 'Steven'
   AND LAST_NAME = 'King';

-- 4. EMPLOYEES 테이블에서 EMPLOYEE_ID가 151 ~ 200인 사원을 조회하시오.

-- 5. EMPLOYEES 테이블에서 JOB_ID가 'IT_PROG', 'ST_MAN'인 사원을 조회하시오.

-- 6. EMPLOYEES 테이블에서 HIRE_DATE가 2005년도인 사원을 조회하시오.

-- 7. EMPLOYEES 테이블에서 MANAGER_ID가 없는 사원을 조회하시오.

-- 8. EMPLOYEES 테이블에서 COMMISSION_PCT를 받는 사원들의 실제 커미션을 조회하시오. 커미션은 COMMISSION_PCT * SALARY로 계산하시오.

-- 9. EMPLOYEES 테이블에서 FIRST_NAME이 'J'로 시작하는 사원을 조회하시오.

-- 10. EMPLOYEES 테이블에서 JOB_ID가 'MAN'으로 끝나는 사원들의 MANAGER_ID를 중복을 제거하여 조회하시오.

-- 11. EMPLOYEES 테이블에서 전체 사원을 DEPARTMENT_ID의 오름차순으로 조회하되, 동일한 DEPARTMENT_ID 내에서는 HIRE_DATE의 오름차순으로 조회하시오.

-- 12. EMPLOYEES 테이블에서 DEPARTMENT_ID가 80인 사원들을 높은 SALARY순으로 조회하시오. SALARY는 9,000처럼 천 단위 구분기호를 표기해서 조회하시오.

-- 13. EMPLOYEES 테이블에서 전체 사원의 근무 개월 수를 정수로 조회하시오. 1개월 1일을 근무했다면 2개월을 근무한 것으로 처리해서 조회하시오.

-- 14. EMPLOYEES 테이블에서 PHONE_NUMBER에 따른 REGION을 조회하시오.
-- PHONE_NUMBER가 011로 시작하면 'MOBILE', 515로 시작하면 'EAST', 590으로 시작하면 'WEST', 603으로 시작하면 'SOUTH', 650으로 시작하면 'NORTH'로 조회하시오.

-- 15. EMPLOYEES 테이블에서 근무 개월 수가 240개월 이상이면 '퇴직금정산대상', 아니면 빈 문자열('')을 조회하시오.