package com.ezen.board;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezen.notice.NoticeController;

public class BoardController {

	
	// 자유게시판으로 가라
	public String boardinputformgo() {

		return "boardinputform";

	}
	
	
	
	// 자유게시판 input
	public String boardinput(SqlSession sqlsession, MultipartHttpServletRequest multi) {
		
		MultipartFile mf = multi.getFile("bd_image");
		
		int mem_no=Integer.parseInt(multi.getParameter("mem_no"));
		String mem_nickname=multi.getParameter("mem_nickname");		

		String bd_title=multi.getParameter("bd_title");
		String bd_content=multi.getParameter("bd_content");					
		String bd_image=mf.getOriginalFilename();
		
		BoardService bs = sqlsession.getMapper(BoardService.class);
		bs.boardinput(bd_title, mem_no, mem_nickname, bd_content, bd_image);
		
		return "redirect:boardinputformgo";
	}
}
