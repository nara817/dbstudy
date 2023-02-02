/*
    
        DQL
        1. Data Quert Language
        2. 데이터 질의(조회) 언어
        3. 테이블의 데이터를 조회하는 언어이다.
        4. 테이블의 내용의 변경이 생기지 않는다.
            (트랜잭션 처리 대상이 아니고, COMMIT 이 필요하지 않다.) / 트랜잭션처리대상: 어떤작업이란뜻(삽입,수정,삭제 - 내용이 바뀌는 작업)
        5. 형식([]는 생략 가능, 순서는 지켜야함)
         /SFW G BY H O BY/
           SELECT 조회할칼럼, 조회할칼럼, 조회할칼럼, ... 
            └                SELECT절                  ┘  
           FROM 테이블이름(조회원하는 테이블의 이름)
            └                FROM절               ┘
           [WHERE 조건식]
           [GROUP BY 그룹화할칼럼 [HAVING 그룹조건식]] HAVING예) 남자,여자 그룹에서 남자만
           [ORDER BY 정렬할칼럼 정렬방식] 예) 성적 높은,낮은순으로 
        6. 순서
         /FW G BY S O BY/
            ④ SELECT 조회할칼럼, 조회할칼럼, 조회할칼럼, ...  
            ① FROM 테이블이름(조회원하는 테이블의 이름)
            ② [WHERE 조건식]
            ③ [GROUP BY 그룹화할칼럼 [HAVING 그룹조건식]] HAVING예) 남자,여자 그룹에서 남자만
            ⑤ [ORDER BY 정렬할칼럼 정렬방식] 예) 성적 높은,낮은순으로
*/

/*
    트랜잭션
    1. Transaction
    2. 여러 개의 세부 작업으로 구성된 하나의 작업을 의미한다.(두개이상의 세부작업으로 구성된 하나의 작업)
    3. 모든 세부작업이 성공하면 COMMIT(저장의 개념)하고, 하나라도 실패하면 모든 세부 작업의 취소를 진행한다.
        (All or Nothing)
*/
-- 쿼리문: ; 으로 구분되는 하나하나의 문장
-- 조회 실습.

-- 1. 사원 테이블에서 사원명 조회하기 / EMP테이블 ENAME
-- 1) 기본방식
SELECT ENAME -- SELECT문의 결과는 TABLE / 칼럼(ENAME)이 1개인 12개의 테이블
  FROM EMP;

-- 2) 오너 명시하기(테이블을 가지고 있는 계정)
SELECT ENAME
  FROM SCOTT.EMP; -- SCOTT계정을 가지고있는 EMP테이블

-- 3) 테이블 명시하기(칼럼을 가지고 있는 테이블) / 칼럼의 오너는 테이블
SELECT EMP.ENAME --  / EMP테이블의 ENAME(칼럼이름 앞에 .)
  FROM EMP;

-- 4) 테이블 별병 지정하기(테이블 이름이 길때 주로 사용)●●주로 사용●●
SELECT E.ENAME
  FROM EMP E; -- EMP 테이블의 별명을 E로 부여한다. / AS(ALIAS)를 사용할 수 없다.

-- 5) 칼럼 별명 지정하기 ●●주로 사용●
SELECT E.ENAME AS 사원명 -- E.NAME 칼럼의 별명을 '사원명으로 부여한다' AS(ALIAS)를 사용할 수 있다. / 칼럼 뒤 AS 별명부여(칼럼 E.NAME > 사원명으로 변경)
  FROM EMP E;

-- 2. 사원테이블의 모든 칼럼 조회하기 / EMP테이블
-- 1) * 활용하기(SELECT절에서 *는 모든 칼럼을 의미한다.)
SELECT *    -- 불려 가기 싫으면 사용금지!
  FROM EMP; -- 질의결과 (null) 해당 값은 null값이 아닌 빈칸이라는 뜻
  
SELECT EMPNO , ENAME , JOB , MGR , HIREDATE , SAL , COMM , DEPTNO -- 위 방식이 아닌 이방식으로 다 불러와야함!
  FROM EMP;

-- 3. 동일한 데이터는 한 번만 조회하기 /JOB칼럼의 중복값 하나씩만 출력
--   DISTINCT
SELECT DISTINCT JOB
  FROM EMP;
  
-- 4. JOB이 MANAGER인 사원 목록 조회하기
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
 FROM EMP
WHERE JOB = 'MANAGER'; --'MANAGER'입력되는 텍스트는 대소문자 구별 반드시 필요

SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
 FROM EMP
WHERE JOB IN('MANAGER'); -- = 과 동일 IN은 입력되는 텍스트가 다수인경우 주로 사용

-- 5.SAL이 급여 1500초과인 사원 목록 조회하기
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
 FROM EMP 
 WHERE SAL > 1500;

-- 6. SAL이 2000 ~ 2999인 사원 목록 조회하기
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
 FROM EMP
 WHERE SAL BETWEEN 2000 AND 2999;

-- 7. COMM을 받는 사원 목록 조회하기
--  1) NULL 이다   : IS NULL
--  2) NULL 아니다 : IS NOT NULL
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
  FROM EMP
 WHERE COMM IS NOT NULL -- COMM 0 값도 나와서 아래 내용 추가함
   AND COMM != 0; -- COMM 0이 아니다


-- 8. ENAME이 A로 시작하는 사원 목록 조회하기
--  1) WILD CARD(만능문자)
--        (1) % : 모든 문자, 글자 수 제한 없는 모든문자 예) A% : A로 시작한다 AI APP APPLE / %A% : A가 어디있든 상관없다 / %A : A로 끝난다
--        (2) _ : 1글자로 제한된 모든 문자             예) A_ : AI AP AM(A를 포함한 1글자까지)
--  2) 연산자
--        (1) LIKE       : WILD CARD를 포함한다.
--        (2) NOT LIKE   : WILD CARD를 포함하지 않는다.
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
  FROM EMP
 WHERE ENAME LIKE 'A%';

















