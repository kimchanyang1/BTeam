package com.ezen.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.notice.NoticeController;

@Controller
public class BoardController {
	
	private NoticeController nc = new NoticeController();
	
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
	
}
