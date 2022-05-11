package com.ezen.teamb;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.member.MemberController;
import com.ezen.notice.NoticeController;

@Controller
public class HomeController {
	
	@Autowired
	private SqlSession sqlsession;
	
	private NoticeController nc = new NoticeController();
	private MemberController mc = new MemberController();
	
	@RequestMapping(value = "/")
	public String home() {
		return "home";
	}
	
	@RequestMapping(value = "/home")
	public String home1() {
		return "home";
	}
	
	@RequestMapping(value = "/notice")
	public String notice() {
		return nc.notice();
	}
	
	@RequestMapping(value = "/signupform")
	public String Signupform() {
		return mc.Signupform();
	}
	
	@RequestMapping(value = "/signup")
	public String Signup(HttpServletRequest request) {
		return mc.Signup(request, sqlsession);
	}
	
	@RequestMapping(value = "/loginform")
	public String Loginform() {
		return mc.Loginform();
	}
	
	@RequestMapping(value = "/login")
	public String Login(HttpServletRequest request, Model model) {
		return mc.Login(request, model, sqlsession);
	}
	
	@RequestMapping(value = "/logout")
	public String Logout(HttpServletRequest request) {
		return mc.Logout(request);
	}
	
}
