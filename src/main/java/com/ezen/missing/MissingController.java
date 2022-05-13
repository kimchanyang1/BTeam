package com.ezen.missing;

import java.security.Provider.Service;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class MissingController {
	
	public String missinginputform()
	{
			return "missinginputform";
	}
	
	
	
	@RequestMapping(value="/missinginput",method = RequestMethod.POST)
	public String missinginput(MultipartHttpServletRequest multi, SqlSession sqlsession) {
		String mis_gb = multi.getParameter("mis_gb");		
		String mis_title = multi.getParameter("mis_title");
		String mis_pname = multi.getParameter("mis_pname");
		String mis_content = multi.getParameter("mis_content");
		String mis_misdate = multi.getParameter("mis_misdate");
		String mis_misplace = multi.getParameter("mis_misplace");
		String mis_pno = multi.getParameter("mis_pno");
		MultipartFile mf = multi.getFile("mis_image");
		String mis_image = mf.getOriginalFilename();
		
		MissingService mic = sqlsession.getMapper(MissingService.class);
		mic.missing_insert(mis_gb, mis_title,mis_pname,mis_pno,mis_misdate,mis_misplace,mis_image,0,"0","0",mis_content);
		return "redirect:home";
		
	}
	
	public String missingoutform(Model mo, SqlSession sqlsession)
	{
			MissingService micdao = sqlsession.getMapper(MissingService.class);
			ArrayList<MissingDTO> missingout = micdao.missingout();
			mo.addAttribute("missingout",missingout);
			return "missingoutform";
	}
	
	@RequestMapping(value="/missingdetail")
	public String missingdetail(HttpServletRequest request, Model mo,SqlSession sqlsession)
	{
		int mis_no;
	
		mis_no = Integer.parseInt(request.getParameter("mis_no"));
		
		MissingService micdao = sqlsession.getMapper(MissingService.class);
		ArrayList<MissingDTO> missingdetail = micdao.missingdetail(mis_no);
		mo.addAttribute("missingdetail",missingdetail);
			
		return "missingdetail";
	}
	
	@RequestMapping(value="/missingdelete")
	public String missingdelete(HttpServletRequest request,SqlSession sqlsession)
	{
		int mis_no;
		mis_no = Integer.parseInt(request.getParameter("mis_no"));
		
		MissingService micdao = sqlsession.getMapper(MissingService.class);
		micdao.missingdelete(mis_no);

		
		return "redirect:home";
	}
	
	@RequestMapping(value="/missingmodifyform")
	public String missingmodifyform(HttpServletRequest request,Model mo, SqlSession sqlsession)
	{
		int mis_no;
		mis_no = Integer.parseInt(request.getParameter("mis_no"));
		
		MissingService micdao = sqlsession.getMapper(MissingService.class);
		MissingDTO micdto = micdao.missingmodifyinputform(mis_no);
		mo.addAttribute("micdto", micdto);
		
		return "missingmodifyform";
	}
	
	@RequestMapping(value="/missingmodifyinput",method = RequestMethod.POST)
	public String missingmodifyinput(MultipartHttpServletRequest multi, SqlSession sqlsession)
	{
		int mis_no = Integer.parseInt(multi.getParameter("mis_no"));
		String mis_gb = multi.getParameter("mis_gb");		
		String mis_title = multi.getParameter("mis_title");
		String mis_pname = multi.getParameter("mis_pname");
		String mis_content = multi.getParameter("mis_content");
		String mis_misdate = multi.getParameter("mis_misdate");
		String mis_misplace = multi.getParameter("mis_misplace");
		String mis_pno = multi.getParameter("mis_pno");
		MultipartFile mf = multi.getFile("mis_image");
		String mis_image = mf.getOriginalFilename();
		
		MissingService mic = sqlsession.getMapper(MissingService.class);
		mic.missingmodify_insert(mis_gb, mis_title,mis_pname,mis_pno,mis_misdate,mis_misplace,mis_image,mis_content,mis_no);
		return "redirect:home";
	}
	
}
