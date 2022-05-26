package com.ezen.rehome;

import java.util.ArrayList;

import com.ezen.teamb.MovePageVO;
import com.ezen.teamb.PagingDTO;

public interface RehomeService {

	public void rehomeinput(String rh_gb2, String rh_gb3, String rh_title, String rh_pname, int rh_pno, String rh_misdate, String rh_misplace, String rh_image, int mem_no, String mem_nickname, String mem_tel, String rh_content);
	public ArrayList<RehomeDTO> rehomeoutput();
	public RehomeDTO rehomedetail(int rh_no);
	public void rehomereadcount(int rh_no);
	public void rehomedelete(int rh_no);
	public void rehomemodify(int rh_no, String rh_gb1, String rh_gb2, String rh_gb3, String rh_title, String rh_pname, int rh_pno, String rh_misdate, String rh_misplace, String rh_image, int mem_no, String mem_nickname, String mem_tel, String rh_content, String rh_readcount);
	public ArrayList<RehomeDTO> rehomesearch(RehomesearchVO sword);
	public ArrayList<RehomeDTO> rehomeadmin();
	public ArrayList<RehomeDTO> rehomeadminsearch(RehomesearchVO sword);
	public void rehomeok(int rh_no, String rh_gb1);
	public void rehomeimbo(int rh_no, int mem_no, String mem_nickname, String mem_tel);
	public void rehomebun(int rh_no);
	public int cntpage();
	public ArrayList<RehomeDTO> selectpage(PagingDTO dto);
	
	public ArrayList<RehomeDTO> rehomeendpage(PagingDTO page);
	public int rehomeendtotal();
	public MovePageVO rehomeMovePage(int rh_no);
	public MovePageVO rehomeEndMovePage(int rh_no);
	public ArrayList<RehomeDTO> rehomeAdminPage(PagingDTO dto);
	
}
