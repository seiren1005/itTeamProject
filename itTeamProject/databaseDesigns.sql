/*
 * DB 에 사용자 추가하기
 * 
 * 1) cmd 에서 사용자 생성 및 권한 부여
 * 	sqlplus "/as sysdba"
 * 	create user username identified by password;
 * 		공통 사용자 또는 롤 이름이 부적합합니다 오류시
 * 		c##username 으로 명령어 실행
 * 	grant connect, resource, dba to c##username;
 * 		새로 생성한 계정에 접근 권한 부여
 * 
 * 
 * 2) + 아이콘 눌러서
 * 	접속 이름: DB 명
 * 	사용자 이름: cmd 로 생성한 DB username (c##username)
 *  비밀번호: cmd 로 설정한 password
 * 	호스트이름: localhost
 * 	포트: 1521
 * 	SID: xe
 * 	
 * 적고 테스트 후 저장하고 접속
 * 
 * 
 * 3) 
 * 
 */


-- Create table for board
CREATE TABLE tbl_board(
	bno NUMBER(10, 0),
	title VARCHAR2(200) NOT NULL,
	content VARCHAR2(2000) NOT NULL,
	writer VARCHAR2(50) NOT NULL,
	regdate DATE DEFAULT SYSDATE,
	moddate DATE DEFAULT SYSDATE
);


-- 특정 이름으로 제약조건을 주기
ALTER TABLE tbl_board -- 변경하려는 table
ADD CONSTRAINT pk_tbl_board -- 제약조건 이름
PRIMARY KEY (bno); -- 제약조건(주려는 컬럼)


-- Create sequence for board number (bno)
CREATE SEQUENCE seq_tbl_board
INCREMENT BY 1
START WITH 1
MINVALUE 0
MAXVALUE 999999999
CYCLE;


COMMIT;


DROP TABLE tbl_board;


DROP SEQUENCE seq_tbl_board;


COMMIT;


CREATE TABLE tbl_board(
	bno NUMBER(10, 0),
	title VARCHAR2(200) NOT NULL,
	content VARCHAR2(2000) NOT NULL,
	writer VARCHAR2(50) NOT NULL,
	regdate DATE DEFAULT SYSDATE,
	moddate DATE DEFAULT SYSDATE
);


ALTER TABLE tbl_board -- 변경하려는 table
ADD CONSTRAINT pk_tbl_board -- 제약조건 이름
PRIMARY KEY (bno); -- 제약조건(주려는 컬럼)


CREATE SEQUENCE seq_tbl_board
INCREMENT BY 1
START WITH 1
MINVALUE 0
MAXVALUE 999999999
CYCLE;


CREATE TABLE tbl_reply (
	rno NUMBER(10, 0),
	bno NUMBER(10, 0) NOT NULL,
	reply VARCHAR2(1000) NOT NULL,
	replyer VARCHAR2(50) NOT NULL,
	replyregdate DATE DEFAULT SYSDATE,
	replymoddate DATE DEFAULT SYSDATE
);

DROP TABLE tbl_reply;
DROP SEQUENCE seq_tbl_reply;

CREATE SEQUENCE seq_tbl_reply
MINVALUE 1
MAXVALUE 999999999
INCREMENT BY 1
START WITH 1
CYCLE;


ALTER TABLE tbl_reply
ADD CONSTRAINT pk_reply PRIMARY KEY (rno);


ALTER TABLE tbl_reply
ADD CONSTRAINT fk_reply_board FOREIGN KEY (bno)
REFERENCES tbl_board (bno);


COMMIT;


ALTER TABLE tbl_board
ADD (replycnt NUMBER DEFAULT 0);

