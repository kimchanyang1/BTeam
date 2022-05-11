package com.ezen.rehome;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class RehomeController {
	
	private SqlSession sqlsession;
	
	@RequestMapping(value = "/home")
	public String home() {
		return "home";
	}
	
	@RequestMapping(value = "/rehome")
	public String rehome()
	{
		return "Rehomeinputform";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/rehomeinput")
	public String rhinput(MultipartHttpServletRequest multi)
	{
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
		
		RehomeService rs = sqlsession.getMapper(RehomeService.class);
		int mem_no = Integer.parseInt(multi.getParameter("mem_no"));
		String mem_nickname = rs.memNickname(mem_no);
		String mem_tel = rs.memTel(mem_no);
		
		String rh_content = multi.getParameter("rh_content");		
		
		rs.rehomeinput(rh_gb1, rh_gb2, rh_gb3, rh_title, rh_pname, rh_pno, rh_misdate, rh_misplace, rh_image, mem_no, mem_nickname, mem_tel, rh_content);
		
		return "redirect: home";
	}
}
