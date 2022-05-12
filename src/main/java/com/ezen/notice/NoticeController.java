package com.ezen.notice;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.ezen.member.MemberDTO;

public class NoticeController {
	
	public String noticeoutform(SqlSession sqlSession, Model model) {
		NoticeService ns = sqlSession.getMapper(NoticeService.class);
		ArrayList<NoticeDTO> noticelist = ns.noticeoutform();
		model.addAttribute("noticelist", noticelist);
		return "noticeoutform";
	}
	
	public String noticeinputform(HttpServletRequest request, Model model) {
		HttpSession hs = request.getSession();
		MemberDTO login = (MemberDTO) hs.getAttribute("login");
		model.addAttribute("mem_no", login.getMem_no());
		model.addAttribute("mem_nickname", login.getMem_nickname());
		return "noticeinputform";
	}

	public String noticeinput(HttpServletRequest request, SqlSession sqlSession) {
		int mem_no = Integer.parseInt(request.getParameter("mem_no"));
		String mem_nickname = request.getParameter("mem_nickname");
		String nt_title = request.getParameter("nt_title");
		String nt_content = request.getParameter("nt_content");
		NoticeService ns = sqlSession.getMapper(NoticeService.class);
		ns.noticeinput(mem_no, mem_nickname, nt_title, nt_content);
		return "redirect:home";
	}
	
}
