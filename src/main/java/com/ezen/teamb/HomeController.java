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
	
	@RequestMapping(value = "/noticeoutform")
	public String noticeoutform(Model model) {
		return nc.noticeoutform(sqlSession, model);
	}
	
	@RequestMapping(value = "/noticeinputform")
	public String noticeinputform(HttpServletRequest request, Model model) {
		return nc.noticeinputform(request, model);
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/noticeinput")
	public String noticeinput(HttpServletRequest request) {
		return nc.noticeinput(request, sqlSession);
	}
	
	@RequestMapping(value = "/missinginputform")
	public String missing() {
		return mic.missinginputform();
	}
	
	@RequestMapping(value = "/missinginput")
	public String missinginput(MultipartHttpServletRequest request) {
		return mic.missinginput(request, sqlSession);
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
	
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String Signup(HttpServletRequest request) {
		return mc.Signup(request, sqlSession);
	}
	
	@RequestMapping(value = "/loginform")
	public String Loginform() {
		return mc.Loginform();
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String Login(HttpServletRequest request, Model model) {
		return mc.Login(request, model, sqlSession);
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request) {
		return mc.Logout(request);
	}
	
	@RequestMapping(value = "/memberdetail")
	public String memberdetail() {
		return mc.memberdetail();
	}
	
	@RequestMapping(value = "/memberdelete")
	public String memberdelete(HttpServletRequest request) {
		return mc.memberdelete(request, sqlSession);
	}
	
	@RequestMapping(value = "/membermodifyform")
	public String membermodifyform() {
		return mc.membermodifyform();
	}
	
	@RequestMapping(value = "/membermodify", method = RequestMethod.POST)
	public String membermodify(HttpServletRequest request, Model model) {
		return mc.membermodify(request, sqlSession, model);
	}
	
}
