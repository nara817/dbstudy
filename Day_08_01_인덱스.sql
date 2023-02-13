/*
    인덱스(INDEX)
    1. 빠른 검색을 위해서 데이터의 물리적 위치를 기억하고 있는 데이터베이스 객체이다.
    2. 인덱스가 등록된 칼럼을 이용한 검색은 빠르다.
    3. 인덱스가 자동으로 등록되는 경우
        1) PK
        2) UNIQE
    4. 삽입, 수정, 삭제가 자주 발생하는 곳에서는 인덱스를 사용하면 성능이 떨어진다.
*/

-- 인덱스 정보가 저장된 데이터 사전(메타 데이터, 시스템 카탈로그) >> 테이블의 형태로 존재, SELECT가능
-- (ALL, DBA, USER로 시작하고_정보를 담고있는 복수형 객체 이름)
-- DESCRIBE 테이블이 가지고 있는, 칼럼이름 등등 데이터 확인 가능
DESCRIBE ALL_INDEXES
SELECT OWNER, INDEX_NAME, TABLE_NAME
FROM ALL_INDEXES;

DESCRIBE DBA_INDEXES
SELECT OWNER, INDEX_NAME, TABLE_NAME
FROM DBA_INDEXES;

DESCRIBE USER_INDEXES
SELECT  INDEX_NAME, TABLE_OWNER, TABLE_NAME
FROM USER_INDEXES;

USER_INDEXES


-- 인덱스 칼럼 정보가 저장된 데이터 사전
/*
ALL_IND_COLUMNS
DBA_IND_COLUMNS
USER_IND_COLUMNS
*/

DESCRIBE USER_IND_COLUMNS;
SELECT INDEX_NAME, TABLE_NAME, COLUMN_NAME
FROM USER_ID_INDEX;

-- 인덱스 생성하기(BOOK테이블)
CREATE INDEX IND_NAME
    ON DEPARTMENT_TBL_TBL(DEPARTMENT_TBL_NAME);
    
-- 인덱스 삭제하기
DROP INDEX IND_NAME;