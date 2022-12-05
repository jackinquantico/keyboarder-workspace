DROP TABLE SELLER CASCADE CONSTRAINTS;
DROP TABLE CONSUMER CASCADE CONSTRAINTS;
DROP TABLE ADMIN CASCADE CONSTRAINTS;
DROP TABLE NOTICE CASCADE CONSTRAINTS;
DROP TABLE INQUIRY CASCADE CONSTRAINTS;
DROP TABLE COUPON_STORE CASCADE CONSTRAINTS;
DROP TABLE COUPON_KEYBOARDER CASCADE CONSTRAINTS;
DROP TABLE PRODUCT CASCADE CONSTRAINTS;
DROP TABLE ORDERS CASCADE CONSTRAINTS;
DROP TABLE PAYMENT CASCADE CONSTRAINTS;
DROP TABLE SETTLEMENT CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_SELLER_NO;
DROP SEQUENCE SEQ_CON_NO;
DROP SEQUENCE SEQ_NOTICE;
DROP SEQUENCE SEQ_INQUIRY;
DROP SEQUENCE SEQ_COUPON_STORE_NO;
DROP SEQUENCE SEQ_COUPON_KEYBOARDER_NO;
DROP SEQUENCE SEQ_PRODUCT_NO;
DROP SEQUENCE SEQ_ORDER_NO;

-- 판매자(입점업체) 테이블
CREATE TABLE SELLER (
    SELLER_NO NUMBER CONSTRAINT SELLER_NO_PK PRIMARY KEY,
    SELLER_NAME VARCHAR2(50) CONSTRAINT SELLER_NAME_NN NOT NULL,
    REP_NAME VARCHAR2(20) CONSTRAINT REP_NAME_NN NOT NULL,
    SELLER_ID VARCHAR2(20) CONSTRAINT SELLER_ID_NN NOT NULL UNIQUE, -- UNIQUE, NOT NULL 2개의 제약조건
    SELLER_PWD VARCHAR2(20) CONSTRAINT SELLER_PWD_NN NOT NULL,
    SELLER_EMAIL VARCHAR2(50) CONSTRAINT SELLER_EMAIL_NN NOT NULL,
    SELLER_PHONE CHAR(13) CONSTRAINT SELLER_PNONE_NN NOT NULL, -- '-' 하이폰 포함
    CORP_NO CHAR(12) CONSTRAINT CORP_NO_NN NOT NULL, -- '-' 하이폰 포함
    ACCOUNT_NO VARCHAR2(20) CONSTRAINT ACCOUNT_NO_NN NOT NULL,
    JOIN_DATE DATE DEFAULT SYSDATE CONSTRAINT JOIN_DATE_NN NOT NULL,
    LOCATION VARCHAR2(100) CONSTRAINT LOCATION_NN NOT NULL
);

-- 판매자(입점업체) 테이블 코멘트
COMMENT ON COLUMN SELLER.SELLER_NO IS '판매업체 번호';
COMMENT ON COLUMN SELLER.SELLER_NAME IS '판매업체명';
COMMENT ON COLUMN SELLER.REP_NAME IS '판매업체 대표자명';
COMMENT ON COLUMN SELLER.SELLER_ID IS '판매업체 아이디';
COMMENT ON COLUMN SELLER.SELLER_PWD IS '판매업체 비밀번호';
COMMENT ON COLUMN SELLER.SELLER_EMAIL IS '판매업체 이메일';
COMMENT ON COLUMN SELLER.SELLER_PHONE IS '판매업체 전화번호';
COMMENT ON COLUMN SELLER.CORP_NO IS '판매업체 사업자등록번호';
COMMENT ON COLUMN SELLER.ACCOUNT_NO IS '판매업체 계좌번호';
COMMENT ON COLUMN SELLER.JOIN_DATE IS '판매업체 가입일';
COMMENT ON COLUMN SELLER.LOCATION IS '판매업체 본사주소';

-- 판매자(입점업체) 식별자 시퀀스 10000부터 99999까지
CREATE SEQUENCE SEQ_SELLER_NO
START WITH 10000
MAXVALUE 99999
NOCACHE;

----소비자 테이블-----
CREATE TABLE CONSUMER(
    CON_NO NUMBER CONSTRAINT CON_NO_PK PRIMARY KEY,
    CON_NAME VARCHAR2(20) CONSTRAINT CON_NAME_NN NOT NULL, 
    CON_ID VARCHAR2(20) CONSTRAINT CON_ID_NN NOT NULL UNIQUE,
    CON_PWD VARCHAR2(20) CONSTRAINT CON_PWD_NN NOT NULL,
    ADDRESS VARCHAR2(20) CONSTRAINT ADDRESS_NN NOT NULL,
    CON_PHONE CHAR(13) CONSTRAINT CON_PHONE_NN NOT NULL, 
    CON_EMAIL VARCHAR2(20) CONSTRAINT CON_EMAIL_NN NOT NULL);
    
