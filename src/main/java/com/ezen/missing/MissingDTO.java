package com.ezen.missing;

/*
create table missing(
mis_no NUMBER(6) PRIMARY KEY,
mis_gb VARCHAR2(10),
mis_title VARCHAR2(80),
mis_pname VARCHAR2(20),
mis_pno VARCHAR2(20),
mis_misdate DATE,
mis_misplace VARCHAR2(50),
mis_image VARCHAR2(30),
mem_no NUMBER(6),
mem_nickname VARCHAR2(20),
mem_tel VARCHAR2(13),
mis_writeday date default sysdate,
mis_content VARCHAR2(2000),
mis_readcount number(6)
);

create SEQUENCE mis_no;
*/

public class MissingDTO {
	
	String mis_gb,mis_title,mis_pname,mis_misdate,mis_misplace,mis_pno,mis_image,miswriteday,mis_content;
	int mis_readcount;
	
	public MissingDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getMis_gb() {
		return mis_gb;
	}

	public void setMis_gb(String mis_gb) {
		this.mis_gb = mis_gb;
	}

	public String getMis_title() {
		return mis_title;
	}

	public void setMis_title(String mis_title) {
		this.mis_title = mis_title;
	}

	public String getMis_pname() {
		return mis_pname;
	}

	public void setMis_pname(String mis_pname) {
		this.mis_pname = mis_pname;
	}

	public String getMis_misdate() {
		return mis_misdate;
	}

	public void setMis_misdate(String mis_misdate) {
		this.mis_misdate = mis_misdate;
	}

	public String getMis_misplace() {
		return mis_misplace;
	}

	public void setMis_misplace(String mis_misplace) {
		this.mis_misplace = mis_misplace;
	}

	public String getMis_pno() {
		return mis_pno;
	}

	public void setMis_pno(String mis_pno) {
		this.mis_pno = mis_pno;
	}

	public String getMis_image() {
		return mis_image;
	}

	public void setMis_image(String mis_image) {
		this.mis_image = mis_image;
	}

	public String getMiswriteday() {
		return miswriteday;
	}

	public void setMiswriteday(String miswriteday) {
		this.miswriteday = miswriteday;
	}

	public String getMis_content() {
		return mis_content;
	}

	public void setMis_content(String mis_content) {
		this.mis_content = mis_content;
	}

	public int getMis_readcount() {
		return mis_readcount;
	}

	public void setMis_readcount(int mis_readcount) {
		this.mis_readcount = mis_readcount;
	}
	
	
	
}
