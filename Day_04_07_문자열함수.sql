-- 문자열 함수


-- 1. 대소문자 변환 함수
SELECT
       UPPER(EMAIL)   -- 대문자
     , LOWER(EMAIL)   -- 소문자
     , INITCAP(EMAIL) -- 첫 글자는 대문자, 나머지는 소문자
  FROM
       EMPLOYEES; -- 테이블이름EMPLOYEES
       
-- 2. 글자 수(바이트 수) 반환 함수
SELECT
       LENGTH('HELLO')  -- 글자 수 : 5
     , LENGTH('안녕')   -- 글자 수 : 2
     , LENGTHB('HRLLO') -- 바이트 수: 5
     , LENGTHB('안녕')  -- 바이트 수: 6   -- UTF-8 셋팅해두었기 때문
  FROM
       DUAL;
       
-- 3. 문자열 연결 함수/연산자
--  1) 함수 : CONCAT(A,B) 주의! 인수가 2개만 전달 가능하다. (CONCAT(A,B,C) 같은 형태는 불가능하다.)
--  2) 연산자 : || 주의! OR연산 아님, 오라클 전용!
SELECT
       CONCAT(CONCAT(FISRST_NAME, ' '), LAST_NAME)
     , FIRST_NAME || ' ' || LAST_NAME -- || 또는이란 뜻 아님!! 
  FROM
       EMPLOYEES;
-- 4. 문자열 일부 반환하기
--      SUBSTR(칼럼, BEGIN, LENGTH) : BEGIN부터 LENGTH개를 반환
--      주의! BEGIN은 1에서 시작한다.
--      자바 SUBSTRING("hello",0,3) : hel 
SELECT
       SUBSTR(EMAIL, 1,3) -- 1번째 글자부터 3글자를 가져오시오.
  FROM
       EMPLOYEES;
       
-- 5. 특정 문자열의 위치 반환하기
--    INSTR(칼럼, 찾을문자열)
--    주의! 반환되는 위치 정보는 인덱스가 아니므로 0부터 시작하지 않고, 1부터 시작한다.
--    못 찾으면 0을 반환한다.
SELECT
       INSTR(EMAIL, 'A') -- 'A'의 위치를 반환
  FROM
       EMPLOYEES;
       
-- 6. 문자열 채우기(PADDING)
--    1) LPAD(왼쪽채우기)  (칼럼, 전체폭, 채울문자)
--    2) RPAD(오른쪽채우기)(칼럼, 전체폭, 채울문자)
SELECT
       LPAD(DEPARTMENT_ID, 3, '0') -- 전체폭은 3, 채울문자 0(없는자리)
     , RPAD(EMAIL, 10, '*') -- 전체폭은10, 채울문자 *
                            -- LPAD작업시 NULL 값을 0으로 모든EMAIL 2자리 나머지3개는 **
  FROM
       EMPLOYEES;
-- 6_1. 위 6번 LPAD작업시 NULL 값을 0으로 모든EMAIL 2자리 나머지3개는 **
SELECT
       LPAD(NVL(DEPARTMENT_ID,0), 3, '0') -- NULL이 나오면 NUL대신 0
     , RPAD(SUBSTR(EMAIL, 1, 2), 5, '*')
--                         └─┘     
--           └───────────────────┘
  FROM
       EMPLOYEES;  
       
-- 7. 불필요한 공백 제거
--    1) LTRIM(칼럼) : 왼쪽 공백 제거
--    2) TRIM(칼럼)  : 오른쪽 공백 제거
--    3) TRIM(칼럼)  : 왼쪽, 오른쪽 공백 모두 제거
-- 실생활: 엑셀 자료받을때, 엔터 많을때 정리시 사용
SELECT
      '[' || LTRIM('     HELLO') || ']'
     ,'[' || RTRIM('HELLO     ') || ']'
     ,'[' || TRIM('     HELLO ') || ']'
  FROM
       DUAL;