-----소비자 코멘트--
COMMENT ON COLUMN CONSUMER.CON_NO IS '고객번호';
COMMENT ON COLUMN CONSUMER.CON_NAME IS '이름';
COMMENT ON COLUMN CONSUMER.CON_ID IS '아이디';
COMMENT ON COLUMN CONSUMER.CON_PWD IS '비밀번호';
COMMENT ON COLUMN CONSUMER.ADDRESS IS '배송지';
COMMENT ON COLUMN CONSUMER.CON_PHONE IS '핸드폰번호';
COMMENT ON COLUMN CONSUMER.CON_EMAIL IS '이메일';

-- 소비자 시퀀스--(1001~9999)
CREATE SEQUENCE SEQ_CON_NO
INCREMENT BY 1
START WITH 1001
MAXVALUE 9999;

-- 관리자 테이블
CREATE TABLE ADMIN (
    ADMIN_ID VARCHAR2(20) CONSTRAINT ADMIN_ID_NN NOT NULL UNIQUE,
    ADMIN_PWD VARCHAR2(20) CONSTRAINT ADMIN_PWD_NN NOT NULL
);

-- 관리자 테이블 코멘트
COMMENT ON COLUMN ADMIN.ADMIN_ID IS '관리자 아이디';
COMMENT ON COLUMN ADMIN.ADMIN_PWD IS '관리자 비밀번호';

-- 공지사항
CREATE TABLE NOTICE(
 NOTICE_NO NUMBER CONSTRAINT NOTICE_NO_PK PRIMARY KEY,
 NOTICE_TITLE VARCHAR2(90) CONSTRAINT NOTICE_TITLE_NN NOT NULL,
 NOTICE_CONTENT VARCHAR2(3000) CONSTRAINT NOTICE_CONTENT_NN NOT NULL,
 VIEW_COUNT NUMBER DEFAULT 0,
 WRITE_DATE DATE DEFAULT SYSDATE);
 
 -- 공지사항 코멘트
COMMENT ON COLUMN NOTICE.NOTICE_NO IS '공지사항 번호';
COMMENT ON COLUMN NOTICE.NOTICE_TITLE IS '공지사항 제목';
COMMENT ON COLUMN NOTICE.NOTICE_CONTENT IS '공지사항 내용';
COMMENT ON COLUMN NOTICE.VIEW_COUNT IS '공지사항 조회수';
COMMENT ON COLUMN NOTICE.WRITE_DATE IS '공지사항 작성일';

-- 공지사항 시퀀스
CREATE SEQUENCE SEQ_NOTICE NOCACHE;

-- 1:1문의
CREATE TABLE INQUIRY(
 INQUIRY_NO NUMBER PRIMARY KEY,
 INQUIRY_NAME VARCHAR2(90) NOT NULL,
 INQUIRY_CONTENT VARCHAR2(3000) NOT NULL,
 INQUIRY_DATE DATE DEFAULT SYSDATE,
 INQUIRY_REPLY VARCHAR2(3000),
 REPLY_DATE DATE,
 SELLER_NO NUMBER);
 
-- 1:1문의 코멘트
COMMENT ON COLUMN INQUIRY.INQUIRY_NO IS '1:1문의 번호';
COMMENT ON COLUMN INQUIRY.INQUIRY_NAME IS '1:1문의 제목';
COMMENT ON COLUMN INQUIRY.INQUIRY_CONTENT IS '1:1문의 내용';
COMMENT ON COLUMN INQUIRY.INQUIRY_DATE IS '1:1문의 작성일';
COMMENT ON COLUMN INQUIRY.INQUIRY_REPLY IS '1:1문의 답변내용';
COMMENT ON COLUMN INQUIRY.REPLY_DATE IS '1:1문의 답변일';
COMMENT ON COLUMN INQUIRY.SELLER_NO IS '1:1문의 작성자';

-- 1:1문의 시퀀스
CREATE SEQUENCE SEQ_INQUIRY NOCACHE;

