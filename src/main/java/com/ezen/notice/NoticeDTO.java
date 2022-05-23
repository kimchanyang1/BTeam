package com.ezen.notice;

/*
create table notice(
nt_no NUMBER(6) PRIMARY KEY,
mem_no NUMBER(6),
mem_nickname VARCHAR2(20),
nt_writeday DATE DEFAULT SYSDATE,
nt_title VARCHAR2(80),
nt_content VARCHAR2(2000),
nt_readcount NUMBER(6));

CREATE SEQUENCE notice_seq;

INSERT INTO notice VALUES (NOTICE_SEQ.nextval, 1, '예제용', sysdate, '샘플1', '샘플내용1', 0);
INSERT INTO notice VALUES (NOTICE_SEQ.nextval, 1, '예제용', sysdate, '샘플2', '샘플내용2', 0);
INSERT INTO notice VALUES (NOTICE_SEQ.nextval, 1, '예제용', sysdate, '샘플3', '샘플내용3', 0);
INSERT INTO notice VALUES (NOTICE_SEQ.nextval, 1, '예제용', sysdate, '샘플4', '샘플내용4', 0);
INSERT INTO notice VALUES (NOTICE_SEQ.nextval, 1, '예제용', sysdate, '샘플5', '샘플내용5', 0);
INSERT INTO notice VALUES (NOTICE_SEQ.nextval, 1, '예제용', sysdate, '샘플6', '샘플내용6', 0);
INSERT INTO notice VALUES (NOTICE_SEQ.nextval, 1, '예제용', sysdate, '샘플7', '샘플내용7', 0);
INSERT INTO notice VALUES (NOTICE_SEQ.nextval, 1, '예제용', sysdate, '샘플8', '샘플내용8', 0);
INSERT INTO notice VALUES (NOTICE_SEQ.nextval, 1, '예제용', sysdate, '샘플9', '샘플내용9', 0);
INSERT INTO notice VALUES (NOTICE_SEQ.nextval, 1, '예제용', sysdate, '샘플10', '샘플내용10', 0);
INSERT INTO notice VALUES (NOTICE_SEQ.nextval, 1, '예제용', sysdate, '샘플11', '샘플내용11', 0);
INSERT INTO notice VALUES (NOTICE_SEQ.nextval, 1, '예제용', sysdate, '샘플12', '샘플내용12', 0);
INSERT INTO notice VALUES (NOTICE_SEQ.nextval, 1, '예제용', sysdate, '샘플13', '샘플내용13', 0);
INSERT INTO notice VALUES (NOTICE_SEQ.nextval, 1, '예제용', sysdate, '샘플14', '샘플내용14', 0);
INSERT INTO notice VALUES (NOTICE_SEQ.nextval, 1, '예제용', sysdate, '샘플15', '샘플내용15', 0);
INSERT INTO notice VALUES (NOTICE_SEQ.nextval, 1, '예제용', sysdate, '샘플16', '샘플내용16', 0);
INSERT INTO notice VALUES (NOTICE_SEQ.nextval, 1, '예제용', sysdate, '샘플17', '샘플내용17', 0);
INSERT INTO notice VALUES (NOTICE_SEQ.nextval, 1, '예제용', sysdate, '샘플18', '샘플내용18', 0);
*/

public class NoticeDTO {
	int nt_no, mem_no;
	String mem_nickname, nt_writeday, nt_title, nt_content;
	int nt_readcount;
	int rn;
	
	public NoticeDTO() {
	}

	public NoticeDTO(int nt_no, int mem_no, String mem_nickname, String nt_writeday, String nt_title, String nt_content,
			int nt_readcount) {
		super();
		this.nt_no = nt_no;
		this.mem_no = mem_no;
		this.mem_nickname = mem_nickname;
		this.nt_writeday = nt_writeday;
		this.nt_title = nt_title;
		this.nt_content = nt_content;
		this.nt_readcount = nt_readcount;
	}

	public int getNt_no() {
		return nt_no;
	}

	public void setNt_no(int nt_no) {
		this.nt_no = nt_no;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public String getMem_nickname() {
		return mem_nickname;
	}

	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}

	public String getNt_writeday() {
		return nt_writeday;
	}

	public void setNt_writeday(String nt_writeday) {
		this.nt_writeday = nt_writeday;
	}

	public String getNt_title() {
		return nt_title;
	}

	public void setNt_title(String nt_title) {
		this.nt_title = nt_title;
	}

	public String getNt_content() {
		return nt_content;
	}

	public void setNt_content(String nt_content) {
		this.nt_content = nt_content;
	}

	public int getNt_readcount() {
		return nt_readcount;
	}

	public void setNt_readcount(int nt_readcount) {
		this.nt_readcount = nt_readcount;
	}

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}
	
}
