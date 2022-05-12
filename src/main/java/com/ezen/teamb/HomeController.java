package com.ezen.teamb;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezen.missing.MissingController;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezen.member.MemberController;

import com.ezen.notice.NoticeController;
import com.ezen.rehome.RehomeController;

@Controller
public class HomeController {
	
	@Autowired
	private SqlSession sqlSession;
	
	private NoticeController nc = new NoticeController();
	private MissingController mic = new MissingController();
	private RehomeController rc = new RehomeController();
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
	
	@RequestMapping(value = "/missinginputform")
	public String missing() {
		return mic.missinginputform();
	}
	
	@RequestMapping(value = "/missinginput")
	public String missinginput(MultipartHttpServletRequest request) {
		return mic.missinginput(request, sqlSession);
	}
	
	@RequestMapping(value = "/missingoutform")
	public String missingoutform(Model mo) {
		return mic.missingoutform(mo,sqlSession);
	}
	
	@RequestMapping(value = "/missingdetail")
	public String missingdetail(HttpServletRequest request,Model mo) {
		return mic.missingdetail(request, mo ,sqlSession);
	}
	
	@RequestMapping(value = "/missingdelete")
	public String missingdelete(HttpServletRequest request) {
		return mic.missingdelete(request,sqlSession);
	}
	
	@RequestMapping(value = "/missingmodifyform")
	public String missingmodifyform(HttpServletRequest request, Model mo) {
		return mic.missingmodifyform(request, mo, sqlSession);
	}
	
	@RequestMapping(value = "/missingmodifyinput")
	public String missingmodifyinput(MultipartHttpServletRequest request) {
		return mic.missingmodifyinput(request,sqlSession);
	}
	
	
	
	@RequestMapping(value = "/rehome")
	public String rehome() {
		return rc.rehome();
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/rehomeinput")
	public String rhinput(MultipartHttpServletRequest multi) {
		return rc.rhinput(multi, sqlSession);
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/rehomeoutput")
	public String rhoutput(Model mo) {
		return rc.rhoutput(sqlSession, mo);
	}
	
	@RequestMapping(value = "/signupform")
	public String Signupform() {
		return mc.Signupform();
	}
	
	@RequestMapping(value = "/signup")
	public String Signup(HttpServletRequest request) {
		return mc.Signup(request, sqlSession);
	}
	
	@RequestMapping(value = "/loginform")
	public String Loginform() {
		return mc.Loginform();
	}
	
	@RequestMapping(value = "/login")
	public String Login(HttpServletRequest request, Model model) {
		return mc.Login(request, model, sqlSession);
	}
	
	@RequestMapping(value = "/logout")
	public String Logout(HttpServletRequest request) {
		return mc.Logout(request);
	}
	
}