-- 스토어 쿠폰 테이블 --
CREATE TABLE COUPON_STORE (
    COUPON_NO CHAR(8) CONSTRAINT COUPON_S_NO_PK PRIMARY KEY,
    COUPON_NAME VARCHAR2(100) CONSTRAINT COUPON_S_NAME_NN NOT NULL,
    COUPON_PRICE NUMBER CONSTRAINT COUPON_S_PRICE_NN NOT NULL CHECK (COUPON_PRICE IN (3000, 5000, 10000)),
    CREATE_DATE DATE DEFAULT SYSDATE CONSTRAINT COUPONR_S_CREATE_DATE_NN NOT NULL,
    USE_DATE DATE,
    DUE_DATE DATE,
    COUPON_STMT CHAR(1) DEFAULT 'Y' CONSTRAINT COUPON_S_STMT_NN NOT NULL CHECK (COUPON_STMT IN ('N', 'Y')),
    SELLER_NO NUMBER
);

-- 스토어 쿠폰 테이블 코멘트 --
COMMENT ON COLUMN COUPON_STORE.COUPON_NO IS '쿠폰키';
COMMENT ON COLUMN COUPON_STORE.COUPON_NAME IS '쿠폰이름';
COMMENT ON COLUMN COUPON_STORE.COUPON_PRICE IS '쿠폰금액';
COMMENT ON COLUMN COUPON_STORE.CREATE_DATE IS '발행일';
COMMENT ON COLUMN COUPON_STORE.USE_DATE IS '사용일';
COMMENT ON COLUMN COUPON_STORE.DUE_DATE IS '만료일';
COMMENT ON COLUMN COUPON_STORE.COUPON_STMT IS '쿠폰상태';
COMMENT ON COLUMN COUPON_STORE.SELLER_NO IS '발행인';

-- 스토어 쿠폰 번호 시퀀스 --
CREATE SEQUENCE SEQ_COUPON_STORE_NO
START WITH 1000000
MAXVALUE 9999999
NOCACHE;

-- 키보더 쿠폰 테이블 --
CREATE TABLE COUPON_KEYBOARDER (
    COUPON_NO CHAR(8) CONSTRAINT COUPON_K_NO_PK PRIMARY KEY,
    COUPON_NAME VARCHAR2(100) CONSTRAINT COUPON_K_NAME_NN NOT NULL,
    COUPON_PRICE NUMBER CONSTRAINT COUPON_K_PRICE_NN NOT NULL CHECK (COUPON_PRICE IN (3000, 5000, 10000)),
    CREATE_DATE DATE DEFAULT SYSDATE CONSTRAINT COUPONT_K_CREATE_DATE_NN NOT NULL,
    USE_DATE DATE,
    DUE_DATE DATE,
    COUPON_STMT CHAR(1) DEFAULT 'Y' CONSTRAINT COUPON_K_STMT_NN NOT NULL CHECK (COUPON_STMT IN ('N', 'Y')),
    SELLER_NO NUMBER
);

-- 키보더 쿠폰 테이블 코멘트 --
COMMENT ON COLUMN COUPON_KEYBOARDER.COUPON_NO IS '쿠폰키';
COMMENT ON COLUMN COUPON_KEYBOARDER.COUPON_NAME IS '쿠폰이름';
COMMENT ON COLUMN COUPON_KEYBOARDER.COUPON_PRICE IS '쿠폰금액';
COMMENT ON COLUMN COUPON_KEYBOARDER.CREATE_DATE IS '발행일';
COMMENT ON COLUMN COUPON_KEYBOARDER.USE_DATE IS '사용일';
COMMENT ON COLUMN COUPON_KEYBOARDER.DUE_DATE IS '만료일';
COMMENT ON COLUMN COUPON_KEYBOARDER.COUPON_STMT IS '쿠폰상태';
COMMENT ON COLUMN COUPON_KEYBOARDER.SELLER_NO IS '발행인';

-- 키보더 쿠폰 번호 시퀀스 --
CREATE SEQUENCE SEQ_COUPON_KEYBOARDER_NO
START WITH 1000000
MAXVALUE 9999999
NOCACHE;

----- 상품
CREATE TABLE PRODUCT (
    PRODUCT_NO NUMBER CONSTRAINT PRODUCT_NO_PK PRIMARY KEY,
    PRODUCT_NAME VARCHAR2(150) CONSTRAINT PRODUCT_NAME_NN NOT NULL,
    PRICE NUMBER CONSTRAINT PRICE_NN NOT NULL,
    DESCRIPTION VARCHAR2(3000) CONSTRAINT DESCRIPTION_NN NOT NULL,
    ATTACHMENT1 VARCHAR2(500) CONSTRAINT ATTACHMENT1_NN NOT NULL,
    ATTACHMENT2 VARCHAR2(500),
    ATTACHMENT3 VARCHAR2(500),
    ATTACHMENT4 VARCHAR2(500),
    SELLER_NO NUMBER CONSTRAINT SELLER_NO_NN NOT NULL,
    COUPON_NO CHAR(8) CONSTRAINT COUPON_NO_NN NOT NULL
);

