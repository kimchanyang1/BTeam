package com.ezen.reply;

/* 
CREATE TABLE reply(
rep_originno NUMBER(6, 0),
rep_no NUMBER(6, 0) PRIMARY KEY,
rep_id VARCHAR2(20),
rep_writeday VARCHAR2(20),
rep_content VARCHAR2(20));

CREATE SEQUENCE rep_no;
 */

public class ReplyDTO {

	int rep_originno; //����� �� �Խñ��� ��ȣ
	int rep_no; //��� ��ȣ. ������
	String rep_id; //��� �ۼ��� �г���
	String rep_writeday; //��� �ۼ���¥
	String rep_content; //��� ����
	
	public ReplyDTO() {
		super();
		// TODO Auto-generated constructor stub
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
