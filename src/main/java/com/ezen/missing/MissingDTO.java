package com.ezen.missing;

/*
create table missing(
mis_no NUMBER(6) PRIMARY KEY,
mis_gb VARCHAR2(10),
mis_gb2 VARCHAR2(10),
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

�Ͱ� ������
INSERT INTO MISSING VALUES(MIS_NO.NEXTVAL, '�Ͱ�', '��', '�׽�Ʈ��1', '�׽�Ʈ��1', 0000001, sysdate, '������1', '1.png', 1, '�׽���1', '010-1111-1111', sysdate , '�׽�Ʈ�۳���1' ,0);
INSERT INTO MISSING VALUES(MIS_NO.NEXTVAL, '�Ͱ�', '��', '�׽�Ʈ��2', '�׽�Ʈ��2', 0000002, sysdate, '������2', '1.png', 2, '�׽���2', '010-2222-2222', sysdate , '�׽�Ʈ�۳���2' ,0);
INSERT INTO MISSING VALUES(MIS_NO.NEXTVAL, '�Ͱ�', '��', '�׽�Ʈ��3', '�׽�Ʈ��3', 0000003, sysdate, '������3', '1.png', 3, '�׽���3', '010-3333-3333', sysdate , '�׽�Ʈ�۳���3' ,0);
INSERT INTO MISSING VALUES(MIS_NO.NEXTVAL, '�Ͱ�', '��', '�׽�Ʈ��4', '�׽�Ʈ��4', 0000004, sysdate, '������4', '1.png', 4, '�׽���4', '010-4444-4444', sysdate , '�׽�Ʈ�۳���4' ,0);
INSERT INTO MISSING VALUES(MIS_NO.NEXTVAL, '�Ͱ�', '��', '�׽�Ʈ��5', '�׽�Ʈ��5', 0000005, sysdate, '������5', '1.png', 5, '�׽���5', '010-5555-5555', sysdate , '�׽�Ʈ�۳���5' ,0);
INSERT INTO MISSING VALUES(MIS_NO.NEXTVAL, '�Ͱ�', '��', '�׽�Ʈ��6', '�׽�Ʈ��6', 0000006, sysdate, '������6', '1.png', 6, '�׽���6', '010-6666-6666', sysdate , '�׽�Ʈ�۳���6' ,0);
INSERT INTO MISSING VALUES(MIS_NO.NEXTVAL, '�Ͱ�', '��', '�׽�Ʈ��7', '�׽�Ʈ��7', 0000007, sysdate, '������7', '1.png', 7, '�׽���7', '010-7777-7777', sysdate , '�׽�Ʈ�۳���7' ,0);
INSERT INTO MISSING VALUES(MIS_NO.NEXTVAL, '�Ͱ�', '��', '�׽�Ʈ��8', '�׽�Ʈ��8', 0000008, sysdate, '������8', '1.png', 8, '�׽���8', '010-8888-8888', sysdate , '�׽�Ʈ�۳���8' ,0);
INSERT INTO MISSING VALUES(MIS_NO.NEXTVAL, '�Ͱ�', '��', '�׽�Ʈ��9', '�׽�Ʈ��9', 0000009, sysdate, '������9', '1.png', 9, '�׽���9', '010-9999-9999', sysdate , '�׽�Ʈ�۳���9' ,0);
*/

public class MissingDTO {
	
	int mis_no;
	String mis_gb,mis_gb2,mis_title,mis_pname,mis_misdate,mis_misplace,mis_pno,mis_image;
	int mem_no;
	String mem_nickname, mem_tel,mis_writeday,mis_content;
	int mis_readcount;
	
	public MissingDTO() {
		super();
	}

	public int getMis_no() {
		return mis_no;
	}

	public void setMis_no(int mis_no) {
		this.mis_no = mis_no;
	}

	public String getMis_gb() {
		return mis_gb;
	}

	public void setMis_gb(String mis_gb) {
		this.mis_gb = mis_gb;
	}

	public String getMis_gb2() {
		return mis_gb2;
	}

	public void setMis_gb2(String mis_gb2) {
		this.mis_gb2 = mis_gb2;
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

	public String getMis_writeday() {
		return mis_writeday;
	}

	public void setMis_writeday(String mis_writeday) {
		this.mis_writeday = mis_writeday;
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