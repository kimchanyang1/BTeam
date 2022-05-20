package com.ezen.reply;

/* 
CREATE TABLE reply(
rep_table VARCHAR2(20),
rep_originno NUMBER(6, 0) PRIMARY KEY,
rep_no NUMBER(6, 0),
rep_nickname VARCHAR2(20),
rep_writeday VARCHAR2(20),
rep_content VARCHAR2(20),
rep_repno NUMBER(6, 0),
rep_step NUMBER(6, 0),
rep_indent NUMBER(6, 0));

CREATE SEQUENCE rep_no;
 */

public class ReplyDTO {

	String rep_table; //����� �� �Խñ��� �Խ���
	int rep_originno; //����� �� �Խñ��� ��ȣ
	int rep_no; //��� ��ȣ. ������
	String rep_nickname; //��� �ۼ��� �г���
	String rep_writeday; //��� �ۼ���¥
	String rep_content; //��� ����
	int rep_repno; //����� �� ����� ��ȣ
	int rep_step; //��� �鿩����
	int rep_indent; //��� ��������
	
	public ReplyDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReplyDTO(String rep_table, int rep_originno, int rep_no, String rep_nickname, String rep_writeday,
			String rep_content, int rep_repno, int rep_step, int rep_indent) {
		super();
		this.rep_table = rep_table;
		this.rep_originno = rep_originno;
		this.rep_no = rep_no;
		this.rep_nickname = rep_nickname;
		this.rep_writeday = rep_writeday;
		this.rep_content = rep_content;
		this.rep_repno = rep_repno;
		this.rep_step = rep_step;
		this.rep_indent = rep_indent;
	}

	public String getRep_table() {
		return rep_table;
	}

	public void setRep_table(String rep_table) {
		this.rep_table = rep_table;
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

	public String getRep_nickname() {
		return rep_nickname;
	}

	public void setRep_nickname(String rep_nickname) {
		this.rep_nickname = rep_nickname;
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
