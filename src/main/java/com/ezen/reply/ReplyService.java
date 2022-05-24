package com.ezen.reply;

import java.util.ArrayList;

public interface ReplyService {

	public void replyinput(int rep_originno, String rep_id, String rep_content);
	public ArrayList<ReplyDTO> replyout(int rep_originno);
}
