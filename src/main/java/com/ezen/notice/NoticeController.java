package com.ezen.notice;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.teamb.MovePageVO;
import com.ezen.teamb.PagingDTO;

@Controller
public class NoticeController {
	
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/noticeoutform")
	public String noticepage(Model model, String nowPage) {
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

	@RequestMapping(value = "/noticeinputform")
	public String noticeinputform(HttpServletRequest request, Model model) {
		HttpSession hs = request.getSession();
		model.addAttribute("mem_no", hs.getAttribute("mem_no"));
		model.addAttribute("mem_nickname", hs.getAttribute("mem_nickname"));
		return "noticeinputform";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/noticeinput")
	public String noticeinput(HttpServletRequest request) {
		NoticeService ns = sqlSession.getMapper(NoticeService.class);
		int mem_no = Integer.parseInt(request.getParameter("mem_no"));
		String mem_nickname = request.getParameter("mem_nickname");
		String nt_title = request.getParameter("nt_title");
		String nt_content = request.getParameter("nt_content");
		ns.noticeinput(mem_no, mem_nickname, nt_title, nt_content);
		return "redirect: noticeoutform";
	}

	@RequestMapping(value = "/noticedetail")
	public String noticedetail(HttpServletRequest request, Model model) {
		NoticeService ns = sqlSession.getMapper(NoticeService.class);
		int nt_no = Integer.parseInt(request.getParameter("nt_no"));
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

	@RequestMapping(value = "/noticemodify")
	public String noticemodify(HttpServletRequest request, Model model) {
		NoticeService ns = sqlSession.getMapper(NoticeService.class);
		int nt_no = Integer.parseInt(request.getParameter("nt_no"));
		String nt_title = request.getParameter("nt_title");
		String nt_content = request.getParameter("nt_content");
		ns.noticemodify(nt_no, nt_title, nt_content);
		return "redirect:noticedetail?nt_no="+nt_no;
	}

	@RequestMapping(value = "/noticedelete")
	public String noticedelete(HttpServletRequest request, Model model) {
		NoticeService ns = sqlSession.getMapper(NoticeService.class);
		int nt_no = Integer.parseInt(request.getParameter("nt_no"));
		ns.noticedelete(nt_no);
		return "redirect:noticeoutform";
	}

	@RequestMapping(value = "/noticemodifyform")
	public String noticemodifyform(HttpServletRequest request, Model model) {
		NoticeService ns = sqlSession.getMapper(NoticeService.class);
		int nt_no = Integer.parseInt(request.getParameter("nt_no"));
		NoticeDTO ndto = ns.noticedetail(nt_no);
		model.addAttribute("ndto", ndto);
		return "noticemodifyform";
	}
	
	
}
