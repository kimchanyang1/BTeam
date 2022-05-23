package com.ezen.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public class MemberController {
	
	public String signupform1() {
		return "signupform1";
	}
	
	public String signupform2() {
		return "signupform2";
	}
	
	public String signpolicy(){
		return "Memberpolicy";
	}
	
	public String Signupform() {
		return "signupform";
	}
	
	public String Signup(HttpServletRequest request, SqlSession sqlSession) {
		String mem_id = request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw");
		String mem_name = request.getParameter("mem_name");
		String mem_nickname = request.getParameter("mem_nickname");
		String mem_jumin = request.getParameter("mem_jumin");
		String mem_tel = request.getParameter("mem_tel");
		String emailid = request.getParameter("emailid");
		String domain = request.getParameter("domain");
		if (domain=="manual") {
			domain=request.getParameter("domain2");
		}
		String mem_mail = emailid+"@"+domain;
		String mem_address = request.getParameter("mem_address");
		MemberService ms = sqlSession.getMapper(MemberService.class);
		ms.Signup(mem_id, mem_pw, mem_name, mem_nickname, mem_jumin, mem_tel, mem_mail, mem_address);
		return "redirect:home";
	}
	
	public String Loginform() {
		return "loginform";
	}
	
	public String Login(HttpServletRequest request, Model model, SqlSession sqlSession) {
		HttpSession hs = request.getSession();
		hs.removeAttribute("memoryid");
		hs.removeAttribute("memorycheck");
		String mem_id = request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw");
		String memoryid = request.getParameter("memoryid");
		
		MemberService ms = sqlSession.getMapper(MemberService.class);
		MemberDTO login = ms.Login(mem_id, mem_pw);
		if (login != null) {
			hs.setAttribute("mem_no", login.getMem_no());
			hs.setAttribute("mem_id", login.getMem_id());
			hs.setAttribute("mem_nickname", login.getMem_nickname());
			hs.setAttribute("mem_tel", login.getMem_tel());
			hs.setAttribute("logon", true);
			if (memoryid != null) {
				hs.setAttribute("memoryid", mem_id);
				hs.setAttribute("memorycheck", true);
			}
			return "redirect:home";
		} else {
			model.addAttribute("result", "loginfail");
			return "redirect:signupform1";
		}
	}
	
	public String Logout(HttpServletRequest request) {
		HttpSession hs = request.getSession();
		hs.removeAttribute("mem_no");
		hs.removeAttribute("mem_id");
		hs.removeAttribute("mem_nickname");
		hs.removeAttribute("mem_tel");
		hs.removeAttribute("logon");
		return "redirect:home";
	}
	
	public String memberdetail(HttpServletRequest request, Model model, SqlSession sqlSession) {
		HttpSession hs = request.getSession();
		int mem_no = (int) hs.getAttribute("mem_no");
		MemberService ms = sqlSession.getMapper(MemberService.class);
		MemberDTO mdto = ms.memberdetail(mem_no);
		model.addAttribute("mdto", mdto);
		return "memberdetail";
	}
	
	public String memberdelete(HttpServletRequest request, SqlSession sqlSession) {
		int mem_no = Integer.parseInt(request.getParameter("mem_no"));
		MemberService ms = sqlSession.getMapper(MemberService.class);
		ms.memberdelete(mem_no);
		return "redirect:logout";
	}

	public String membermodifyform(HttpServletRequest request, Model model, SqlSession sqlSession) {
		memberdetail(request, model, sqlSession);
		return "membermodifyform";
	}

	public String membermodify(HttpServletRequest request, SqlSession sqlSession, Model model) {
		int mem_no = Integer.parseInt(request.getParameter("mem_no"));
		String mem_pw = request.getParameter("mem_pw");
		String mem_nickname = request.getParameter("mem_nickname");
		String mem_jumin = request.getParameter("mem_jumin");
		String mem_tel = request.getParameter("mem_tel");
		String mem_mail = request.getParameter("mem_mail");
		String mem_address = request.getParameter("mem_address");
		MemberService ms = sqlSession.getMapper(MemberService.class);
		ms.membermodify(mem_pw, mem_nickname, mem_jumin, mem_tel, mem_mail, mem_address, mem_no);
		Login(request, model, sqlSession);
		return "redirect:memberdetail";
	}

	public int IdCheckForm(String mem_id, SqlSession sqlSession, HttpServletResponse response) {
		MemberService ms = sqlSession.getMapper(MemberService.class);
		int use = ms.IdCheck(mem_id);
		/*
		String parseJson = "{\"id\":\""+use+"\"}";
		try {
			response.getWriter().print(parseJson);
		} catch (IOException e) {
			e.printStackTrace();
		};
		*/
		return use;
	}

}
