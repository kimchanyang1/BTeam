package com.ezen.member;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.board.BoardDTO;
import com.ezen.board.BoardService;
import com.ezen.epilogue.EpilogueDTO;
import com.ezen.missing.MissingDTO;
import com.ezen.rehome.RehomeDTO;


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
	
	public String ADmemberlist(SqlSession sqlSession, HttpServletRequest request, Model mo)
	{
		MemberService ms = sqlSession.getMapper(MemberService.class);
		ArrayList<MemberDTO> list = ms.memberlist();
	    mo.addAttribute("list", list);
		
	    // 나이와 성별 구하기
		HttpSession hs = request.getSession();
		int mem_no = (int) hs.getAttribute("mem_no");
		
		Calendar calendar = new GregorianCalendar();
		int nowyear = calendar.get(Calendar.YEAR);
		int age = 0;
		String gender = "";

	    
	    MemberDTO mdto = ms.memberdetail(mem_no);
	    String jumin = mdto.getMem_jumin();
	    switch (jumin.substring(8, 9)) {
	    	case "1":
	            gender = "남자";
	            age = nowyear-1900-Integer.parseInt(jumin.substring(0, 2));
	            break;
	        case "2":
	            gender = "여자";
	            age = nowyear-1900-Integer.parseInt(jumin.substring(0, 2));
	            break;
	        case "3":
	            gender = "남자";
	            age = nowyear-2000-Integer.parseInt(jumin.substring(0, 2));
	            break;
	        case "4":
	            gender = "여자";
	            age = nowyear-2000-Integer.parseInt(jumin.substring(0, 2));
	            break;
	        }
	    
	    mo.addAttribute("age", age);	
	    mo.addAttribute("gender", gender);	
	    
		return "ADmemberlist";
	}
	
	public String ADmemberdetail(HttpServletRequest request, Model model, SqlSession sqlSession) {
		int mem_no = Integer.parseInt(request.getParameter("mem_no"));
		MemberService ms = sqlSession.getMapper(MemberService.class);
		MemberDTO mdto = ms.memberdetail(mem_no);
		model.addAttribute("mdto", mdto);
		return "ADmemberdetail";
	}
	
	public String ADmembersearch(SqlSession sqlSession, HttpServletRequest request, Model model) {
		
		String selectname = request.getParameter("selectname");
		String searchname = request.getParameter("searchname");
		
		MemberService ms = sqlSession.getMapper(MemberService.class);
		ArrayList<MemberDTO> list = null;
		
		if(selectname.equals("mem_id"))
		{
			list = ms.searchid(searchname);
		}
		else if(selectname.equals("mem_name"))
		{
			list = ms.searchname(searchname);
		}
		else
		{
			list = ms.searchnickname(searchname);
		}
		
		model.addAttribute("list", list);
		
		return "ADmemberlist";
	}

	public String memberwritelist(HttpServletRequest request, Model model, SqlSession sqlSession) {
		return "memberwritelist";
	}
	
	public String membermissingwrite(HttpServletRequest request, Model model, SqlSession sqlSession) {
		HttpSession hs = request.getSession();
		int mem_no = (int) hs.getAttribute("mem_no");
		MemberService ms = sqlSession.getMapper(MemberService.class);
		
		ArrayList<MissingDTO> missingout = ms.membermissingwrite(mem_no);
		model.addAttribute("missingout",missingout);
		
		return "missingoutform";
	}
	
	public String memberrehomewrite(HttpServletRequest request, Model model, SqlSession sqlSession) {
		HttpSession hs = request.getSession();
		int mem_no = (int) hs.getAttribute("mem_no");
		MemberService ms = sqlSession.getMapper(MemberService.class);
		
		ArrayList<RehomeDTO> rdto = ms.memberrehomewrite(mem_no);
		model.addAttribute("rdto",rdto);
		
		return "Rehomeoutform";
	}
	
	public String memberepiloguewrite(HttpServletRequest request, Model model, SqlSession sqlSession) {
		HttpSession hs = request.getSession();
		int mem_no = (int) hs.getAttribute("mem_no");
		MemberService ms = sqlSession.getMapper(MemberService.class);
		
		ArrayList<EpilogueDTO> epiloguelist = ms.memberepiloguewrite(mem_no);
		model.addAttribute("epiloguelist",epiloguelist);
		
		return "epilogueoutform";
	}
	
	public String memberboardwrite(HttpServletRequest request, Model model, SqlSession sqlSession) {
		HttpSession hs = request.getSession();
		int mem_no = (int) hs.getAttribute("mem_no");
		MemberService ms = sqlSession.getMapper(MemberService.class);
		
		ArrayList<BoardDTO> boardlist = ms.memberboardwrite(mem_no);
		model.addAttribute("boardlist", boardlist);
		
		return "boardoutform";
	}
	
}
