DROP TABLE TB_PAY;
DROP TABLE TB_BOARD;
DROP TABLE TB_CERTIFICATE;
DROP TABLE TB_RESUME_BOARD;
DROP TABLE TB_DEPARTMENT;
DROP TABLE TB_CLASS;
DROP TABLE TB_SCHEDULE_CHANGE;
DROP TABLE TB_REPLY;
DROP TABLE TB_LEAVE;
DROP TABLE TB_SCHEDULE;
DROP TABLE TB_ATTENDANCE;
DROP TABLE TB_FEEDBACK;
DROP TABLE TB_CLASS_TIME;
DROP TABLE TB_SETTING;
DROP TABLE TB_USER;

DROP SEQUENCE SEQ_USER_NO;
DROP SEQUENCE SEQ_CLASS_NO;
DROP SEQUENCE SEQ_SCHEDULE_NO;
DROP SEQUENCE SEQ_ATTENDANCE_NO;
DROP SEQUENCE SEQ_PAY_NO;
DROP SEQUENCE SEQ_BOARD_NO;
DROP SEQUENCE SEQ_REPLY_NO;
DROP SEQUENCE SEQ_RESUME_NO;
DROP SEQUENCE SEQ_FEEDBACK_NO;
DROP SEQUENCE SEQ_CERT_NO;
DROP SEQUENCE SEQ_LEAVE_NO;
DROP SEQUENCE SEQ_CHANGE_NO;

CREATE TABLE TB_DEPARTMENT (
   DEPARTMENT_NO   NUMBER   NOT NULL,
   DEPARTMENT_CODE   NUMBER   NOT NULL
);

CREATE TABLE TB_PAY (
    PAY_NO NUMBER NOT NULL,
    PAY_DATE DATE DEFAULT SYSDATE NULL,
    BANK_NAME VARCHAR2(20) NOT NULL,
    ACCOUNT_NUMBER VARCHAR2(50) NOT NULL,
    REQUIRED_DAYS NUMBER NOT NULL,
    ACTUAL_DAYS NUMBER NULL,
    ATTENDANCE_RATE NUMBER NULL,
    AMOUNT VARCHAR2(20) NULL,
    NOTE VARCHAR2(50) NULL,
    USER_NO NUMBER NOT NULL
);

CREATE TABLE TB_SCHEDULE (
    SCHEDULE_NO NUMBER NOT NULL,
    TITLE VARCHAR2(50) NOT NULL,
    START_DATE DATE NOT NULL,
    END_DATE DATE NOT NULL,
    DESCRIPTION VARCHAR2(50) NULL,
    TYPE CHAR(5) NULL,
    CLASS_NO NUMBER NOT NULL
);
COMMENT ON COLUMN TB_SCHEDULE.TYPE IS '1 휴강 || 2 강의 일정 || 3 보강';

COMMENT ON COLUMN TB_SCHEDULE.SCHEDULE_NO IS '강의 일정 번호';
COMMENT ON COLUMN TB_SCHEDULE.TITLE IS '강의 일정 명';
COMMENT ON COLUMN TB_SCHEDULE.START_DATE IS '강의 일정 시작일';
COMMENT ON COLUMN TB_SCHEDULE.END_DATE IS '강의 일정 종료일';
COMMENT ON COLUMN TB_SCHEDULE.DESCRIPTION IS '강의 일정 설명';
COMMENT ON COLUMN TB_SCHEDULE.CLASS_NO IS '강의 번호';

CREATE TABLE TB_BOARD (
    BOARD_NO NUMBER NOT NULL,
    TITLE VARCHAR2(50) NOT NULL,
    CONTENT VARCHAR2(300) NULL,
    CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
    COUNT NUMBER DEFAULT 0 NOT NULL,
    BRANCH VARCHAR2(20) NULL,
    TYPE NUMBER NOT NULL,
    ORIGIN_NAME VARCHAR2(100) NULL,
    CHANGE_NAME VARCHAR2(100) NULL,
    USER_NO NUMBER NOT NULL,
    CLASS_NO NUMBER NULL,
    BOARD_STATUS CHAR DEFAULT 'Y' NOT NULL
);

COMMENT ON COLUMN TB_BOARD.TYPE IS '공지사항 1 | 우리반 게시판 2 | 사내게시판 3';
CREATE TABLE TB_RESUME_BOARD (
    RESUME_NO NUMBER NOT NULL,
    USER_NO NUMBER NOT NULL,
    TYPE NUMBER NOT NULL,
    TITLE VARCHAR2(50) NOT NULL,
    CHANGE_NAME VARCHAR2(255) NOT NULL,
    ORIGIN_NAME VARCHAR2(255) NOT NULL,
    CONTENT VARCHAR2(255) NULL, 
    CREATED_DATE DATE DEFAULT SYSDATE NULL,
    UPDATE_DATE DATE DEFAULT SYSDATE NULL
);

COMMENT ON COLUMN TB_RESUME_BOARD.TYPE IS '자소서 1 | 이력서 2';

