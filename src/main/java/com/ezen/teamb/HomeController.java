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

import com.ezen.board.BoardController;
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
	
	// BoardControlloer
	private BoardController bc = new BoardController();
		
		
	
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
	
	
	
	
	// 자유게시판
	@RequestMapping(value = "/board")
	public String bb0(HttpServletRequest request, Model md) {
		
		return bc.boardoutform(sqlSession, request, md);
	}
	
	
	// 글쓰기
	@RequestMapping(value = "/boardinputform")
	public String bb1(HttpServletRequest request, Model md)	{
				
		return bc.boardinputformgo(sqlSession, request, md);
	}
	
	@RequestMapping(value = "/boardinput")
	public String bb2(MultipartHttpServletRequest multi) {
		
		return bc.boardinput(sqlSession, multi);
	}
	
	
	// 디테일
	@RequestMapping(value = "/boarddetail")
	public String bb3(HttpServletRequest request, Model md) {
		
		return bc.boarddetailform(sqlSession, request, md);
	}
	
	
	// 수정
	@RequestMapping(value = "/boardmodifyselect")
	public String bb4(HttpServletRequest request, Model md) {
		
		return bc.boardmodifyselect(sqlSession, request, md);
	}
	
	@RequestMapping(value = "/boardmodify")
	public String bb5(MultipartHttpServletRequest multi) {
		
		return bc.boardmodify(sqlSession, multi);
	}
	
	
	// 삭제
	@RequestMapping(value = "/boarddelete")
	public String bb6(HttpServletRequest request, Model md) {
		
		return bc.boarddelete(sqlSession, request, md);
	}
	
	
	// 검색
	@RequestMapping(value = "/boardsearch")
	public String bb7(HttpServletRequest request, Model md) {
		
		return bc.boardsearch(sqlSession, request, md);
	}
	
}
