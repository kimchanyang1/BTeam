package com.ezen.board;

import java.util.ArrayList;
import java.util.Map;

import com.ezen.teamb.MovePageVO;
import com.ezen.teamb.PagingDTO;

public interface BoardService {

	// �Է�
	public void boardinput(String bd_title, int mem_no, String mem_nickname, String bd_content, String bd_image);

	//���� �α�� ��ȸ
	public ArrayList<BoardDTO> boardmainout();
	
	// ������, ��ȸ�� ����
	public BoardDTO boarddetail(int bd_no);

	public void boardreadcount(int bd_no);


	// ����
	public ArrayList<BoardDTO> boardmodifyselect(int bd_no);

	public void boardmodify(String bd_title, int mem_no, String mem_nickname, String bd_content, String bd_image, int bd_no);
	
	
	// ����
	public void boarddelete(int bd_no);


	// �˻�
	public ArrayList<BoardDTO> searchtitle(String searchname);

	public ArrayList<BoardDTO> searchnickname(String searchname);


	public int boardtotalcount();


	public ArrayList<BoardDTO> boardpage(PagingDTO page);


	public MovePageVO boardMovePage(int bd_no);

	public void likesUpdate(Map<String, Object> map);

	

}
