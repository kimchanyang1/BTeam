package com.ezen.board;

import java.util.ArrayList;

public interface BoardService {

	// ���
	public ArrayList<BoardDTO> boardout();

	
	// �Է�
	public void boardinput(String bd_title, int mem_no, String mem_nickname, String bd_content, String bd_image);


	// ������
	public ArrayList<BoardDTO> boarddetail(int bd_no);

	public void boardreadcount(int bd_no);


	// ����
	public ArrayList<BoardDTO> boardmodifyselect(int bd_no);

	public void boardmodify(String bd_title, int mem_no, String mem_nickname, String bd_content, String bd_image, int bd_no);
	
	
	// ����
	public void boarddelete(int bd_no);


	// �˻�
	public ArrayList<BoardDTO> searchtitle(String searchname);

	public ArrayList<BoardDTO> searchnickname(String searchname);

	

}