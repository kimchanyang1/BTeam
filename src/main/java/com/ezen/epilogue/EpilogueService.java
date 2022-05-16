package com.ezen.epilogue;

import java.util.ArrayList;

public interface EpilogueService {

	// 출력
	public ArrayList<EpilogueDTO> epilogueout();

	
	// 입력
	public void epilogueinput(int ep_originno, String ep_gb, String ep_title, int mem_no, String mem_nickname, String ep_content, String ep_image);


	// 디테일, 조회수 증가
	public ArrayList<EpilogueDTO> epiloguedetail(int ep_no);

	public void epiloguereadcount(int ep_no);


	// 수정
	public ArrayList<EpilogueDTO> epiloguemodifyselect(int ep_no);

	public void epiloguemodify(String ep_title, int mem_no, String mem_nickname, String ep_content, String ep_image, int ep_no);


	// 삭제
	public void epiloguedelete(int ep_no);


	// 검색
	public ArrayList<EpilogueDTO> searchgohometitle(String searchname);

	public ArrayList<EpilogueDTO> searchgohomenickname(String searchname);

	public ArrayList<EpilogueDTO> searchrehometitle(String searchname);

	public ArrayList<EpilogueDTO> searchrehomenickname(String searchname);

	

}
