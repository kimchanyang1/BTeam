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
		String rep_table = request.getParameter("rep_table");
		int rep_originno = Integer.parseInt(request.getParameter("rep_originno"));
		String rep_id = request.getParameter("mem_id");
		String rep_content = request.getParameter("rep_content");
		
		ReplyService res = sqlSession.getMapper(ReplyService.class);
		res.replyInput(rep_table, rep_originno, rep_id, rep_content);
		
		if (rep_table.equals("board")) {
			return "redirect:boarddetail?bd_no="+rep_originno;
		} else if (rep_table.equals("missing")) {
			return "redirect:missingdetail?mis_no="+rep_originno;
		}
		else if (rep_table.equals("rehome")) {
			return "redirect:rehomedetail?rh_no="+rep_originno;
		}
		else if (rep_table.equals("epilogue")) {
			return "redirect:epiloguedetail?ep_no="+rep_originno;
		}
		return null;
	}
	
	public void replyout(String rep_table, int rep_originno, Model mo, SqlSession sqlSession)
	{
		ReplyService res = sqlSession.getMapper(ReplyService.class);
		ArrayList<ReplyDTO> replist = res.boardreplyout(rep_table, rep_originno);
		mo.addAttribute("replist", replist);
	}

	public int replyCount(SqlSession sqlSession, int reply_boardno) {
		ReplyService rs = sqlSession.getMapper(ReplyService.class);
		int replyCount = rs.replyCount(reply_boardno);
		return replyCount;
	}
}
