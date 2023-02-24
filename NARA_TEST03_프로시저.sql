-- 전달된 부서번호의 부서를 부서를 삭제하는 프로시저를 작성하시오.(1인 부서가 없어짐)
-- 전달된 부서에 근무하는 모든 사원을 함께 삭제하시오.
-- 프로시저 이름은 문제보고 정하기(DEPTNO 입력파라미터IN) > 이걸적어야 함수와 동일해짐 / 부서번호와 동일한 타입
-- IS 또는 AS는 필수
-- 부서(1)와 사원(M)중 사원 먼저 지우기(외래키 가진애) > 1:M 관게에선 M먼저 지우기
CREATE OR REPLACE PROCEDURE DELETE_PROC(DEPTNO IN DEPARTMENT_TBL.DEPT_NO%TYPE)
IS
BEGIN
    DELETE
      FROM EMPLOYEE_TBL
     WHERE DEPART = DEPTNO;
    DELETE
      FROM DEPARTMENT_TBL
     WHERE DEPT_NO = DEPTNO;
    COMMIT;
-- 예외발생
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        -- ROLLBACK필요
        ROLLBACK;
END;

-- 프로시저 실행 구문
-- 부서가1인 지우기
EXECUTE DELETE_PROC(1);