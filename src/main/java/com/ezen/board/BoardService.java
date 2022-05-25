package com.ezen.board;

import java.util.ArrayList;

import com.ezen.teamb.MovePageVO;
import com.ezen.teamb.PagingDTO;

public interface BoardService {

	// 입력
	public void boardinput(String bd_title, int mem_no, String mem_nickname, String bd_content, String bd_image);


	// 디테일, 조회수 증가
	public BoardDTO boarddetail(int bd_no);

	public void boardreadcount(int bd_no);


	// 수정
	public ArrayList<BoardDTO> boardmodifyselect(int bd_no);

	public void boardmodify(String bd_title, int mem_no, String mem_nickname, String bd_content, String bd_image, int bd_no);
	
	
	// 삭제
	public void boarddelete(int bd_no);


	// 검색
	public ArrayList<BoardDTO> searchtitle(String searchname);

	public ArrayList<BoardDTO> searchnickname(String searchname);


	public int boardtotalcount();


	public ArrayList<BoardDTO> boardpage(PagingDTO page);


	public MovePageVO boardMovePage(int bd_no);

	

}
