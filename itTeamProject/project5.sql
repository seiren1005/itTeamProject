
DROP TABLE tbl_reply;

DROP TABLE tbl_board;

DROP SEQUENCE seq_board;

DROP SEQUENCE seq_reply;


CREATE TABLE tbl_board(
	bno NUMBER(10, 0),
	purpose VARCHAR2(1) NOT NULL,
	title VARCHAR2(200) NOT NULL,
	content VARCHAR2(2000) NOT NULL,
	writer VARCHAR2(50) NOT NULL,
	secret VARCHAR2(1),
	regdate DATE DEFAULT SYSDATE,
	moddate DATE DEFAULT SYSDATE
);

ALTER TABLE tbl_board
ADD (replycnt NUMBER DEFAULT 0);


CREATE SEQUENCE seq_board
INCREMENT BY 1
START WITH 1
MINVALUE 0
MAXVALUE 999999999
CYCLE;


ALTER TABLE tbl_board
ADD CONSTRAINT pk_board
PRIMARY KEY (bno);


CREATE TABLE tbl_reply (
	rno NUMBER(10, 0),
	bno NUMBER(10, 0) NOT NULL,
	reply VARCHAR2(1000) NOT NULL,
	replyer VARCHAR2(50) NOT NULL,
	replyregdate DATE DEFAULT SYSDATE,
	replymoddate DATE DEFAULT SYSDATE
);


CREATE SEQUENCE seq_reply
MINVALUE 1
MAXVALUE 999999999
INCREMENT BY 1
START WITH 1
CYCLE;


ALTER TABLE tbl_reply
ADD CONSTRAINT pk_reply PRIMARY KEY (rno);


ALTER TABLE tbl_reply
ADD CONSTRAINT fk_reply FOREIGN KEY (bno)
REFERENCES tbl_board (bno);


COMMIT;


ALTER TABLE tbl_reply
ADD (adoption VARCHAR2(8) DEFAULT '');


ALTER TABLE tbl_board
ADD (privacy VARCHAR2(4) DEFAULT 'no');


COMMIT;

ALTER TABLE tbl_board
DROP COLUMN privacy;

ALTER TABLE tbl_board
DROP COLUMN secret;

ALTER TABLE tbl_board
ADD (privacy VARCHAR2(3) DEFAULT 'no');


COMMIT;


ALTER TABLE tbl_board
ADD (secret VARCHAR2(3) DEFAULT 'no');


COMMIT;


-- Creat table for attachment
CREATE TABLE tbl_file(
    -- {uuid + filename + uploadpath + imagecheck + regdate}
    -- + {uuid + filename + uploadpath + imagecheck + regdate}
    -- ...
	filename VARCHAR2(4000) NOT NULL,
    bno NUMBER(10) NOT NULL
);


-- Set a primary key at tbl_attachment
ALTER TABLE tbl_file
ADD CONSTRAINT pk_file PRIMARY KEY (filename);

-- Set a Foreign key at tbl_attachment
ALTER TABLE tbl_file
ADD CONSTRAINT fk_file FOREIGN KEY (bno)
REFERENCES tbl_board (bno);


COMMIT;


DROP TABLE tbl_attachment;