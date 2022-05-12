package com.ezen.rehome;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class RehomeController {
	
	public String rehome()
	{
		return "Rehomeinputform";
	}
	
	public String rhinput(MultipartHttpServletRequest multi, SqlSession sqlsession)
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
		/*
		int mem_no = Integer.parseInt(multi.getParameter("mem_no"));
		String mem_nickname = rs.memNickname(mem_no);
		String mem_tel = rs.memTel(mem_no);
		*/
		
		String rh_content = multi.getParameter("rh_content");		
		
		//이미지와 콘텐츠 사이에 멤버 값 넣기
		rs.rehomeinput(rh_gb1, rh_gb2, rh_gb3, rh_title, rh_pname, rh_pno, rh_misdate, rh_misplace, rh_image, rh_content);
		
		return "redirect: home";
	}
	
	public String rhoutput(SqlSession sqlsession, Model mo)
	{
		RehomeService rs = sqlsession.getMapper(RehomeService.class);
		ArrayList<RehomeDTO> rdto = rs.rehomeoutput();
		
		mo.addAttribute("rdto", rdto);
		
		return "Rehomeoutform";
	}
}
