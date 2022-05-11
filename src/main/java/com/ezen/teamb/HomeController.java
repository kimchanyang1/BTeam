package com.ezen.teamb;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezen.notice.NoticeController;
import com.ezen.rehome.RehomeController;

@Controller
public class HomeController {
	
	@Autowired
	private SqlSession sqlsession;
	
	private NoticeController nc = new NoticeController();
	private RehomeController rc = new RehomeController();
	
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
	
	@RequestMapping(value = "/rehome")
	public String rehome() {
		return rc.rehome();
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/rehomeinput")
	public String rhinput(MultipartHttpServletRequest multi) {
		return rc.rhinput(multi, sqlsession);
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/rehomeoutput")
	public String rhoutput(Model mo) {
		return rc.rhoutput(sqlsession, mo);
	}
	
}
