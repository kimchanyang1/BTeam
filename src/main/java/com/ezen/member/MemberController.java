package com.ezen.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.board.BoardDTO;
import com.ezen.epilogue.EpilogueDTO;
import com.ezen.missing.MissingDTO;
import com.ezen.rehome.RehomeDTO;
import com.ezen.teamb.PagingDTO;

@Controller
public class MemberController {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping(value = "/signpolicy")
	public String signpolicy(){
		return "Memberpolicy";
	}
	
	@RequestMapping(value = "/signupform")
	public String Signupform() {
		return "signupform";
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String Signup(HttpServletRequest request) {
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
	
	@RequestMapping(value = "/loginform")
	public String Loginform() {
		return "loginform";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String Login(HttpServletRequest request, HttpServletResponse response, Model model) {
		HttpSession hs = request.getSession();
		hs.removeAttribute("memoryid");
		hs.removeAttribute("memorycheck");
		String mem_id = request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw");
		String memoryid = request.getParameter("memoryid");
		
		MemberService ms = sqlSession.getMapper(MemberService.class);
		MemberDTO login = ms.Login(mem_id);
		if (login != null) {
			if (login.getMem_pw().equals(mem_pw)) {
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
				try {
					response.setContentType("text/html; charset=utf-8");
					response.setCharacterEncoding("UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('?????? ????????????????????? ?????? ??????????????????');");
					out.println("location.href='loginform';");
					out.println("</script>");
					model.addAttribute("memoryid", mem_id);
				} catch (IOException e) {
					e.printStackTrace();
				}
				return "";
			}
		} else {
			model.addAttribute("result", "loginfail");
			try {
				response.setContentType("text/html; charset=utf-8");
				response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('?????? ??????????????????. ????????????????????????.');");
				out.println("location.href='signpolicy';");
				out.println("</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "";
		}
	}
	
	@RequestMapping(value = "/logout")
	public String Logout(HttpServletRequest request) {
		HttpSession hs = request.getSession();
		hs.removeAttribute("mem_no");
		hs.removeAttribute("mem_id");
		hs.removeAttribute("mem_nickname");
		hs.removeAttribute("mem_tel");
		hs.removeAttribute("logon");
		return "redirect:home";
	}
	
	@RequestMapping(value = "/memberdetail")
	public String memberdetail(HttpServletRequest request, Model model) {
		HttpSession hs = request.getSession();
		int mem_no = (int) hs.getAttribute("mem_no");
		MemberService ms = sqlSession.getMapper(MemberService.class);
		MemberDTO mdto = ms.memberdetail(mem_no);
		model.addAttribute("mdto", mdto);
		return "memberdetail";
	}
	
	@RequestMapping(value = "/memberdelete")
	public String memberdelete(HttpServletRequest request) {
		int mem_no = Integer.parseInt(request.getParameter("mem_no"));
		MemberService ms = sqlSession.getMapper(MemberService.class);
		ms.memberdelete(mem_no);
		return "redirect:logout";
	}
	
	@RequestMapping(value = "/membermodifyform")
	public String membermodifyform(HttpServletRequest request, Model model) {
		memberdetail(request, model);
		return "membermodifyform";
	}
	
	@RequestMapping(value = "/membermodify", method = RequestMethod.POST)
	public String membermodify(HttpServletRequest request, Model model) {
		int mem_no = Integer.parseInt(request.getParameter("mem_no"));
		String mem_pw = request.getParameter("mem_pw");
		String mem_nickname = request.getParameter("mem_nickname");
		String mem_jumin = request.getParameter("mem_jumin");
		String mem_tel = request.getParameter("mem_tel");
		String mem_mail = request.getParameter("mem_mail");
		String mem_address = request.getParameter("mem_address");
		MemberService ms = sqlSession.getMapper(MemberService.class);
		ms.membermodify(mem_pw, mem_nickname, mem_jumin, mem_tel, mem_mail, mem_address, mem_no);
		Login(request, null, model);
		return "redirect:memberdetail";
	}

	@RequestMapping(value = "/IdCheckForm", method = RequestMethod.GET)
	@ResponseBody
	public int IdCheckForm(@RequestParam("mem_id") String mem_id) {
		MemberService ms = sqlSession.getMapper(MemberService.class);
		int use = ms.IdCheck(mem_id);
		return use;
	}
	
	@RequestMapping(value = "/ADmemberdetail")
	public String ADmemberdetail(HttpServletRequest request, Model model) {
		int mem_no = Integer.parseInt(request.getParameter("mem_no"));
		MemberService ms = sqlSession.getMapper(MemberService.class);
		MemberDTO mdto = ms.memberdetail(mem_no);
		model.addAttribute("mdto", mdto);
		return "ADmemberdetail";
	}
	
	@RequestMapping(value = "/ADmembersearch")
	public String ADmembersearch(HttpServletRequest request, Model model) {
		
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

	@RequestMapping(value = "/memberwritelist")
	public String memberwritelist(HttpServletRequest request, Model model) {
		return "memberwritelist";
	}
	
	@RequestMapping(value = "/membermissingwrite")
	public String membermissingwrite(HttpServletRequest request, Model model) {
		HttpSession hs = request.getSession();
		int mem_no = (int) hs.getAttribute("mem_no");
		MemberService ms = sqlSession.getMapper(MemberService.class);
		
		ArrayList<MissingDTO> missingout = ms.membermissingwrite(mem_no);
		model.addAttribute("missingout",missingout);
		
		return "missingoutform";
	}
	
	@RequestMapping(value = "/memberrehomewrite")
	public String memberrehomewrite(HttpServletRequest request, Model model) {
		HttpSession hs = request.getSession();
		int mem_no = (int) hs.getAttribute("mem_no");
		MemberService ms = sqlSession.getMapper(MemberService.class);
		
		ArrayList<RehomeDTO> rdto = ms.memberrehomewrite(mem_no);
		model.addAttribute("rdto",rdto);
		
		return "Rehomeoutform";
	}
	
	@RequestMapping(value = "/memberepiloguewrite")
	public String memberepiloguewrite(HttpServletRequest request, Model model) {
		HttpSession hs = request.getSession();
		int mem_no = (int) hs.getAttribute("mem_no");
		MemberService ms = sqlSession.getMapper(MemberService.class);
		
		ArrayList<EpilogueDTO> epiloguelist = ms.memberepiloguewrite(mem_no);
		model.addAttribute("epiloguelist",epiloguelist);
		
		return "epilogueoutform";
	}
	
	@RequestMapping(value = "/memberboardwrite")
	public String memberboardwrite(HttpServletRequest request, Model model) {
		HttpSession hs = request.getSession();
		int mem_no = (int) hs.getAttribute("mem_no");
		MemberService ms = sqlSession.getMapper(MemberService.class);
		
		ArrayList<BoardDTO> boardlist = ms.memberboardwrite(mem_no);
		model.addAttribute("boardlist", boardlist);
		
		return "boardoutform";
	}
	
	@RequestMapping(value = "/ADmemberPage")
	public String ADmemberPage(Model model, 
			@RequestParam(value = "nowPage", required = false)String nowPage) {
		MemberService ms = sqlSession.getMapper(MemberService.class);
		int total = ms.ADmemberTotal();
		int cntPage = 5;
		int cntPerPage = 15;
		if (nowPage==null) {
			nowPage="1";
		}
		
		PagingDTO page = new PagingDTO(total, Integer.parseInt(nowPage), cntPerPage, cntPage);
		
		ArrayList<MemberDTO> list = ms.memberlist();
		
		Calendar calendar = new GregorianCalendar();
		int nowyear = calendar.get(Calendar.YEAR);
		int age = 0;
		String gender = "";
		
		for (MemberDTO memberDTO : list) {
			int mem_no = (int) memberDTO.getMem_no();
		    
		    MemberDTO mdto = ms.memberdetail(mem_no);
		    String jumin = mdto.getMem_jumin();
		    if (jumin!=null) {
		    	if (jumin.length()>8) {
			    switch (jumin.substring(7, 8)) {
			    	case "1":
			            gender = "??????";
			            age = nowyear-1900-Integer.parseInt(jumin.substring(0, 2));
			            break;
			        case "2":
			            gender = "??????";
			            age = nowyear-1900-Integer.parseInt(jumin.substring(0, 2));
			            break;
			        case "3":
			            gender = "??????";
			            age = nowyear-2000-Integer.parseInt(jumin.substring(0, 2));
			            break;
			        case "4":
			            gender = "??????";
			            age = nowyear-2000-Integer.parseInt(jumin.substring(0, 2));
			            break;
			        }
				}else {
		            gender = "?????????????????? ??????";
		            age = -2;
				}
			} else {
	            gender = "?????????????????? ??????";
	            age = -1;
			}
		    memberDTO.setAge(age);
		    memberDTO.setGender(gender);
		}
		model.addAttribute("ADmemberList", list);
		model.addAttribute("page", page);
		return "ADmemberPage";
	}
	
}
