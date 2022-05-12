package com.ezen.missing;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


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
		
		MissingService mc = sqlsession.getMapper(MissingService.class);
		mc.missing_insert(mis_gb, mis_title,mis_pname,mis_pno,mis_misdate,mis_misplace,mis_image,0,"0","0",mis_content);
	;	return "redirect:home";
		
	}
}
