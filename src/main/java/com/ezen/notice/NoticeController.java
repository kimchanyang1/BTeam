package com.ezen.notice;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.ezen.teamb.MovePageVO;
import com.ezen.teamb.PagingDTO;

public class NoticeController {

	public String noticepage(SqlSession sqlSession, Model model, String nowPage) {
		NoticeService ns = sqlSession.getMapper(NoticeService.class);
		
		int total = ns.noticetotalcount();
		int cntPage = 5;
		int cntPerPage = 15;
		if (nowPage==null) {
			nowPage="1";
		}
		
		PagingDTO page = new PagingDTO(total, Integer.parseInt(nowPage), cntPerPage, cntPage);
		ArrayList<NoticeDTO> noticeList = ns.noticePage(page);
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("page", page);
		return "noticeoutform";
	}
	
	public String noticeinputform(HttpServletRequest request, Model model) {
		HttpSession hs = request.getSession();
		model.addAttribute("mem_no", hs.getAttribute("mem_no"));
		model.addAttribute("mem_nickname", hs.getAttribute("mem_nickname"));
		return "noticeinputform";
	}

	public String noticeinput(HttpServletRequest request, SqlSession sqlSession) {
		int mem_no = Integer.parseInt(request.getParameter("mem_no"));
		String mem_nickname = request.getParameter("mem_nickname");
		String nt_title = request.getParameter("nt_title");
		String nt_content = request.getParameter("nt_content");
		NoticeService ns = sqlSession.getMapper(NoticeService.class);
		ns.noticeinput(mem_no, mem_nickname, nt_title, nt_content);

		return "redirect: noticeoutform";
	}

	public String noticedetail(HttpServletRequest request, SqlSession sqlSession, Model model) {
		int nt_no = Integer.parseInt(request.getParameter("nt_no"));
		NoticeService ns = sqlSession.getMapper(NoticeService.class);
		noticereadcount(nt_no, ns);
		NoticeDTO ndto = ns.noticedetail(nt_no);
		MovePageVO move = ns.noticeMovePage(nt_no);
		model.addAttribute("ndto", ndto);
		model.addAttribute("move", move);
		return "noticedetail";
	}
	
	public void noticereadcount(int nt_no, NoticeService ns) {
		ns.noticereadcount(nt_no);
	}

	public String noticemodify(HttpServletRequest request, SqlSession sqlSession, Model model) {
		int nt_no = Integer.parseInt(request.getParameter("nt_no"));
		String nt_title = request.getParameter("nt_title");
		String nt_content = request.getParameter("nt_content");
		NoticeService ns = sqlSession.getMapper(NoticeService.class);
		ns.noticemodify(nt_no, nt_title, nt_content);
		return "redirect:noticedetail?nt_no="+nt_no;
	}

	public String noticedelete(HttpServletRequest request, SqlSession sqlSession, Model model) {
		int nt_no = Integer.parseInt(request.getParameter("nt_no"));
		NoticeService ns = sqlSession.getMapper(NoticeService.class);
		ns.noticedelete(nt_no);
		return "redirect:noticeoutform";
	}

	public String noticemodifyform(HttpServletRequest request, SqlSession sqlSession, Model model) {
		int nt_no = Integer.parseInt(request.getParameter("nt_no"));
		NoticeService ns = sqlSession.getMapper(NoticeService.class);
		NoticeDTO ndto = ns.noticedetail(nt_no);
		model.addAttribute("ndto", ndto);
		return "noticemodifyform";
	}
	
	
}
