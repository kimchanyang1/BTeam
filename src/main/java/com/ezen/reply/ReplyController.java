package com.ezen.reply;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.bind.annotation.RequestMapping;

public class ReplyController {

	@RequestMapping(value = "/replyinput")
	public void replyinput(int bd_no, String mem_id, String rep_content, SqlSession sqlSession)
	{
		ReplyDTO dto = new ReplyDTO();
		dto.setRep_originno(bd_no);
		dto.setRep_id(mem_id);
		dto.setRep_content(rep_content);

		ReplyService res = sqlSession.getMapper(ReplyService.class);
		res.replyinput(dto);
	}
	
}
