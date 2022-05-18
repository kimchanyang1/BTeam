package com.ezen.teamb;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.missing.MissingController;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezen.board.BoardController;
import com.ezen.epilogue.EpilogueController;
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
	private EpilogueController ep = new EpilogueController();
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
	
	//���� �ڼ�������
	@RequestMapping(value = "/noticedetail")
	public String noticedetail(HttpServletRequest request, Model model) {
		return nc.noticedetail(request, sqlSession, model);
	}
	
	//���� ����
	@RequestMapping(value = "/noticemodifyform")
	public String noticemodifyform(HttpServletRequest request, Model model) {
		return nc.noticemodifyform(request, sqlSession, model);
	}
	
	//���� ����
	@RequestMapping(value = "/noticemodify")
	public String noticemodify(HttpServletRequest request, Model model) {
		return nc.noticemodify(request, sqlSession, model);
	}
	
	//���� ����
	@RequestMapping(value = "/noticedelete")
	public String noticedelete(HttpServletRequest request, Model model) {
		return nc.noticedelete(request, sqlSession, model);
	}
	
	@RequestMapping(value = "/missinginputform")
	public String missing() {
		return mic.missinginputform();
	}
	
	@RequestMapping(value = "/missinginput")
	public ModelAndView missinginput(MultipartHttpServletRequest request) {
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
	
	@RequestMapping(value = "/missingend")
	public String missingend(Model mo) {
		return mic.missingend(mo,sqlSession);
	}
	
	@RequestMapping(value = "/rehoming")
	public String rehoming(HttpServletRequest request) {
		return mic.rehoming(request,sqlSession);
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
	public ModelAndView rhinput(MultipartHttpServletRequest multi) {
		return rc.rhinput(multi, sqlSession);
	}
	
	@RequestMapping(value = "/rehomeoutform")
	public String rhoutput(Model mo) {
		return rc.rhoutput(sqlSession, mo);
	}
	
	@RequestMapping(value = "/rehomeend")
	public String rehomeend(Model mo) {
		return rc.rehomeend(sqlSession, mo);
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
	public String rhsearch(HttpServletRequest request, Model mo) {
		return rc.rhsearch(sqlSession, request, mo);
	}
	
	@RequestMapping(value = "/rehomeadmin")
	public String rehomeadmin(Model mo) {
		return rc.rehomeadmin(sqlSession, mo);
	}
	
	@RequestMapping(value = "/rehomeok")
	public String rehomeok(HttpServletRequest request) {
		return rc.rehomeok(sqlSession, request);
	}
	
	@RequestMapping(value = "/rehomeimboform")
	public String rehomeimboform(HttpServletRequest request, Model mo) {
		return rc.rehomeimboform(request, mo);
	}
	
	@RequestMapping(value = "/rehomeimbo", method = RequestMethod.POST)
	public String rehomeimbo(HttpServletRequest request) {
		return rc.rehomeimbo(sqlSession, request);
	}
	
	@RequestMapping(value = "/rehomebun")
	public String rehomebun(HttpServletRequest request) {
		return rc.rehomebun(sqlSession, request);
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
	
	
	
	
	// �ı�Խ���
	@RequestMapping(value = "/epilogue")
	public String ee0(Model md) {
			
		return ep.epilogueoutform(sqlSession, md);
	}
	
	
	// �۾���
	@RequestMapping(value = "/epilogueinputform")
	public String ee1(HttpServletRequest request, Model md)	{
					
		return ep.epilogueinputformgo(sqlSession, request, md);
	}
		
	@RequestMapping(value = "/epilogueinput")
	public ModelAndView ee2(MultipartHttpServletRequest multi) {
			
		return ep.epilogueinput(sqlSession, multi);
	}
	
	
	// ������
	@RequestMapping(value = "/epiloguedetail")
	public String ee3(HttpServletRequest request, Model md) {
		
		return ep.epiloguedetailform(sqlSession, request, md);
	}
	
	
	// ����
	@RequestMapping(value = "/epiloguemodifyselect")
	public String ee4(HttpServletRequest request, Model md) {
		
		return ep.epiloguemodifyselect(sqlSession, request, md);
	}
	
	@RequestMapping(value = "/epiloguemodify")
	public String ee5(MultipartHttpServletRequest multi) {
		
		return ep.epiloguemodify(sqlSession, multi);
	}
	
	
	// ����
	@RequestMapping(value = "/epiloguedelete")
	public String ee6(HttpServletRequest request, Model md) {
		
		return ep.epiloguedelete(sqlSession, request, md);
	}
	
	
	// �˻�
	@RequestMapping(value = "/epiloguesearch")
	public String ee7(HttpServletRequest request, Model md) {
			
		return ep.epiloguesearch(sqlSession, request, md);
	}
		
		
	
	
	// �����Խ���
	@RequestMapping(value = "/board")
	public String bb0(Model md) {
		
		return bc.boardoutform(sqlSession, md);
	}
	
	
	// �۾���
	@RequestMapping(value = "/boardinputform")
	public String bb1(HttpServletRequest request, Model md)	{
				
		return bc.boardinputformgo(sqlSession, request, md);
	}
	
	@RequestMapping(value = "/boardinput")
	public String bb2(MultipartHttpServletRequest multi) {
		
		return bc.boardinput(sqlSession, multi);
	}
	
	
	// ������
	@RequestMapping(value = "/boarddetail")
	public String bb3(HttpServletRequest request, Model md) {
		
		return bc.boarddetailform(sqlSession, request, md);
	}
	
	
	// ����
	@RequestMapping(value = "/boardmodifyselect")
	public String bb4(HttpServletRequest request, Model md) {
		
		return bc.boardmodifyselect(sqlSession, request, md);
	}
	
	@RequestMapping(value = "/boardmodify")
	public String bb5(MultipartHttpServletRequest multi) {
		
		return bc.boardmodify(sqlSession, multi);
	}
	
	
	// ����
	@RequestMapping(value = "/boarddelete")
	public String bb6(HttpServletRequest request, Model md) {
		
		return bc.boarddelete(sqlSession, request, md);
	}
	
	
	// �˻�
	@RequestMapping(value = "/boardsearch")
	public String bb7(HttpServletRequest request, Model md) {
		
		return bc.boardsearch(sqlSession, request, md);
	}
	
	@RequestMapping(value="/policyprivate")
	public String policyprivate()
	{
			
		return "policyprivate";
	}
	
	@RequestMapping(value="/policyservice")
	public String policyservice()
	{		
		return "policyservice";
	}
	
	@RequestMapping(value="/location")
	public String location()
	{		
		return "location";
	}
}
