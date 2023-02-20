CREATE TABLE BUY_TBL (
    B_NO NUMBER, --NOT NULL UNIQUE PRIMARY KEY /오류발생/NOT NULL은 생략 가능
    C_NO VARCHAR2(10 BYTE),
    P_CODE NUMBER,
    B_AMOUNT NUMBER,
    CONSTRAINT PK_BUY PRIMARY KEY(B_NO),
    CONSTRAINT FK_BUY_CUST FOREIGN KEY(C_NO) REFERENCES BUY_TBL(C_NO) ON DELETE CASCADE,
    CONSTRAINT FK_BUY_PROUD FOREIGN KEY(P_CODE) REFERENCES BUY_TBL(P_CODE) ON DELETE CASCADE
);




CREATE TABLE CUST_TBL (
    C_NO VARCHAR2(10 BYTE),
    C_NAME NUMBER,
    C_POINT NUMBER,
    CONSTRAINT PK_CUST PRIMARY KEY(C_NO)
    
);


