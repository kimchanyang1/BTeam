package com.ezen.reply;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ReplyController {
	
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/replyinput")
	public String replyinput(HttpServletRequest request, Model mo) {
		ReplyService res = sqlSession.getMapper(ReplyService.class);
		String rep_table = request.getParameter("rep_table");
		int rep_originno = Integer.parseInt(request.getParameter("rep_originno"));
		String rep_id = request.getParameter("mem_id");
		String rep_content = request.getParameter("rep_content");
		Map<String, Object> map = new HashMap<>();
		map.put("rep_table", rep_table);
		map.put("rep_originno", rep_originno);
		map.put("rep_id", rep_id);
		map.put("rep_content", rep_content);
		
		res.replyInput(map);
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
	
	public void replyout(String rep_table, int rep_originno, Model mo, SqlSession sqlSession) {
		ReplyService res = sqlSession.getMapper(ReplyService.class);
		ArrayList<ReplyDTO> replist = res.boardreplyout(rep_table, rep_originno);
		mo.addAttribute("replist", replist);
	}

	@RequestMapping(value = "/replycount")
	public @ResponseBody int replyCount(@RequestParam("reply_boardno") int reply_boardno) {
		ReplyService res = sqlSession.getMapper(ReplyService.class);
		int replyCount = res.replyCount(reply_boardno);
		return replyCount;
	}
}
