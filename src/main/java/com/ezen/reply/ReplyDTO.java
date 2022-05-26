package com.ezen.reply;

/* 
CREATE TABLE reply(
rep_table VARCHAR2(20),
rep_originno NUMBER(6, 0),
rep_no NUMBER(6, 0) PRIMARY KEY,
rep_id VARCHAR2(20),
rep_writeday DATE DEFAULT SYSDATE,
rep_content VARCHAR2(2000),
rep_repno NUMBER(6, 0),
rep_step NUMBER(6, 0),
rep_indent NUMBER(6, 0)
);

CREATE SEQUENCE rep_no;
 */

public class ReplyDTO {
	
	int rep_originno; //댓글 원래글번호
	int rep_no; //댓글 글번호
	String rep_id; //댓글 적은사람
	String rep_writeday; //댓글 적은날짜
	String rep_content; //댓글 내용
	String rep_table;//원래글 테이블
	int rep_repno;// 원래 댓글 번호
	int rep_step;//내려쓰기
	int rep_indent;//들여쓰기
	
	public ReplyDTO() {
		super();
	}

	public ReplyDTO(int rep_originno, int rep_no, String rep_id, String rep_writeday, String rep_content) {
		super();
		this.rep_originno = rep_originno;
		this.rep_no = rep_no;
		this.rep_id = rep_id;
		this.rep_writeday = rep_writeday;
		this.rep_content = rep_content;
	}

	public int getRep_originno() {
		return rep_originno;
	}

	public void setRep_originno(int rep_originno) {
		this.rep_originno = rep_originno;
	}

	public int getRep_no() {
		return rep_no;
	}

	public void setRep_no(int rep_no) {
		this.rep_no = rep_no;
	}

	public String getRep_id() {
		return rep_id;
	}

	public void setRep_id(String rep_id) {
		this.rep_id = rep_id;
	}

	public String getRep_writeday() {
		return rep_writeday;
	}

	public void setRep_writeday(String rep_writeday) {
		this.rep_writeday = rep_writeday;
	}

	public String getRep_content() {
		return rep_content;
	}

	public void setRep_content(String rep_content) {
		this.rep_content = rep_content;
	}

	public String getRep_table() {
		return rep_table;
	}

	public void setRep_table(String rep_table) {
		this.rep_table = rep_table;
	}

	public int getRep_repno() {
		return rep_repno;
	}

	public void setRep_repno(int rep_repno) {
		this.rep_repno = rep_repno;
	}

	public int getRep_step() {
		return rep_step;
	}

	public void setRep_step(int rep_step) {
		this.rep_step = rep_step;
	}

	public int getRep_indent() {
		return rep_indent;
	}

	public void setRep_indent(int rep_indent) {
		this.rep_indent = rep_indent;
	}
	
}
