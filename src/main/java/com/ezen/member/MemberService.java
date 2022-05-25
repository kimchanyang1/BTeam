package com.ezen.member;

import java.util.ArrayList;

import com.ezen.board.BoardDTO;
import com.ezen.epilogue.EpilogueDTO;
import com.ezen.missing.MissingDTO;
import com.ezen.rehome.RehomeDTO;
import com.ezen.teamb.PagingDTO;

public interface MemberService {
	
	public void Signup(String mem_id, String mem_pw, String mem_name, String mem_nickname, String mem_jumin, String mem_tel, String mem_mail, String mem_address);
	public MemberDTO Login(String mem_id);
	public void memberdelete(int mem_no);
	public void membermodify(String mem_pw, String mem_nickname, String mem_jumin, String mem_tel, String mem_mail, String mem_address, int mem_no);
	public MemberDTO memberdetail(int mem_no);
	public int IdCheck(String mem_id);
	
	public ArrayList<MemberDTO> memberlist();
	public ArrayList<MemberDTO> searchid(String searchname);
	public ArrayList<MemberDTO> searchname(String searchname);
	public ArrayList<MemberDTO> searchnickname(String searchname);
	
	public ArrayList<MissingDTO> membermissingwrite(int mem_no);
	public ArrayList<RehomeDTO> memberrehomewrite(int mem_no);
	public ArrayList<EpilogueDTO> memberepiloguewrite(int mem_no);
	public ArrayList<BoardDTO> memberboardwrite(int mem_no);
	
	public int ADmemberTotal();
	public ArrayList<MemberDTO> ADmemberPage(PagingDTO page);	
	
}
