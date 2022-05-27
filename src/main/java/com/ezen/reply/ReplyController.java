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
	public String replyinput(HttpServletRequest request) {
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
		ArrayList<ReplyDTO> replist = res.replyout(rep_table, rep_originno);
		mo.addAttribute("replist", replist);
	}

	@RequestMapping(value = "/replycount")
	public @ResponseBody int replyCount(@RequestParam("reply_boardno") int reply_boardno) {
		ReplyService res = sqlSession.getMapper(ReplyService.class);
		int replyCount = res.replyCount(reply_boardno);
		return replyCount;
	}
	
	@RequestMapping(value = "/replyModify")
	public String replyModify(HttpServletRequest request) {
		ReplyService res = sqlSession.getMapper(ReplyService.class);
		
		int rep_no = Integer.parseInt(request.getParameter("rep_no"));
		String rep_content = request.getParameter("rep_content");

		Map<String, Object> map = new HashMap<>();
		map.put("rep_no", rep_no);
		map.put("rep_content", rep_content);
		
		res.replyModify(map);
		
		ReplyDTO rdto = res.replySearch(rep_no);
		String rep_table = rdto.getRep_table();
		int rep_originno = rdto.getRep_originno();
		
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

	@RequestMapping(value = "/replyDelete")
	public String replyDelete(HttpServletRequest request) {
		ReplyService res = sqlSession.getMapper(ReplyService.class);
		
		int rep_no = Integer.parseInt(request.getParameter("rep_no"));

		ReplyDTO rdto = res.replySearch(rep_no);
		res.replyDelete(rep_no);
		
		String rep_table = rdto.getRep_table();
		int rep_originno = rdto.getRep_originno();
		
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



	@RequestMapping(value = "/replyReplyInput")
	public String replyReplyInput(HttpServletRequest request) {
		ReplyService res = sqlSession.getMapper(ReplyService.class);
		
		String rep_table = request.getParameter("rep_table");
		int rep_originno = Integer.parseInt(request.getParameter("rep_originno"));
		int rep_repno = Integer.parseInt(request.getParameter("rep_repno"));
		int rep_indent = Integer.parseInt(request.getParameter("rep_indent"));
		int rep_step = Integer.parseInt(request.getParameter("rep_step"));
		String rep_id = request.getParameter("rep_id");
		String rep_content = request.getParameter("rep_content");
		
		Map<String, Object> map = new HashMap<>();
		map.put("rep_table", rep_table);
		map.put("rep_originno", rep_originno);
		map.put("rep_id", rep_id);
		map.put("rep_content", rep_content);
		map.put("rep_repno", rep_repno);
		map.put("rep_indent", rep_indent+1);
		map.put("rep_step", rep_step+1);
		
		res.replyReplyStep(map);
		
		res.replyReplyInput(map);
		
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
}
