package com.ezen.epilogue;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.member.MemberDTO;
import com.ezen.reply.ReplyController;
import com.ezen.teamb.FileUploadController;
import com.ezen.teamb.MovePageVO;
import com.ezen.teamb.PagingDTO;

@Controller
public class EpilogueController {
	
	@Autowired
	private SqlSession sqlSession;
	
	//EPILOGUE	
	@RequestMapping(value = "/epilogue")
	public String epiloguepage(Model mo, PagingDTO dto, 
			@RequestParam(value="nowPage", required=false)String nowPage) {
		EpilogueService ep = sqlSession.getMapper(EpilogueService.class);
	int total = ep.cntpage();
	if(nowPage == null)
	{
		nowPage = "1";
	}

	dto = new PagingDTO(total, Integer.parseInt(nowPage), 15, 5);
	mo.addAttribute("paging", dto);
	mo.addAttribute("epiloguelist", ep.selectpage(dto));
	
	return "epilogueoutform";
	
	}
	
	
	// input
	@RequestMapping(value = "/epilogueinputform")
	public String epilogueinputform(HttpServletRequest request, Model md) {

		HttpSession hs = request.getSession();
		
		int mem_no = (int) hs.getAttribute("mem_no");
		String mem_nickname = (String) hs.getAttribute("mem_nickname");
		String ep_gb = request.getParameter("ep_gb");
		int ep_originno = Integer.parseInt(request.getParameter("ep_originno"));
		
		md.addAttribute("mem_no", mem_no);
		md.addAttribute("mem_nickname", mem_nickname);
		md.addAttribute("ep_gb", ep_gb);
		md.addAttribute("ep_originno", ep_originno);
		
		return "epilogueinputform";
	}
	
	@RequestMapping(value = "/epilogueinput")
	public ModelAndView epilogueinput(MultipartHttpServletRequest multi) {
		
		MultipartFile mf = multi.getFile("ep_image");
		
		String ep_gb=multi.getParameter("ep_gb");
		String ep_title=multi.getParameter("ep_title");
		String ep_content=multi.getParameter("ep_content");					
		String ep_image=mf.getOriginalFilename();

		ModelAndView mav = new ModelAndView();
		FileUploadController fuc = new FileUploadController();
		try {
			mav = fuc.upload(multi);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("redirect:epilogue");

		int ep_originno=Integer.parseInt(multi.getParameter("ep_originno"));
		int mem_no=Integer.parseInt(multi.getParameter("mem_no"));
		String mem_nickname=multi.getParameter("mem_nickname");
		
		EpilogueService ep = sqlSession.getMapper(EpilogueService.class);
		ep.epilogueinput(ep_originno, ep_gb, ep_title, mem_no, mem_nickname, ep_content, ep_image);
		
		return mav;
	}
	
	
	// detail
	@RequestMapping(value = "/epiloguedetail")
	public String epiloguedetailform(HttpServletRequest request, Model md,ReplyController rep) {
		
		HttpSession hs = request.getSession();
		MemberDTO login = (MemberDTO) hs.getAttribute("login");

		if (login != null) {
			
			int mem_no = login.getMem_no();
			String mem_id = login.getMem_id();
			String mem_nickname = login.getMem_nickname();
	    	   
			md.addAttribute("mem_no", mem_no);
			md.addAttribute("mem_id", mem_id);
			md.addAttribute("mem_nickname", mem_nickname);
		}
		
		int ep_no=Integer.parseInt(request.getParameter("ep_no"));
		
		EpilogueService ep = sqlSession.getMapper(EpilogueService.class);
		epiloguereadcount(ep_no, sqlSession);
		EpilogueDTO epiloguedetail = ep.epiloguedetail(ep_no);
		MovePageVO move = ep.epilogueMovePage(ep_no);
		md.addAttribute("epiloguedetail", epiloguedetail);
		md.addAttribute("move", move);
		
		rep.replyout("epilogue", ep_no, md, sqlSession);
		return "epiloguedetailform";
	}
	
	public void epiloguereadcount(int ep_no, SqlSession sqlSession) {
		
		EpilogueService ep = sqlSession.getMapper(EpilogueService.class);
		ep.epiloguereadcount(ep_no);
	}
	
	
	// modify
	@RequestMapping(value = "/epiloguemodifyselect")
	public String epiloguemodifyselect(HttpServletRequest request, Model md) {
		
		int ep_no=Integer.parseInt(request.getParameter("ep_no"));
		int mem_no=Integer.parseInt(request.getParameter("mem_no"));
		String mem_nickname=request.getParameter("mem_nickname");
		
		EpilogueService ep = sqlSession.getMapper(EpilogueService.class);
		EpilogueDTO epiloguelist = ep.epiloguemodifyselect(ep_no);
		md.addAttribute("epiloguelist", epiloguelist);
		md.addAttribute("mem_no", mem_no);
		md.addAttribute("mem_nickname", mem_nickname);
		
		return "epiloguemodifyform";
	}
	
	@RequestMapping(value = "/epiloguemodify")
	public ModelAndView epiloguemodify(MultipartHttpServletRequest multi) {
		
		MultipartFile mf = multi.getFile("ep_image");
		
		int ep_no=Integer.parseInt(multi.getParameter("ep_no"));
		String ep_title=multi.getParameter("ep_title");
		String ep_content=multi.getParameter("ep_content");
		String ep_image=mf.getOriginalFilename();
		
		ModelAndView mav = new ModelAndView();
		EpilogueService ep = sqlSession.getMapper(EpilogueService.class);
		
		if(ep_image == "")
		{
			EpilogueDTO edto = ep.epiloguedetail(ep_no);
			ep_image= edto.getEp_image();
		}
		else
		{
			
			FileUploadController fuc = new FileUploadController();
			try {
				mav = fuc.upload(multi);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		mav.setViewName("redirect: epilogue");
		
		int mem_no=Integer.parseInt(multi.getParameter("mem_no"));
		String mem_nickname=multi.getParameter("mem_nickname");
		
		
		ep.epiloguemodify(ep_title, mem_no, mem_nickname, ep_content, ep_image, ep_no);
		
		return mav;
	}


	// delete
	@RequestMapping(value = "/epiloguedelete")
	public String epiloguedelete(HttpServletRequest request, Model md) {
		
		int ep_no=Integer.parseInt(request.getParameter("ep_no"));
		
		EpilogueService ep = sqlSession.getMapper(EpilogueService.class);
		ep.epiloguedelete(ep_no);
		
		return "redirect: epilogue";
	}
	
	
	// search
	@RequestMapping(value = "/epiloguesearch")
	public String epiloguesearch(HttpServletRequest request, Model md) {
		
		String selectname1 = request.getParameter("selectname1");
		String selectname2 = request.getParameter("selectname2");		
		String searchname = request.getParameter("searchname");
		
		EpilogueService ep = sqlSession.getMapper(EpilogueService.class);
		ArrayList<EpilogueDTO> epiloguelist = null;
		
		if(selectname1.equals("gohome"))
		{
			if(selectname2.equals("ep_title"))
			{
				epiloguelist = ep.searchgohometitle(searchname);
			}
			else
			{
				epiloguelist = ep.searchgohomenickname(searchname);
			}
		}
		else if(selectname1.equals("rehome"))
		{
			if(selectname2.equals("ep_title"))
			{
				epiloguelist = ep.searchrehometitle(searchname);
			}
			else
			{
				epiloguelist = ep.searchrehomenickname(searchname);
			}
		}
		
		md.addAttribute("epiloguelist", epiloguelist);
		
		return "epilogueoutform";
	}

	
}
