package com.ezen.teamb;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezen.board.BoardController;
import com.ezen.notice.NoticeController;

@Controller
public class HomeController {

	@Autowired
	private SqlSession sqlsession;
	
	
	// BoardControlloer
	private BoardController bc = new BoardController();
	
	@RequestMapping(value = "/board")
	public String bb0()	{
		
		return bc.boardinputformgo();
	}
	
	@RequestMapping(value = "/boardinput")
	public String bb1(MultipartHttpServletRequest multi) {
		
		return bc.boardinput(sqlsession, multi);
	}
	
}
