-- 날짜 함수


-- 1. 현재 날짜와 시간
SELECT
      SYSDATE
    , SYSTIMESTAMP
  FROM
      DUAL;
      
-- 2.날짜에 형식 지정하기
SELECT
      TO_CHAR(SYSDATE, 'YYYY-MM-DD')
    , TO_CHAR(SYSDATE, 'YYYY') -- 필요한 정보만 추출하는 용도로 사용 가능하다.
--  , TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) -- 년도만 나오고, 숫자로 변환
  FROM
      DUAL;
-- 3. 필요한 정보만 추출하기
SELECT
      EXTRACT(YEAR FROM SYSDATE)        -- 오늘날짜에서, 년도만 추출
    , EXTRACT(MONTH FROM SYSDATE)       -- 오늘날짜에서, 월만 추출
    , EXTRACT(DAY FROM SYSDATE)         -- 오늘날짜에서, 일만 추출
    , EXTRACT(HOUR FROM SYSTIMESTAMP)   -- 오늘날짜에서, 시간만 추출 UTC기준(세계 표준시), 우리나라 시간은 +9 해야한다.
    , EXTRACT(MINUTE FROM SYSTIMESTAMP) -- 오늘날짜에서, 분만 추출
    , EXTRACT(SECOND FROM SYSTIMESTAMP) -- 오늘날짜에서, 초만 추출
    , FLOOR(EXTRACT(SECOND FROM SYSTIMESTAMP)) -- 오늘날짜에서, 초만 추출, 정수값만
  FROM
      DUAL;

-- 4. N개월 전후 날짜 구하기
SELECT
      ADD_MONTHS(SYSDATE, 1)  -- 1개월 후 날짜
    , ADD_MONTHS(SYSDATE, -1) -- 1개월 전 날짜
    , ADD_MONTHS(SYSDATE, 12) -- 1년 후 날짜
  FROM
      DUAL;
      
-- 5. 경과한 개월 수 구하기
SELECT
      MONTHS_BETWEEN(SYSDATE, TO_DATE('22/10/07', 'YY/MM/DD'))
  FROM
      DUAL;

-- 6. 날짜 연산
--    1) 1일(하루)을 숫자1로 처리한다.
--    2) 12시간은 숫자 0.5로 처리한다.
--    3) 날짜는 더하기/빼기가 가능하다. (며칠 전,후 경과한 일수 구하는 함수가 없다.)
SELECT
      SYSDATE + 15 -- 15일 후 날짜 (실생활: 비밀번호 변경)
    , SYSDATE - 15 -- 15일 전 날짜
    , SYSDATE - TO_DATE('22/10/07','YY/MM/DD') -- 경과한 일수
  FROM
      DUAL;
      
