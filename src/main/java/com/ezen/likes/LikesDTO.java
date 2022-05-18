package com.ezen.likes;

/*
CREATE TABLE likes(
likes_count NUMBER(6, 0) PRIMARY KEY,
likes_boardno NUMBER(6, 0),
likes_id VARCHAR2(20),
likes_seq NUMBER(6, 0));

CREATE SEQUENCE likes_SEQ;
*/

public class LikesDTO {

	int likes_seq;
	int likes_count; //추천 수 저장, PK
	int likes_boardno; //추천한 게시글의 글 번호 저장
	String likes_id; //추천한 유저의 아이디 저장
	
	public LikesDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public LikesDTO(int likes_seq, int likes_count, int likes_boardno, String likes_id) {
		super();
		this.likes_seq = likes_seq;
		this.likes_count = likes_count;
		this.likes_boardno = likes_boardno;
		this.likes_id = likes_id;
	}

	public int getLikes_seq() {
		return likes_seq;
	}

	public void setLikes_seq(int likes_seq) {
		this.likes_seq = likes_seq;
	}

	public int getLikes_count() {
		return likes_count;
	}

	public void setLikes_count(int likes_count) {
		this.likes_count = likes_count;
	}

	public int getLikes_boardno() {
		return likes_boardno;
	}

	public void setLikes_boardno(int likes_boardno) {
		this.likes_boardno = likes_boardno;
	}

	public String getLikes_id() {
		return likes_id;
	}

	public void setLikes_id(String likes_id) {
		this.likes_id = likes_id;
	}
}
