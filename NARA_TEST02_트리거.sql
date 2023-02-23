-- 삽입/삭제/수정하면 메시지를 출력하는 트리거

-- 이거 먼저하기!
SET SERVEROUTPUT ON;

-- AFTER 또는 BEFORE 둘중하나임
-- 삽입,수정, 삭제 중 트리거 할지 문제에 적혀있음
-- INSERT OR DELETE OR UP DATE / 삽입, 수정, 삭제 중 할꺼 골라서 입력하기
-- ON 해야할 테이블
-- 행 단위
CREATE OR REPLACE TRIGGER MY_TRIGGER
    AFTER 
    INSERT OR DELETE OR UPDATE
    ON DEPARTMENT_TBL
    FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('하하하하');
END;
    
-- 확인용도! INSERT는 트리거가 동작하는걸 확인하기만 하고, 문제에는 제출X
-- 개발부 없음, 삽입 하기
INSERT INTO DEPARTMENT_TBL(DEPT_NO, DEPT_NAME, LOCATION) VALUES(5, '개발부','서울');