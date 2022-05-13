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
	
	//공지 자세히보기
	@RequestMapping(value = "/noticedetail")
	public String noticedetail(HttpServletRequest request, Model model) {
		return nc.noticedetail(request, sqlSession, model);
	}
	
	//공지 수정
	@RequestMapping(value = "/noticemodifyform")
	public String noticemodifyform(HttpServletRequest request, Model model) {
		return nc.noticemodifyform(request, sqlSession, model);
	}
	
	//공지 수정
	@RequestMapping(value = "/noticemodify")
	public String noticemodify(HttpServletRequest request, Model model) {
		return nc.noticemodify(request, sqlSession, model);
	}
	
	//공지 삭제
	@RequestMapping(value = "/noticedelete")
	public String noticedelete(HttpServletRequest request, Model model) {
		return nc.noticedelete(request, sqlSession, model);
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
		return "redirect: rehomeoutform";
	}
	
	@RequestMapping(value = "/rehomeinputform")
	public String rhinputform() {
		return rc.rhinputform();
	}
	
	@RequestMapping(value = "/rehomeinput")
	public String rhinput(MultipartHttpServletRequest multi) {
		return rc.rhinput(multi, sqlSession);
	}
	
	@RequestMapping(value = "/rehomeoutform")
	public String rhoutput(Model mo) {
		return rc.rhoutput(sqlSession, mo);
	}
	
	@RequestMapping(value = "/rehomedetail")
	public String rhdetail(HttpServletRequest request, Model mo) {
		return rc.rhdetail(sqlSession, request, mo);
	}
	
	@RequestMapping(value = "/rehomedelete")
	public String rhdelete(HttpServletRequest request, Model mo) {
		return rc.rhdelete(sqlSession, request);
	}
	
	@RequestMapping(value = "/rehomemodifyform")
	public String rhmodifyform(HttpServletRequest request, Model mo) {
		return rc.rhmodifyform(sqlSession, request, mo);
	}
	
	@RequestMapping(value = "/rehomemodify")
	public String rhmodify(MultipartHttpServletRequest multi) {
		return rc.rhmodify(sqlSession, multi);
	}
	
	@RequestMapping(value = "/rehomesearch")
	public String rhsearch(HttpServletRequest request) {
		return rc.rhsearch(sqlSession, request);
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
	public String memberdetail(HttpServletRequest request, Model model) {
		return mc.memberdetail(request, model, sqlSession);
	}
	
	@RequestMapping(value = "/memberdelete")
	public String memberdelete(HttpServletRequest request) {
		return mc.memberdelete(request, sqlSession);
	}
	
	@RequestMapping(value = "/membermodifyform")
	public String membermodifyform(HttpServletRequest request, Model model) {
		return mc.membermodifyform(request, model, sqlSession);
	}
	
	@RequestMapping(value = "/membermodify", method = RequestMethod.POST)
	public String membermodify(HttpServletRequest request, Model model) {
		return mc.membermodify(request, sqlSession, model);
	}
	
	// 자유게시판
	@RequestMapping(value = "/board")
	public String bb0(Model md) {
		
		return bc.boardoutform(sqlSession, md);
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
