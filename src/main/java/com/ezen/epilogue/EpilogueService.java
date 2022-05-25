package com.ezen.epilogue;

import java.util.ArrayList;

import com.ezen.teamb.MovePageVO;
import com.ezen.teamb.PagingDTO;

public interface EpilogueService {

	// 占쏙옙占�
	public ArrayList<EpilogueDTO> epilogueout();

	
	// 占쌉뤄옙
	public void epilogueinput(int ep_originno, String ep_gb, String ep_title, int mem_no, String mem_nickname, String ep_content, String ep_image);


	
	public EpilogueDTO epiloguedetail(int ep_no);

	public void epiloguereadcount(int ep_no);


	// 占쏙옙占쏙옙
	public EpilogueDTO epiloguemodifyselect(int ep_no);

	public void epiloguemodify(String ep_title, int mem_no, String mem_nickname, String ep_content, String ep_image, int ep_no);


	// 占쏙옙占쏙옙
	public void epiloguedelete(int ep_no);


	// 占싯삼옙
	public ArrayList<EpilogueDTO> searchgohometitle(String searchname);

	public ArrayList<EpilogueDTO> searchgohomenickname(String searchname);

	public ArrayList<EpilogueDTO> searchrehometitle(String searchname);

	public ArrayList<EpilogueDTO> searchrehomenickname(String searchname);

	public int cntpage();
	
	public ArrayList<EpilogueDTO> selectpage(PagingDTO dto);


	public MovePageVO epilogueMovePage(int ep_no);

}