DROP TABLE TB_LEAVE;
CREATE TABLE TB_LEAVE (
    LEAVE_NO NUMBER NOT NULL,
    TYPE NUMBER NOT NULL,
    CATEGORY NUMBER NOT NULL,
    START_DATE VARCHAR2(30) NOT NULL,
    END_DATE VARCHAR2(30) NOT NULL,
    DAYS_DEDUCTED NUMBER NOT NULL,
    REASON VARCHAR2(50) NULL,
    STATUS NUMBER DEFAULT 3 NOT NULL,
     CHANGE_NAME VARCHAR2(255) NULL,
    ORIGIN_NAME VARCHAR2(255) NULL,
    REQUEST_DATE DATE DEFAULT SYSDATE NOT NULL,
    APPROVE_DATE DATE NULL,
    REJECT_REASON VARCHAR2(50) NULL,
    USER_NO NUMBER NOT NULL
);

COMMENT ON COLUMN TB_LEAVE.TYPE IS '휴가 1 | 병가 2';
COMMENT ON COLUMN TB_LEAVE.CATEGORY IS '종일 1 | 오전 2 | 오후 3';
COMMENT ON COLUMN TB_LEAVE.STATUS IS '요청중 3 | 승인 1 | 반려 2';

CREATE TABLE TB_REPLY (
    REPLY_NO NUMBER NOT NULL,
    CONTENT VARCHAR2(300) NULL,
    CREATE_DATE DATE NOT NULL,
    USER_NO NUMBER NOT NULL,
    BOARD_NO NUMBER NOT NULL
);

CREATE TABLE TB_ATTENDANCE (
    ATTENDANCE_NO NUMBER NOT NULL,
    CLASS_DATE VARCHAR2(20) NOT NULL,
    CHECK_IN_TIME VARCHAR2(20) NULL,
    CHECK_OUT_TIME VARCHAR2(20) NULL,
    STATUS VARCHAR2(20) NULL,
    USER_NO NUMBER NOT NULL
);

CREATE TABLE TB_CLASS_TIME (
    CLASS_DATE VARCHAR2(50) NOT NULL,
    CLASS_START_TIME VARCHAR2(30) NOT NULL,
    CLASS_END_TIME VARCHAR2(30) NOT NULL,
    CLASS_NO NUMBER NOT NULL
);

CREATE TABLE TB_CLASS (
    CLASS_NO NUMBER NOT NULL,
    CLASS_NAME VARCHAR2(50) NOT NULL,
    START_DATE DATE NOT NULL,
    END_DATE DATE NOT NULL,
    COURSE_NAME VARCHAR2(50) NOT NULL,
    DESCRIPTION VARCHAR2(100) NOT NULL,
    USER_NO NUMBER NOT NULL,
    ROOM_NAME VARCHAR2(50) NULL
);

COMMENT ON COLUMN TB_CLASS.USER_NO IS '강사번호';

CREATE TABLE TB_USER (
    USER_NO NUMBER NOT NULL,
    CLASS_NO NUMBER NULL,
    USER_ID VARCHAR2(255)   NOT NULL UNIQUE,
    USER_PWD VARCHAR2(255) NOT NULL,
    USER_NAME VARCHAR2(50) NOT NULL,
    USER_ROLE NUMBER DEFAULT '1' NOT NULL,
    USER_PHONE VARCHAR2(20) NOT NULL,
    USER_EMAIL VARCHAR2(20) NOT NULL,
    USER_ADDRESS VARCHAR2(100) NOT NULL,
    USER_ADDRESS_DETAIL VARCHAR2(100) NOT NULL,
    USER_BIRTH DATE NOT NULL,
    USER_JOIN_DATE DATE DEFAULT SYSDATE NOT NULL,
    USER_STATUS CHAR DEFAULT 'C' NOT NULL,
    USER_PROFILE_IMG VARCHAR2(255) NULL,
    DEPARTMENT_NO NUMBER NULL
);

COMMENT ON COLUMN TB_USER.CLASS_NO IS '학생만 가짐';
COMMENT ON COLUMN TB_USER.USER_ID IS 'unique';
COMMENT ON COLUMN TB_USER.USER_ROLE IS '기본-학생(1), 추후 강사(2),관리자(3) 선택';
COMMENT ON COLUMN TB_USER.USER_JOIN_DATE IS 'sysdate';
COMMENT ON COLUMN TB_USER.USER_PROFILE_IMG IS '이미지 경로 저장';
COMMENT ON COLUMN TB_USER.USER_STATUS IS '대기:C (DEFAULT), 정상: Y, 탈퇴: N';

DROP TABLE TB_CERTIFICATE;
CREATE TABLE TB_CERTIFICATE (
    CERT_NO NUMBER NOT NULL,
    UNIT_NAME VARCHAR2(20) NOT NULL,
    EVAL_DATE VARCHAR2(30) NULL,
    MAIN_SCORE NUMBER NULL,
    FINAL_SCORE NUMBER NULL,
    CERT_LEVEL NUMBER NULL,
    RESULT VARCHAR2(10) NULL,
    CHANGE_NAME VARCHAR2(255) NULL,
    ORIGIN_NAME VARCHAR2(255) NULL,
    USER_NO NUMBER NOT NULL
);

