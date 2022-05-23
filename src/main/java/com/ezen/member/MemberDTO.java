package com.ezen.member;

/*
create table member(
mem_no NUMBER(6) PRIMARY KEY,
mem_id VARCHAR2(20),
mem_pw VARCHAR2(20),
mem_name VARCHAR2(12),
mem_nickname VARCHAR2(20),
mem_jumin VARCHAR2(14),
mem_tel VARCHAR2(13),
mem_mail VARCHAR2(40),
mem_address VARCHAR2(100));

create SEQUENCE member_seq;

占쏙옙占쏙옙占쌘곤옙占쏙옙 admin
INSERT INTO member VALUES (0,'admin','admin','愿�由ъ옄','愿�由ъ옄','','','','');
*/


public class MemberDTO {
	int mem_no;
	String mem_id, mem_pw, mem_name, mem_nickname, mem_jumin, mem_tel, mem_mail, mem_address;
	int age;
	String gender;
	
	public MemberDTO() {
	}

	public MemberDTO(int mem_no, String mem_id, String mem_pw, String mem_name, String mem_nickname, String mem_jumin,
			String mem_tel, String mem_mail, String mem_address) {
		super();
		this.mem_no = mem_no;
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_name = mem_name;
		this.mem_nickname = mem_nickname;
		this.mem_jumin = mem_jumin;
		this.mem_tel = mem_tel;
		this.mem_mail = mem_mail;
		this.mem_address = mem_address;
	}

	public MemberDTO(String mem_id, String mem_pw) {
		super();
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pw() {
		return mem_pw;
	}

	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_nickname() {
		return mem_nickname;
	}

	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}

	public String getMem_jumin() {
		return mem_jumin;
	}

	public void setMem_jumin(String mem_jumin) {
		this.mem_jumin = mem_jumin;
	}

	public String getMem_tel() {
		return mem_tel;
	}

	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}

	public String getMem_mail() {
		return mem_mail;
	}

	public void setMem_mail(String mem_mail) {
		this.mem_mail = mem_mail;
	}

	public String getMem_address() {
		return mem_address;
	}

	public void setMem_address(String mem_address) {
		this.mem_address = mem_address;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
}
