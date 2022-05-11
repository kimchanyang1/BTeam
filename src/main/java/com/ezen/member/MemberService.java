package com.ezen.member;

public interface MemberService {
	
	public void Signup(String mem_id, String mem_pw, String mem_name, String mem_nickname, String mem_jumin, String mem_tel, String mem_mail, String mem_address);
	public MemberDTO Login(String mem_id, String mem_pw);
}