COMMENT ON COLUMN TB_CERTIFICATE.CERT_LEVEL IS '1등급 | 2등급과 같은 방식으로 1 | 2 작성';
COMMENT ON COLUMN TB_CERTIFICATE.RESULT IS '통과 | 재시험';

CREATE TABLE TB_FEEDBACK (
    FEEDBACK_NO NUMBER NOT NULL,
    CONTENT VARCHAR2(225) NULL,
    WRITE_DATE DATE NOT NULL,
    RESUME_NO NUMBER NOT NULL,
    USER_NO NUMBER NOT NULL
);

CREATE TABLE TB_SCHEDULE_CHANGE (
    CHANGE_NO NUMBER NOT NULL,
    REASON VARCHAR2(50) NULL,
    REQUEST_DATE DATE DEFAULT SYSDATE NOT NULL,
    START_DATE VARCHAR2(30) NOT NULL,
    END_DATE VARCHAR2(30) NOT NULL,
    CLASS_NO NUMBER NOT NULL,
    USER_NO NUMBER NOT NULL
);

CREATE TABLE TB_SETTING (
        SETTING_NO	NUMBER	NOT NULL,
	SITE_NAME	VARCHAR2(20)	NOT NULL,
	LOGO_PATH	VARCHAR2(20)	NOT NULL,
	LATE_ABSENT_RATIO	NUMBER	NOT NULL
);


-- Primary Key 추가
ALTER TABLE TB_DEPARTMENT ADD CONSTRAINT PK_TB_DEPARTMENT PRIMARY KEY (DEPARTMENT_NO);
ALTER TABLE TB_PAY ADD CONSTRAINT PK_TB_PAY PRIMARY KEY (PAY_NO);
ALTER TABLE TB_SCHEDULE ADD CONSTRAINT PK_TB_SCHEDULE PRIMARY KEY (SCHEDULE_NO);
ALTER TABLE TB_BOARD ADD CONSTRAINT PK_TB_BOARD PRIMARY KEY (BOARD_NO);
ALTER TABLE TB_RESUME_BOARD ADD CONSTRAINT PK_TB_RESUME_BOARD PRIMARY KEY (RESUME_NO);
ALTER TABLE TB_LEAVE ADD CONSTRAINT PK_TB_LEAVE PRIMARY KEY (LEAVE_NO);
ALTER TABLE TB_REPLY ADD CONSTRAINT PK_TB_REPLY PRIMARY KEY (REPLY_NO);
ALTER TABLE TB_ATTENDANCE ADD CONSTRAINT PK_TB_ATTENDANCE PRIMARY KEY (ATTENDANCE_NO);
ALTER TABLE TB_CLASS ADD CONSTRAINT PK_TB_CLASS PRIMARY KEY (CLASS_NO);
ALTER TABLE TB_USER ADD CONSTRAINT PK_TB_USER PRIMARY KEY (USER_NO);
ALTER TABLE TB_CERTIFICATE ADD CONSTRAINT PK_TB_CERTIFICATE PRIMARY KEY (CERT_NO);
ALTER TABLE TB_FEEDBACK ADD CONSTRAINT PK_TB_FEEDBACK PRIMARY KEY (FEEDBACK_NO);
ALTER TABLE TB_SCHEDULE_CHANGE ADD CONSTRAINT PK_TB_SCHEDULE_CHANGE PRIMARY KEY (CHANGE_NO);


-- 시퀀스 생성
CREATE SEQUENCE SEQ_USER_NO START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE SEQ_CLASS_NO START WITH 1001 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE SEQ_SCHEDULE_NO START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE SEQ_ATTENDANCE_NO START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE SEQ_PAY_NO START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE SEQ_BOARD_NO START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE SEQ_REPLY_NO START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE SEQ_RESUME_NO START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE SEQ_FEEDBACK_NO START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE SEQ_CERT_NO START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE SEQ_LEAVE_NO START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE SEQ_CHANGE_NO START WITH 1 INCREMENT BY 1 NOCACHE;

-- 기존 LOGO_PATH 컬럼 삭제
ALTER TABLE TB_SETTING
    DROP COLUMN LOGO_PATH;

-- ORIGIN_NAME 컬럼 추가
ALTER TABLE TB_SETTING
    ADD ORIGIN_NAME VARCHAR2(255);

-- CHANGE_NAME 컬럼 추가
ALTER TABLE TB_SETTING
    ADD CHANGE_NAME VARCHAR2(255);

ALTER TABLE TB_SETTING
    DROP COLUMN LATE_ABSENT_RATIO;

-- 지각 일수 설정 컬럼 추가
ALTER TABLE TB_SETTING
    ADD LATE NUMBER;

-- 결석 일수 설정 컬럼 추가
ALTER TABLE TB_SETTING
    ADD ABSENT NUMBER;

CREATE SEQUENCE SEQ_SETTING_NO START WITH 1 INCREMENT BY 1 NOCACHE;

commit;