----- 상품 코멘트
COMMENT ON COLUMN PRODUCT.PRODUCT_NO IS '상품식별키';
COMMENT ON COLUMN PRODUCT.PRODUCT_NAME IS '상품명';
COMMENT ON COLUMN PRODUCT.PRICE IS '상품 가격';
COMMENT ON COLUMN PRODUCT.DESCRIPTION IS '상품설명';
COMMENT ON COLUMN PRODUCT.ATTACHMENT1 IS '첨부파일 1';
COMMENT ON COLUMN PRODUCT.ATTACHMENT2 IS '첨부파일 2';
COMMENT ON COLUMN PRODUCT.ATTACHMENT3 IS '첨부파일 3';
COMMENT ON COLUMN PRODUCT.ATTACHMENT4 IS '첨부파일 4';
COMMENT ON COLUMN PRODUCT.SELLER_NO IS '판매자 식별키';
COMMENT ON COLUMN PRODUCT.COUPON_NO IS '쿠폰 식별키';

----- 상품 시퀀스
CREATE SEQUENCE SEQ_PRODUCT_NO
START WITH 120031
MAXVALUE 999999
NOCACHE;

 --주문 테이블--
CREATE TABLE ORDERS
(ORDER_NO VARCHAR2(20) CONSTRAINT ORDER_NO_PK PRIMARY KEY,
ORDER_DATE DATE DEFAULT  SYSDATE CONSTRAINT ORDER_DATE_NN NOT NULL,
ORDER_PRICE NUMBER CONSTRAINT ORDER_PRICE_NN NOT NULL,
COUPON_YN CHAR(1) CONSTRAINT COUPON_YN_CK CHECK(COUPON_YN IN('Y','N')),
ORDER_STATUS CHAR(1) CONSTRAINT ORDER_STATUS_CK_NN NOT NULL CHECK (ORDER_STATUS IN (1,2,3,4)),
PRODUCT_NO NUMBER CONSTRAINT PRODUCT_NO_NN NOT NULL,
CON_NO NUMBER CONSTRAINT CON_NO_NN NOT NULL);

--주문 코멘트--
COMMENT ON COLUMN ORDERS.ORDER_NO IS '주문번호';
COMMENT ON COLUMN ORDERS.ORDER_DATE IS '주문일시';
COMMENT ON COLUMN ORDERS.ORDER_PRICE IS '주문금액';
COMMENT ON COLUMN ORDERS.COUPON_YN IS '쿠폰사용여부';
COMMENT ON COLUMN ORDERS.ORDER_STATUS IS '구매상태';
COMMENT ON COLUMN ORDERS.PRODUCT_NO IS '상품키';
COMMENT ON COLUMN ORDERS.CON_NO IS '고객번호';
    
--주문번호 시퀀스--
CREATE SEQUENCE SEQ_ORDER_NO
START WITH 24130
MAXVALUE 99999
NOCACHE;

-- 결제테이블 --
CREATE TABLE PAYMENT(
        PAYMENT_NO VARCHAR2(50) CONSTRAINT PAYMENT_NO_PK PRIMARY KEY,
        PAYMENT_STATUS CHAR(1) DEFAULT 'Y' CONSTRAINT PAYMENT_STATUS_NN NOT NULL CHECK(PAYMENT_STATUS IN ('Y', 'N')),
        PAYMENT_DATE DATE DEFAULT SYSDATE CONSTRAINT PAYMENT_DATE_NN NOT NULL,
        REFUND_DATE DATE,
        PAYMENT_BILL NUMBER CONSTRAINT PAYMENT_BILL_NN NOT NULL,
        ORDER_NO VARCHAR2(20) CONSTRAINT ORDER_NO_NN NOT NULL
);
        
-- 결제테이블 코멘트--
COMMENT ON COLUMN PAYMENT.PAYMENT_NO IS '결제번호';
COMMENT ON COLUMN PAYMENT.PAYMENT_STATUS IS '결제상태(Y/N)';
COMMENT ON COLUMN PAYMENT.PAYMENT_DATE IS '결제일';
COMMENT ON COLUMN PAYMENT.REFUND_DATE IS '환불일';
COMMENT ON COLUMN PAYMENT.PAYMENT_BILL IS '결제금액';
COMMENT ON COLUMN PAYMENT.ORDER_NO IS '주문번호';

