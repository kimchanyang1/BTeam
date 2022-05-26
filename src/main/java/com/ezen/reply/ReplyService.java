package com.ezen.reply;

import java.util.ArrayList;
import java.util.Map;

public interface ReplyService {

	public void replyInput(Map<String, Object> map);
	public ArrayList<ReplyDTO> boardreplyout(String rep_table, int rep_originno);
	public void boardreplydelete(int rep_no);
	public int replyCount(int rep_originno);
}
