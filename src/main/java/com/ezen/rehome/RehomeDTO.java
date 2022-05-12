package com.ezen.rehome;

/*
create table rehome(
rh_no NUMBER(6) PRIMARY KEY,
rh_gb1 VARCHAR2(10),
rh_gb2 VARCHAR(10),
rh_gb3 VARCHAR2(10),
rh_title VARCHAR2(80),
rh_pname VARCHAR2(20),
rh_pno NUMBER(20),
rh_misdate date,
rh_misplace VARCHAR2(50),
rh_image VARCHAR2(30),
mem_no NUMBER(6,0),
mem_nickname VARCHAR2(20),
mem_tel VARCHAR2(13),
rh_writeday DATE default sysdate,
rh_content VARCHAR2(2000),
rh_readcount NUMBER(6));

create SEQUENCE rh_no;
 */

public class RehomeDTO {
	
	int rh_no;
	String rh_gb1, rh_gb2, rh_gb3;
	String rh_title, rh_pname;
	int rh_pno;
	String rh_misdate, rh_misplace, rh_image;
	int mem_no;
	String mem_nickname, mem_tel;
	String rh_writeday, rh_content;
	int rh_readcount;
	
	public RehomeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RehomeDTO(int rh_no, String rh_gb1, String rh_gb2, String rh_gb3, String rh_title, String rh_pname,
			int rh_pno, String rh_misdate, String rh_misplace, String rh_image, int mem_no, String mem_nickname,
			String mem_tel, String rh_writeday, String rh_content, int rh_readcount) {
		super();
		this.rh_no = rh_no;
		this.rh_gb1 = rh_gb1;
		this.rh_gb2 = rh_gb2;
		this.rh_gb3 = rh_gb3;
		this.rh_title = rh_title;
		this.rh_pname = rh_pname;
		this.rh_pno = rh_pno;
		this.rh_misdate = rh_misdate;
		this.rh_misplace = rh_misplace;
		this.rh_image = rh_image;
		this.mem_no = mem_no;
		this.mem_nickname = mem_nickname;
		this.mem_tel = mem_tel;
		this.rh_writeday = rh_writeday;
		this.rh_content = rh_content;
		this.rh_readcount = rh_readcount;
	}

	public int getRh_no() {
		return rh_no;
	}

	public void setRh_no(int rh_no) {
		this.rh_no = rh_no;
	}

	public String getRh_gb1() {
		return rh_gb1;
	}

	public void setRh_gb1(String rh_gb1) {
		this.rh_gb1 = rh_gb1;
	}

	public String getRh_gb2() {
		return rh_gb2;
	}

	public void setRh_gb2(String rh_gb2) {
		this.rh_gb2 = rh_gb2;
	}

	public String getRh_gb3() {
		return rh_gb3;
	}

	public void setRh_gb3(String rh_gb3) {
		this.rh_gb3 = rh_gb3;
	}

	public String getRh_title() {
		return rh_title;
	}

	public void setRh_title(String rh_title) {
		this.rh_title = rh_title;
	}

	public String getRh_pname() {
		return rh_pname;
	}

	public void setRh_pname(String rh_pname) {
		this.rh_pname = rh_pname;
	}

	public int getRh_pno() {
		return rh_pno;
	}

	public void setRh_pno(int rh_pno) {
		this.rh_pno = rh_pno;
	}

	public String getRh_misdate() {
		return rh_misdate;
	}

	public void setRh_misdate(String rh_misdate) {
		this.rh_misdate = rh_misdate;
	}

	public String getRh_misplace() {
		return rh_misplace;
	}

	public void setRh_misplace(String rh_misplace) {
		this.rh_misplace = rh_misplace;
	}

	public String getRh_image() {
		return rh_image;
	}

	public void setRh_image(String rh_image) {
		this.rh_image = rh_image;
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

	public String getMem_tel() {
		return mem_tel;
	}

	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}

	public String getRh_writeday() {
		return rh_writeday;
	}

	public void setRh_writeday(String rh_writeday) {
		this.rh_writeday = rh_writeday;
	}

	public String getRh_content() {
		return rh_content;
	}

	public void setRh_content(String rh_content) {
		this.rh_content = rh_content;
	}

	public int getRh_readcount() {
		return rh_readcount;
	}

	public void setRh_readcount(int rh_readcount) {
		this.rh_readcount = rh_readcount;
	}

}
