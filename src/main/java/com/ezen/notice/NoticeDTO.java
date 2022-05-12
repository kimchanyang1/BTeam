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
*/

public class NoticeDTO {
	int nt_no, mem_no;
	String mem_nickname, nt_writeday, nt_title, nt_content;
	int nt_readcount;
	
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
	
}
