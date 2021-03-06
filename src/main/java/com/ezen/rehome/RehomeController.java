package com.ezen.rehome;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.reply.ReplyController;
import com.ezen.teamb.FileUploadController;
import com.ezen.teamb.MovePageVO;
import com.ezen.teamb.PagingDTO;

@Controller
public class RehomeController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/rehomeinputform")
	public String rhinputform()
	{
		return "Rehomeinputform";
	}
	
	@RequestMapping(value = "/rehomeinput")
	public ModelAndView rhinput(MultipartHttpServletRequest multi, RehomeDTO rdto)
	{
		MultipartFile mf = multi.getFile("imagefile");
		rdto.setRh_image(mf.getOriginalFilename());

		ModelAndView mav = new ModelAndView();
		FileUploadController fuc = new FileUploadController();
		try {
			mav = fuc.upload(multi);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("redirect:rehomeoutform");
		
		RehomeService rs = sqlSession.getMapper(RehomeService.class);
		rs.rehomeinput(rdto);
		
		return mav;
	}
	
	@RequestMapping(value = "/rehomedetail")
	public String rhdetail(HttpServletRequest request, Model mo,ReplyController rep)
	{
		int rh_no = Integer.parseInt(request.getParameter("rh_no"));
		
		RehomeService rs = sqlSession.getMapper(RehomeService.class);
		rhreadcount(rh_no, sqlSession);
		RehomeDTO rd = rs.rehomedetail(rh_no);
		mo.addAttribute("rd", rd);
		if (rd.getRh_gb2().equals("λΆμμλ£")) {
			MovePageVO move = rs.rehomeEndMovePage(rh_no);
			mo.addAttribute("move",move);
		} else {
			MovePageVO move = rs.rehomeMovePage(rh_no);
			mo.addAttribute("move",move);
		}
		rep.replyout("rehome", rh_no, mo, sqlSession);
		return "Rehomedetail";
	}
	
	public void rhreadcount(int rh_no, SqlSession sqlSession)
	{
		RehomeService rs = sqlSession.getMapper(RehomeService.class);
		rs.rehomereadcount(rh_no);
	}
	
	@RequestMapping(value = "/rehomedelete")
	public String rhdelete(HttpServletRequest request)
	{
		int rh_no = Integer.parseInt(request.getParameter("rh_no"));
		
		RehomeService rs = sqlSession.getMapper(RehomeService.class);
		rs.rehomedelete(rh_no);
		
		return "redirect: rehomeoutform";
	}
	
	@RequestMapping(value = "/rehomemodifyform")
	public String rhmodifyform(HttpServletRequest request, Model mo)
	{
		int rh_no = Integer.parseInt(request.getParameter("rh_no"));
		
		RehomeService rs = sqlSession.getMapper(RehomeService.class);
		RehomeDTO rd = rs.rehomedetail(rh_no);
		mo.addAttribute("rd", rd);
		
		return "Rehomemodifyform";
	}
	
	@RequestMapping(value = "/rehomemodify")
	public ModelAndView rhmodify(MultipartHttpServletRequest multi)
	{
		int rh_no = Integer.parseInt(multi.getParameter("rh_no"));
		String rh_gb1 = multi.getParameter("rh_gb1");
		String rh_gb2 = multi.getParameter("rh_gb2");
		String rh_gb3 = multi.getParameter("rh_gb3");
		String rh_title = multi.getParameter("rh_title");
		String rh_pname = multi.getParameter("rh_pname");
		int rh_pno = Integer.parseInt(multi.getParameter("rh_pno"));
		String rh_misdate = multi.getParameter("rh_misdate");
		String rh_misplace = multi.getParameter("rh_misplace");
		MultipartFile mf = multi.getFile("rh_image");
		String rh_image = mf.getOriginalFilename();
		
		ModelAndView mav = new ModelAndView();
		RehomeService rs = sqlSession.getMapper(RehomeService.class);
		
		if(rh_image == "")
		{
			RehomeDTO rdto = rs.rehomedetail(rh_no);
			rh_image= rdto.getRh_image();
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
		
		mav.setViewName("redirect: rehomedetail?rh_no="+rh_no);
		
		
		int mem_no = Integer.parseInt(multi.getParameter("mem_no"));
		String mem_nickname = multi.getParameter("mem_nickname");
		String mem_tel = multi.getParameter("mem_tel");
		//String rh_writeday = multi.getParameter("rh_writeday");	
		String rh_content = multi.getParameter("rh_content");	
		String rh_readcount = multi.getParameter("rh_readcount");	
		

		rs.rehomemodify(rh_no, rh_gb1, rh_gb2, rh_gb3, rh_title, rh_pname, rh_pno, rh_misdate, rh_misplace, rh_image, mem_no, mem_nickname, mem_tel, rh_content, rh_readcount);		
		
		return mav;
	}
	
	@RequestMapping(value = "/rehomesearch")
	public String rhsearch(HttpServletRequest request, Model mo)
	{
		RehomeService rs = sqlSession.getMapper(RehomeService.class);
		
		String[] gb2list = request.getParameterValues("gb2");
		String[] gb3list = request.getParameterValues("gb3");
		String sword = request.getParameter("sword");
		
		RehomesearchVO rsvo = new RehomesearchVO();
		rsvo.setGb2list(gb2list);
		rsvo.setGb3list(gb3list);
		rsvo.setSword(sword);
		
		ArrayList<RehomeDTO> rdto = rs.rehomesearch(rsvo);
		mo.addAttribute("rdto", rdto);
		
		return "Rehomeoutform";
	}
	
	@RequestMapping(value = "/rehomeadmin")
	public String rehomeadmin(Model mo) {
		RehomeService rs = sqlSession.getMapper(RehomeService.class);
		ArrayList<RehomeDTO> rdto = rs.rehomeadmin();
		mo.addAttribute("rdto", rdto);
		return "rehomeadmin";
	}
	
	@RequestMapping(value = "/rehomeadminsearch")
	public String rehomeadminsearch(HttpServletRequest request, Model mo)
	{
		RehomeService rs = sqlSession.getMapper(RehomeService.class);
		
		String[] gb1list = request.getParameterValues("gb1");
		String sword = request.getParameter("sword");
		
		RehomesearchVO rsvo = new RehomesearchVO();
		rsvo.setGb1list(gb1list);
		rsvo.setSword(sword);
		
		ArrayList<RehomeDTO> rdto = rs.rehomeadminsearch(rsvo);
		mo.addAttribute("rdto", rdto);
		
		return "rehomeadmin";
	}
	
	@RequestMapping(value = "/rehomeok")
	public String rehomeok(HttpServletRequest request) {
		int rh_no = Integer.parseInt(request.getParameter("rh_no"));
		String rh_gb1 = request.getParameter("rh_gb1");
		RehomeService rs = sqlSession.getMapper(RehomeService.class);
		rs.rehomeok(rh_no, rh_gb1);
		return "redirect:rehomedetail?rh_no="+rh_no;
	}
	
	@RequestMapping(value = "/rehomeimbo", method = RequestMethod.POST)
	public String rehomeimbo(HttpServletRequest request) {
		RehomeService rs = sqlSession.getMapper(RehomeService.class);
		int rh_no = Integer.parseInt(request.getParameter("rh_no"));
		int mem_no = Integer.parseInt(request.getParameter("mem_no"));
		String mem_nickname = request.getParameter("mem_nickname");
		String mem_tel = request.getParameter("mem_tel");
		rs.rehomeimbo(rh_no, mem_no, mem_nickname, mem_tel);
		return "redirect:rehomedetail?rh_no="+rh_no;
	}
	
	@RequestMapping(value = "/rehomebun")
	public String rehomebun(HttpServletRequest request) {
		RehomeService rs = sqlSession.getMapper(RehomeService.class);
		int rh_no = Integer.parseInt(request.getParameter("rh_no"));
		rs.rehomebun(rh_no);
		return "redirect:rehomedetail?rh_no="+rh_no;
	}
	
	@RequestMapping(value = "/rehomeimboform")
	public String rehomeimboform(HttpServletRequest request, Model mo) {
		int rh_no = Integer.parseInt(request.getParameter("rh_no"));
		mo.addAttribute("rh_no", rh_no);
		return "rehomeimboform";
	}
	
	// REHOME
	@RequestMapping(value = "/rehomeend")
	public String rehomeEndPage(
			Model mo, 
			@RequestParam(value = "nowPage", required = false)String nowPage
			) {
		RehomeService rs = sqlSession.getMapper(RehomeService.class);
		int total = rs.rehomeendtotal();
		int cntPage = 5;
		int cntPerPage = 9;
		if (nowPage==null) {
			nowPage="1";
		}
		
		PagingDTO page = new PagingDTO(total, Integer.parseInt(nowPage), cntPerPage, cntPage);
		ArrayList<RehomeDTO> list = rs.rehomeendpage(page);
		
		mo.addAttribute("rehomeEndList", list);
		mo.addAttribute("page", page);
		
		return "rehomeend";
	}
	
	// REHOME
	@RequestMapping(value = "/rehomeoutform")
	public String rehomepage(PagingDTO dto, Model mo
			,@RequestParam(value="nowPage", required=false)String nowPage) {
		RehomeService rh = sqlSession.getMapper(RehomeService.class);
		int total = rh.cntpage();
		if(nowPage == null)
		{
			nowPage = "1";
		}

		dto = new PagingDTO(total, Integer.parseInt(nowPage), 15, 5);
		ArrayList<RehomeDTO> list = rh.selectpage(dto);
		mo.addAttribute("paging", dto);
		mo.addAttribute("rdto", list);
		
		return "Rehomeoutform";
	}
	
	@RequestMapping(value = "/rehomeadminpage")
	public String rehomeadminpage(PagingDTO dto, Model mo
			,@RequestParam(value="nowPage", required=false)String nowPage) {
		RehomeService rh = sqlSession.getMapper(RehomeService.class);
		int total = rh.cntpage();
		if(nowPage == null) {

			nowPage = "1";
		}
	
		dto = new PagingDTO(total, Integer.parseInt(nowPage), 15, 5);

		ArrayList<RehomeDTO> list = rh.rehomeAdminPage(dto);
		mo.addAttribute("paging", dto);
		mo.addAttribute("rdto", list);
		return "rehomeadmin";
	}	

}
