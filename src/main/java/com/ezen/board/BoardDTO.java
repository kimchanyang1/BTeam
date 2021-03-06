package com.ezen.board;

public class BoardDTO {
	
/*
------- BOARD 테이블 생성 -------

CREATE TABLE BOARD(
BD_NO NUMBER(6, 0) PRIMARY KEY,
BD_TITLE VARCHAR2(80),
MEM_NO NUMBER(6, 0),
MEM_NICKNAME VARCHAR2(20),
BD_WRITEDAY DATE DEFAULT SYSDATE,
BD_CONTENT VARCHAR2(2000),
BD_READCOUNT NUMBER(6, 0),
BD_IMAGE VARCHAR2(50),
BD_LIKES NUMBER(6, 0));

CREATE SEQUENCE BD_NO_SEQ;

INSERT INTO board VALUES (BD_NO_SEQ.nextval, '자유게시판 샘플1', 8, '예제용8', sysdate, '샘플내용1', 0, '1.jpg', 0);
INSERT INTO board VALUES (BD_NO_SEQ.nextval, '자유게시판 샘플2', 7, '예제용7', sysdate, '샘플내용2', 0, '1.jpg', 0);
INSERT INTO board VALUES (BD_NO_SEQ.nextval, '자유게시판 샘플3', 6, '예제용6', sysdate, '샘플내용3', 0, '1.jpg', 0);
INSERT INTO board VALUES (BD_NO_SEQ.nextval, '자유게시판 샘플4', 5, '예제용5', sysdate, '샘플내용4', 0, '1.jpg', 0);
INSERT INTO board VALUES (BD_NO_SEQ.nextval, '자유게시판 샘플5', 4, '예제용4', sysdate, '샘플내용5', 0, '1.jpg', 0);
INSERT INTO board VALUES (BD_NO_SEQ.nextval, '자유게시판 샘플6', 3, '예제용3', sysdate, '샘플내용6', 0, '1.jpg', 0);
INSERT INTO board VALUES (BD_NO_SEQ.nextval, '자유게시판 샘플7', 2, '예제용2', sysdate, '샘플내용7', 0, '1.jpg', 0);
INSERT INTO board VALUES (BD_NO_SEQ.nextval, '자유게시판 샘플8', 1, '예제용1', sysdate, '샘플내용8', 0, '1.jpg', 0);
*/
	
	int bd_no, mem_no, bd_readcount, bd_likes;
	String bd_title, mem_nickname, bd_writeday, bd_content, bd_image;
	int rn;
	
	public BoardDTO() {
		super();
	}
	
	
	public BoardDTO(int bd_no, int mem_no, int bd_readcount, int bd_likes, String bd_title, String mem_nickname,
			String bd_writeday, String bd_content, String bd_image) {
		super();
		this.bd_no = bd_no;
		this.mem_no = mem_no;
		this.bd_readcount = bd_readcount;
		this.bd_likes = bd_likes;
		this.bd_title = bd_title;
		this.mem_nickname = mem_nickname;
		this.bd_writeday = bd_writeday;
		this.bd_content = bd_content;
		this.bd_image = bd_image;
	}
	
	
	public int getBd_no() {
		return bd_no;
	}
	public void setBd_no(int bd_no) {
		this.bd_no = bd_no;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public int getBd_readcount() {
		return bd_readcount;
	}
	public void setBd_readcount(int bd_readcount) {
		this.bd_readcount = bd_readcount;
	}
	public int getBd_likes() {
		return bd_likes;
	}
	public void setBd_likes(int bd_likes) {
		this.bd_likes = bd_likes;
	}
	public String getBd_title() {
		return bd_title;
	}
	public void setBd_title(String bd_title) {
		this.bd_title = bd_title;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	public String getBd_writeday() {
		return bd_writeday;
	}
	public void setBd_writeday(String bd_writeday) {
		this.bd_writeday = bd_writeday;
	}
	public String getBd_content() {
		return bd_content;
	}
	public void setBd_content(String bd_content) {
		this.bd_content = bd_content;
	}
	public String getBd_image() {
		return bd_image;
	}
	public void setBd_image(String bd_image) {
		this.bd_image = bd_image;
	}

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

}
