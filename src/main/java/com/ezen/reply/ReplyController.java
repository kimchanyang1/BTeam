package com.ezen.reply;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

public class ReplyController {

	@RequestMapping(value = "/replyinput")
	public String replyinput(HttpServletRequest request, Model mo,SqlSession sqlSession)
	{
		int rep_originno = Integer.parseInt(request.getParameter("bd_no"));
		String rep_id = request.getParameter("mem_id");
		String rep_content = request.getParameter("rep_content");
		
		ReplyService res = sqlSession.getMapper(ReplyService.class);
		res.boardreplyinput(rep_originno, rep_id, rep_content);
		replyout(rep_originno, mo, sqlSession);
		
		return "boarddetailform";
	}
	
	public void replyout(int rep_originno, Model mo, SqlSession sqlSession)
	{
		ReplyService res = sqlSession.getMapper(ReplyService.class);
		ArrayList<ReplyDTO> replist = res.boardreplyout(rep_originno);
		mo.addAttribute("replist", replist);
	}
}
