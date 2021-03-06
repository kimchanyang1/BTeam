package com.ezen.missing;

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
import com.ezen.reply.ReplyController;
import com.ezen.teamb.FileUploadController;
import com.ezen.teamb.MovePageVO;
import com.ezen.teamb.PagingDTO;

@Controller
public class MissingController {
	
	@Autowired
	private SqlSession sqlSession;

	// out
	@RequestMapping(value = "/missingend")
	public String missingEndPage(
			Model model, 
			@RequestParam(value = "nowPage", required = false)String nowPage
			) {
		MissingService micdao = sqlSession.getMapper(MissingService.class);
		int total = micdao.missingEndTotal();
		int cntPage = 5;
		int cntPerPage = 9;
		if (nowPage==null) {
			nowPage="1";
		}
		
		PagingDTO page = new PagingDTO(total, Integer.parseInt(nowPage), cntPerPage, cntPage);
		ArrayList<MissingDTO> list = micdao.missingEndPage(page);
		
		model.addAttribute("missingEndList", list);
		model.addAttribute("page", page);
		
		return "missingend";
	}
	

	@RequestMapping(value = "/missinginputform")
	public String missinginputform()
	{
			return "missinginputform";
	}


	@RequestMapping(value = "/missinginput")
	public ModelAndView missinginput(MultipartHttpServletRequest multi) {
		String mis_gb = "실종";
		String mis_gb2 = multi.getParameter("mis_gb2");
		String mis_title = multi.getParameter("mis_title");
		String mis_pname = multi.getParameter("mis_pname");
		String mis_content = multi.getParameter("mis_content");
		String mis_misdate = multi.getParameter("mis_misdate");
		String mis_misplace = multi.getParameter("mis_misplace");
		String mis_pno = multi.getParameter("mis_pno");
		MultipartFile mf = multi.getFile("mis_image");
		String mis_image = mf.getOriginalFilename();
		
		ModelAndView mav = new ModelAndView();
		FileUploadController fuc = new FileUploadController();
		try {
			mav = fuc.upload(multi);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("redirect: missingoutform");
		
		HttpSession hs = multi.getSession();
        int mem_no = (int) hs.getAttribute("mem_no");
        String mem_nickname = (String) hs.getAttribute("mem_nickname");
        String mem_tel = (String) hs.getAttribute("mem_tel");
        
        System.out.println(mem_no);
        System.out.println(mem_nickname);
        System.out.println(mem_tel);
		
		MissingService mic = sqlSession.getMapper(MissingService.class);
		mic.missing_insert(mis_gb,mis_gb2, mis_title,mis_pname,mis_pno,mis_misdate,mis_misplace,mis_image, mem_no, mem_nickname, mem_tel ,mis_content);
		return mav;
		
	}

	@RequestMapping(value = "/missingdetail")
	public String missingdetail(HttpServletRequest request, Model mo,ReplyController rep)
	{
		int mis_no;
		mis_no = Integer.parseInt(request.getParameter("mis_no"));
		missingreadcount(mis_no, sqlSession);
		MissingService micdao = sqlSession.getMapper(MissingService.class);
		MissingDTO missingdetail = micdao.missingdetail(mis_no);
		mo.addAttribute("mic",missingdetail);
		if (missingdetail.getMis_gb().equals("실종")) {
			MovePageVO move = micdao.missingMovePage(mis_no);
			mo.addAttribute("move",move);
		} else if (missingdetail.getMis_gb().equals("귀가")) {
			MovePageVO move = micdao.missingEndMovePage(mis_no);
			mo.addAttribute("move",move);
		}
		rep.replyout("missing", mis_no, mo, sqlSession);
		return "missingdetail";
	}
	
	public void missingreadcount(int mis_no, SqlSession sqlSession)
	{
		MissingService micdao = sqlSession.getMapper(MissingService.class);
		micdao.missingreadcount(mis_no);
	}
	

	@RequestMapping(value = "/missingdelete")
	public String missingdelete(HttpServletRequest request)
	{
		int mis_no = Integer.parseInt(request.getParameter("mis_no"));
		
		MissingService micdao = sqlSession.getMapper(MissingService.class);
		micdao.missingdelete(mis_no);
	
		return "redirect:missingoutform";
	}
	

	@RequestMapping(value = "/missingmodifyform")
	public String missingmodifyform(HttpServletRequest request,Model mo)
	{
		int mis_no = Integer.parseInt(request.getParameter("mis_no"));
		
		MissingService micdao = sqlSession.getMapper(MissingService.class);
		MissingDTO micdto = micdao.missingdetail(mis_no);
		mo.addAttribute("mic", micdto);
		
		return "missingmodifyform";
	}
	

	@RequestMapping(value = "/missingmodifyinput")
	public ModelAndView missingmodifyinput(MultipartHttpServletRequest multi)
	{		
		int mis_no = Integer.parseInt(multi.getParameter("mis_no"));
		String mis_gb = multi.getParameter("mis_gb");	
		String mis_gb2 = multi.getParameter("mis_gb2");	
		String mis_title = multi.getParameter("mis_title");
		String mis_pname = multi.getParameter("mis_pname");
		String mis_content = multi.getParameter("mis_content");
		String mis_misdate = multi.getParameter("mis_misdate");
		String mis_misplace = multi.getParameter("mis_misplace");
		String mis_pno = multi.getParameter("mis_pno");
		MultipartFile mf = multi.getFile("mis_image");
		String mis_image = mf.getOriginalFilename();
		
		ModelAndView mav = new ModelAndView();
		MissingService mic = sqlSession.getMapper(MissingService.class);
		
		if(mis_image == "")
		{
			MissingDTO mdto = mic.missingdetail(mis_no);
			mis_image= mdto.getMis_image();
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
		
		mav.setViewName("redirect: missingoutform");
		
		String mis_readcount = multi.getParameter("mis_readcount");	
				
		HttpSession hs = multi.getSession();
        int mem_no = (int) hs.getAttribute("mem_no");
        String mem_nickname = (String) hs.getAttribute("mem_nickname");
        String mem_tel = (String) hs.getAttribute("mem_tel");
		 
		
		mic.missingmodify_insert(mis_no, mis_gb, mis_gb2, mis_title,mis_pname,mis_pno,mis_misdate,mis_misplace,mis_image, mem_no, mem_nickname, mem_tel,mis_content,mis_readcount);
		return mav;
	}


	@RequestMapping(value = "/rehoming")
	public String rehoming(HttpServletRequest request) 
	{
		int mis_no = Integer.parseInt(request.getParameter("mis_no"));
		MissingService mic = sqlSession.getMapper(MissingService.class);
		mic.rehoming(mis_no);
		return "redirect:missingdetail?mis_no="+mis_no;
	}



	@RequestMapping(value = "/missingoutform")
	public String missingpage(PagingDTO dto, Model mo
				,@RequestParam(value="nowPage", required=false)String nowPage)
	{
		MissingService mic = sqlSession.getMapper(MissingService.class);
		int total = mic.cntpage();
		if(nowPage == null)
		{
			nowPage = "1";
		}
	
		dto = new PagingDTO(total, Integer.parseInt(nowPage), 15, 5);
		mo.addAttribute("paging", dto);
		mo.addAttribute("missingout", mic.selectpage(dto));
		
		return "missingoutform";
	}
		
}
