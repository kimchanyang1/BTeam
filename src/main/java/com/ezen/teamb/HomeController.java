package com.ezen.teamb;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezen.missing.MissingController;
import com.ezen.notice.NoticeController;

@Controller
public class HomeController {
	
	@Autowired
	private SqlSession sqlSession;
	
	private NoticeController nc = new NoticeController();
	private MissingController mc = new MissingController();
	
	@RequestMapping(value = "/")
	public String home() {
		return "home";
	}
	
	@RequestMapping(value = "/home")
	public String home1() {
		return "home";
	}
	
	@RequestMapping(value = "/notice")
	public String notice() {
		return nc.notice();
	}
	
	@RequestMapping(value = "/missinginputform")
	public String missing() {
		return mc.missinginputform();
	}
	
	@RequestMapping(value = "/missinginput")
	public String missinginput(MultipartHttpServletRequest request) {
		return mc.missinginput(request, sqlSession);
	}
}
