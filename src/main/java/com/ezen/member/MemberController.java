package com.ezen.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


public class MemberController {
	
	public String Signupform() {
		return "Signupform";
	}
	
	public String Signup(HttpServletRequest request, SqlSession sqlsession) {
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
		MemberService ms = sqlsession.getMapper(MemberService.class);
		ms.Signup(mem_id, mem_pw, mem_name, mem_nickname, mem_jumin, mem_tel, mem_mail, mem_address);
		return "redirect:home";
	}
	
	public String Loginform() {
		return "loginform";
	}
	
	public String Login(HttpServletRequest request, Model model, SqlSession sqlsession) {
		HttpSession hs = request.getSession();
		hs.removeAttribute("memoryid");
		hs.removeAttribute("memorycheck");
		String mem_id = request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw");
		String memoryid = request.getParameter("memoryid");
		
		MemberService ms = sqlsession.getMapper(MemberService.class);
		MemberDTO login = ms.Login(mem_id, mem_pw);
		if (login != null) {
			hs.setAttribute("login", login);
			hs.setAttribute("logon", true);
			if (memoryid != null) {
				hs.setAttribute("memoryid", mem_id);
				hs.setAttribute("memorycheck", true);
			}
			return "redirect:home";
		} else {
			model.addAttribute("result", "loginfail");
			return "redirect:signupform";
		}
	}
	
	public String Logout(HttpServletRequest request) {
		HttpSession hs = request.getSession();
		hs.removeAttribute("login");
		hs.removeAttribute("logon");
		return "redirect:home";
	}
	
}
