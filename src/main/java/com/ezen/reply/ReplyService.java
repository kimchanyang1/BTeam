package com.ezen.reply;

import java.util.ArrayList;
import java.util.Map;

public interface ReplyService {

	public void replyInput(Map<String, Object> map);
	public ArrayList<ReplyDTO> replyout(String rep_table, int rep_originno);
	public int replyCount(int rep_originno);
	public ReplyDTO replySearch(int rep_no);
	public void replyModify(Map<String, Object> map);
	public void replyDelete(int rep_no);
	public void replyReplyStep(Map<String, Object> map);
	public void replyReplyInput(Map<String, Object> map);
}
