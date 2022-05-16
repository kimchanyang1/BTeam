package com.ezen.epilogue;

public class EpilogueDTO {
	
/*
------- EPILOUGE 테이블 생성 -------

CREATE TABLE EPILOGUE(
EP_NO NUMBER(6, 0) PRIMARY KEY,
EP_ORIGINNO NUMBER(6, 0),
EP_GB VARCHAR2(20),
EP_TITLE VARCHAR2(80),
MEM_NO NUMBER(6, 0),
MEM_NICKNAME VARCHAR2(20),
EP_WRITEDAY DATE DEFAULT SYSDATE,
EP_CONTENT VARCHAR2(2000),
EP_READCOUNT NUMBER(6, 0),
EP_IMAGE VARCHAR2(50));

CREATE SEQUENCE EP_NO_SEQ;
*/
	
	int ep_no, ep_originno, mem_no, ep_readcount;
	String ep_gb, ep_title, mem_nickname, ep_writeday, ep_content, ep_image;
	
	
	public EpilogueDTO() {
		super();
	}
	
	
	public EpilogueDTO(int ep_no, int ep_originno, int mem_no, int ep_readcount, String ep_gb, String ep_title,
			String mem_nickname, String ep_writeday, String ep_content, String ep_image) {
		super();
		this.ep_no = ep_no;
		this.ep_originno = ep_originno;
		this.mem_no = mem_no;
		this.ep_readcount = ep_readcount;
		this.ep_gb = ep_gb;
		this.ep_title = ep_title;
		this.mem_nickname = mem_nickname;
		this.ep_writeday = ep_writeday;
		this.ep_content = ep_content;
		this.ep_image = ep_image;
	}
	
	
	public int getEp_no() {
		return ep_no;
	}
	public void setEp_no(int ep_no) {
		this.ep_no = ep_no;
	}
	public int getEp_originno() {
		return ep_originno;
	}
	public void setEp_originno(int ep_originno) {
		this.ep_originno = ep_originno;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public int getEp_readcount() {
		return ep_readcount;
	}
	public void setEp_readcount(int ep_readcount) {
		this.ep_readcount = ep_readcount;
	}
	public String getEp_gb() {
		return ep_gb;
	}
	public void setEp_gb(String ep_gb) {
		this.ep_gb = ep_gb;
	}
	public String getEp_title() {
		return ep_title;
	}
	public void setEp_title(String ep_title) {
		this.ep_title = ep_title;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	public String getEp_writeday() {
		return ep_writeday;
	}
	public void setEp_writeday(String ep_writeday) {
		this.ep_writeday = ep_writeday;
	}
	public String getEp_content() {
		return ep_content;
	}
	public void setEp_content(String ep_content) {
		this.ep_content = ep_content;
	}
	public String getEp_image() {
		return ep_image;
	}
	public void setEp_image(String ep_image) {
		this.ep_image = ep_image;
	}

}
