-- ** 1. 테이블 생성 **

------ Customer (고객 테이블)
CREATE TABLE customer (
  customer_id   VARCHAR2(50) PRIMARY KEY,                        -- 고객 ID (계약자 ID)
  password      VARCHAR2(255) NOT NULL,                          -- 비밀번호 (암호화 저장)
  name          VARCHAR2(100) NOT NULL,                          -- 고객 이름
  birth_date    DATE NOT NULL,                                   -- 생년월일
  gender        CHAR(1) NOT NULL  CHECK (gender IN ('M', 'F')),  -- 성별
  phone         VARCHAR2(20) NOT NULL,                           -- 연락처
  email         VARCHAR2(100),                                   -- 이메일
  address       VARCHAR2(255),                                   -- 주소
  role          VARCHAR2(20) DEFAULT 'ROLE_USER',                -- 권한 (ROLE_USER, ROLE_ADMIN 등)
  reg_date      DATE DEFAULT SYSDATE                             -- 등록일
);

------ InsuredPerson (피보험자 테이블)
CREATE TABLE insured_person (
  insured_id     VARCHAR2(50) PRIMARY KEY,                       -- 피보험자 ID
  customer_id    VARCHAR2(50) NOT NULL,                          -- 고객 ID (계약자 참조)
  name           VARCHAR2(100) NOT NULL,                         -- 피보험자 이름
  birth_date     DATE NOT NULL,                                  -- 생년월일
  gender         CHAR(1) NOT NULL  CHECK (gender IN ('M', 'F')), -- 성별
  relationship   VARCHAR2(50),                                   -- 계약자와의 관계 (ex: 본인/배우자/자녀 등..)
  reg_date       DATE DEFAULT SYSDATE,                           -- 등록일
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id)     -- 계약자 참조
);

------ Contract (계약 테이블)
CREATE TABLE contract (
  contract_id   NUMBER PRIMARY KEY,                              -- 계약자 ID
  customer_id   VARCHAR2(50) NOT NULL,                           -- 고객 ID
  insured_id    VARCHAR2(50) NOT NULL,                           -- 피보험자 ID
  product_name  VARCHAR2(100) NOT NULL,                          -- (보험 판매)상품 이름
  start_date    DATE NOT NULL,                                   -- 계약 시작일
  end_date      DATE,                                            -- 계약 만기일
  status        VARCHAR2(20) DEFAULT 'ACTIVE',                   -- 계약 상태
  reg_date      DATE DEFAULT SYSDATE,                            -- 계약 등록일
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id),    -- 계약자 참조
  FOREIGN KEY (insured_id) REFERENCES insured_person(insured_id) -- 피보험자 참조
);

------ Notice (공지사항 테이블)
CREATE TABLE notice (
  notice_id     NUMBER PRIMARY KEY,                             -- 공지사항 번호
  title         VARCHAR2(200) NOT NULL,                         -- 공지사항 제목
  content       VARCHAR2(1000) NOT NULL,                        -- 공지사항 본문 내용
  writer        VARCHAR2(100) DEFAULT '관리자',                  -- 작성자 (기본값 : 관리자)
  reg_date      DATE DEFAULT SYSDATE,                           -- 공지사항 등록일
  update_date   DATE,                                           -- 공지사항 수정일
  view_count    NUMBER(10) DEFAULT 0,                           -- 공지사항 조회수
  important     CHAR(1) DEFAULT 'N'                             -- 공지사항 중요 여부
);

------ News (뉴스 테이블)
CREATE TABLE news (
    news_id           NUMBER PRIMARY KEY,                    -- 뉴스 기사 고유 ID (PK)
    title             VARCHAR2(200) NOT NULL,                -- 뉴스 기사 제목
    content           VARCHAR2(4000) NOT NULL,               -- 뉴스 기사 내용
    published_date    DATE,                                  -- 뉴스 기사 날짜 
    writer            VARCHAR2(100) DEFAULT '관리자',         -- 작성자 (기본값 : 관리자)  
    reg_date          DATE DEFAULT SYSDATE,                  -- 등록 일시 (자동등록)
    view_count        NUMBER(10) DEFAULT 0,                  -- 뉴스 기사 조회수
    important         CHAR(1) DEFAULT 'N'                    -- 뉴스 기사 중요 여부
);


COMMIT;

-- 생성된 테이블 조회
select * from customer;
select * from insured_person;
select * from contract;
select * from notice;
select * from news;

-- ** 2. 시퀀스 생성 **

CREATE SEQUENCE notice_seq                                 -- 공지사항 ID 자동 증가용 시퀀스
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

CREATE SEQUENCE contract_seq                               -- 계약 ID 자동 증가용 시퀀스
  START WITH 101
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;
  
CREATE SEQUENCE news_seq                                   -- 뉴스 ID 자동 증가용 시퀀스
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;  


-- ** 3. 트리거 생성 **
CREATE OR REPLACE TRIGGER trg_contract_id                 -- contract 테이블에 insert 시 contract_seq에서 ID 자동 할당
BEFORE INSERT ON contract
FOR EACH ROW
BEGIN
  SELECT contract_seq.NEXTVAL
    INTO :NEW.contract_id
    FROM dual;
END;


COMMIT;

-- ** 4. 컬럼 타입 수정(선택) **
ATLER TABLE insured_person MODIFY gender varchar2(10);


-- ** 5. 조회 쿼리로 작동 확인 (테스트용 조회 쿼리) **
SELECT 
  c.contract_id,
  c.customer_id,
  cu.name AS customer_name,
  c.insured_id,
  ip.name AS insured_name,
  c.product_name,
  c.start_date,
  c.end_date,
  c.status,
  c.reg_date
FROM contract c
JOIN customer cu ON c.customer_id = cu.customer_id
JOIN insured_person ip ON c.insured_id = ip.insured_id
WHERE c.contract_id = :contractId;

COMMIT;


-- ** 6. 테스트 후 정리
DROP TABLE customer;
DROP TABLE insured_person;
DROP TABLE contract;
DROP TABLE notice;
DROP TABLE News;

DROP SEQUENCE contract_seq;
DROP SEQUENCE notice_seq;


-- 추가 사항
-- 공지사항 댓글 테이블
CREATE TABLE notice_reply (
  rno           NUMBER(10,0),                        -- 댓글 ID
  notice_id     NUMBER(10,0) NOT NULL,               -- 공지사항 ID (FK)
  reply         VARCHAR2(1000) NOT NULL,             -- 댓글 내용
  replyer       VARCHAR2(50) NOT NULL,               -- 작성자
  replyDate     DATE DEFAULT SYSDATE,                -- 작성일
  updateDate    DATE DEFAULT SYSDATE,                -- 수정일
  CONSTRAINT pk_notice_reply PRIMARY KEY (rno),
  CONSTRAINT fk_notice_reply_notice FOREIGN KEY (notice_id)
    REFERENCES notice (notice_id)
);

-- 댓글 인덱스 (페이징 최적화용)
CREATE INDEX idx_notice_reply ON notice_reply(notice_id DESC, rno ASC);

--  댓글 번호 시퀀스
DROP SEQUENCE seq_notice_reply;
CREATE SEQUENCE seq_notice_reply;

-- [확인 쿼리]
SELECT * FROM notice_reply;
SELECT sequence_name FROM user_sequences;


