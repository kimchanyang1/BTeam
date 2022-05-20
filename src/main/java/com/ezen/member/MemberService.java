package com.ezen.member;

import java.util.ArrayList;

public interface MemberService {
	
	public void Signup(String mem_id, String mem_pw, String mem_name, String mem_nickname, String mem_jumin, String mem_tel, String mem_mail, String mem_address);
	public MemberDTO Login(String mem_id, String mem_pw);
	public void memberdelete(int mem_no);
	public void membermodify(String mem_pw, String mem_nickname, String mem_jumin, String mem_tel, String mem_mail, String mem_address, int mem_no);
	public MemberDTO memberdetail(int mem_no);
	public int IdCheck(String mem_id);
	
}
