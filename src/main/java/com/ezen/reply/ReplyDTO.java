package com.ezen.reply;

/* 
CREATE TABLE reply(
rep_table VARCHAR2(20),
rep_originno NUMBER(6, 0),
rep_no NUMBER(6, 0) PRIMARY KEY,
rep_id VARCHAR2(20),
rep_writeday DATE DEFAULT SYSDATE,
rep_content VARCHAR2(2000));

CREATE SEQUENCE rep_no;
 */

public class ReplyDTO {
	
	int rep_originno; //댓글 원래글번호
	int rep_no; //댓글 글번호
	String rep_id; //댓글 적은사람
	String rep_writeday; //댓글 적은날짜
	String rep_content; //댓글 내용
	
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
}
