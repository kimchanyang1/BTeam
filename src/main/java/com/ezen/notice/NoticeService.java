package com.ezen.notice;

import java.util.ArrayList;

import com.ezen.teamb.MovePageVO;
import com.ezen.teamb.PagingDTO;

public interface NoticeService {

	public void noticeinput(NoticeDTO dto);
	public NoticeDTO noticedetail(int nt_no);
	public void noticereadcount(int nt_no);
	public void noticemodify(int nt_no, String nt_title, String nt_content);
	public void noticedelete(int nt_no);
	
	public int noticetotalcount();
	public ArrayList<NoticeDTO> noticePage(PagingDTO page);
	public MovePageVO noticeMovePage(int nt_no);
	
}