-- 정산테이블--
CREATE TABLE SETTLEMENT (
    SELLER_NO NUMBER CONSTRAINT SETTLEMENT_SELLER_NO_NN NOT NULL,
    ORDER_NO VARCHAR2(20) CONSTRAINT SETTLEMENT_ORDER_NO_NN NOT NULL,
    COUPON_NO CHAR(8),
    SETTLE_DATE DATE DEFAULT SYSDATE CONSTRAINT SETTLE_DATE_NN NOT NULL,
    COMMITION NUMBER CONSTRAINT COMMITION_NN NOT NULL,
    SETTLE_DEPT NUMBER CONSTRAINT SETTLE_DETE_NN NOT NULL,
    TAX_AMOUNT NUMBER CONSTRAINT TAX_AMOUNT_NN NOT NULL,
    SUPPLY_VALUE NUMBER CONSTRAINT SUPPLY_VALUE_NN NOT NULL,
    PAYMENT_NO VARCHAR2(50) CONSTRAINT SETTLEMENT_PAYMENT_NO_NN NOT NULL
);

-- 정산테이블 코멘트 --
COMMENT ON COLUMN SETTLEMENT.SELLER_NO IS '판매자';
COMMENT ON COLUMN SETTLEMENT.ORDER_NO IS '주문번호';
COMMENT ON COLUMN SETTLEMENT.COUPON_NO IS '쿠폰번호';
COMMENT ON COLUMN SETTLEMENT.SETTLE_DATE IS '정산일';
COMMENT ON COLUMN SETTLEMENT.COMMITION IS '수수료금액';
COMMENT ON COLUMN SETTLEMENT.SETTLE_DEPT IS '정산금액';
COMMENT ON COLUMN SETTLEMENT.TAX_AMOUNT IS '세액';
COMMENT ON COLUMN SETTLEMENT.SUPPLY_VALUE IS '공급가액';
COMMENT ON COLUMN SETTLEMENT.PAYMENT_NO IS '결제번호';
    
-- 1:1 문의 외래키 추가
ALTER TABLE INQUIRY ADD CONSTRAINT INQUIRY_SELLER_NO_FK FOREIGN KEY (SELLER_NO) REFERENCES SELLER(SELLER_NO);

-- 스토어 쿠폰 외래키 추가
ALTER TABLE COUPON_STORE ADD CONSTRAINT COUPON_STORE_SELLER_NO_FK FOREIGN KEY (SELLER_NO) REFERENCES SELLER(SELLER_NO);

-- 키보더 쿠폰 외래키 추가
ALTER TABLE COUPON_KEYBOARDER ADD CONSTRAINT COUPON_KEYBOARDER_SELLER_NO_FK FOREIGN KEY (SELLER_NO) REFERENCES SELLER(SELLER_NO);

-- 상품테이블 외래키 추가
ALTER TABLE PRODUCT ADD CONSTRAINT PRODUCT_SELLER_NO_FK FOREIGN KEY (SELLER_NO) REFERENCES SELLER(SELLER_NO);
ALTER TABLE PRODUCT ADD CONSTRAINT PRODUCT_COUPON_NO_FK FOREIGN KEY (COUPON_NO) REFERENCES COUPON_STORE(COUPON_NO);

-- 주문 외래키 추가
ALTER TABLE ORDERS ADD CONSTRAINT ORDERS_PRODUCT_NO_FK FOREIGN KEY (PRODUCT_NO) REFERENCES PRODUCT(PRODUCT_NO);
ALTER TABLE ORDERS ADD CONSTRAINT ORDERS_CON_NO_FK FOREIGN KEY (CON_NO) REFERENCES CONSUMER(CON_NO);

-- 결제 외래키 추가
ALTER TABLE PAYMENT ADD CONSTRAINT PAYMENT_ORDER_NO_FK FOREIGN KEY (ORDER_NO) REFERENCES ORDERS(ORDER_NO);

-- 정산 외래키 추가
ALTER TABLE SETTLEMENT ADD CONSTRAINT SETTLEMENT_SELLER_NO_FK FOREIGN KEY (SELLER_NO) REFERENCES SELLER(SELLER_NO);
ALTER TABLE SETTLEMENT ADD CONSTRAINT SETTLEMENT_ORDER_NO_FK FOREIGN KEY (ORDER_NO) REFERENCES ORDERS(ORDER_NO);
ALTER TABLE SETTLEMENT ADD CONSTRAINT SETTLEMENT_COUPON_NO_FK FOREIGN KEY (COUPON_NO) REFERENCES COUPON_KEYBOARDER(COUPON_NO);
ALTER TABLE SETTLEMENT ADD CONSTRAINT SETTLEMENT_PAYMENT_NO_FK FOREIGN KEY (PAYMENT_NO) REFERENCES PAYMENT(PAYMENT_NO);