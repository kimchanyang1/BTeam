package com.ezen.reply;

import java.util.ArrayList;

public interface ReplyService {

	public void replyInput(String rep_table, int rep_originno, String rep_id, String rep_content);
	public ArrayList<ReplyDTO> boardreplyout(String rep_table, int rep_originno);
	public void boardreplydelete(int rep_no);
	public int replyCount(int rep_originno);
}
