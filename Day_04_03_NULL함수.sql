--샘플 데이터
DROP TABLE SAMPLE_TBL;
CREATE TABLE SAMPLE_TBL (
NAME VARCHAR2(10 BYTE),
    KOR NUMBER(3),
    ENG NUMBER(3),
    MAT NUMBER(3)
);

INSERT INTO SAMPLE_TBL(NAME, KOR, ENG, MAT) VALUES(NULL, 100, 100, 100);
INSERT INTO SAMPLE_TBL(NAME, KOR, ENG, MAT) VALUES('정숙', NULL, 90, 90);
INSERT INTO SAMPLE_TBL(NAME, KOR, ENG, MAT) VALUES('미희', 80, NULL, 80);
INSERT INTO SAMPLE_TBL(NAME, KOR, ENG, MAT) VALUES('철순', 70, 70, NULL);
COMMIT;

-- NULL값이 포함된 연산 결과는 NULL이다.
SELECT NAME, KOR + ENG + MAT AS TOTAL-- 모든학생들의 시험점수 별명 TOTAL
  FROM SAMPLE_TBL;-- 모든학생들의 시험점수 확인

-- 1. NVL(칼럼, NULL대신 사용할 값) > NULL이 들어있음 연산결과가 NULL이기때문에..
SELECT
      NVL(NAME, '아무개') AS 이름
    , NVL(KOR, 0) + NVL(ENG, 0) AS 총점 -- 국어점수에 NULL이 들어있음 0으로 계산하겠다
  FROM
      SAMPLE_TBL;

-- 2. NVL2(칼럼, NULL이 아닐 때 사용할 값, NULL일 때 사용할 값 /삼항연산자 IF와 비슷)
SELECT
        NVL2(KOR + ENG + MAT, '응시','결시')
  FROM
        SAMPLE_TBL; -- NULL 값은 결시로 하겠다
