package com.ezen.rehome;

import java.util.ArrayList;
import java.util.List;

public interface RehomeService {

	public void rehomeinput(String rh_gb1, String rh_gb2, String rh_gb3, String rh_title, String rh_pname, int rh_pno, String rh_misdate, String rh_misplace, String rh_image, int mem_no, String mem_nickname, String mem_tel, String rh_content);
	public ArrayList<RehomeDTO> rehomeoutput();
	public RehomeDTO rehomedetail(int rh_no);
	public void rehomedelete(int rh_no);
	public void rehomemodify(int rh_no, String rh_gb1, String rh_gb2, String rh_gb3, String rh_title, String rh_pname, int rh_pno, String rh_misdate, String rh_misplace, String rh_image, int mem_no, String mem_nickname, String mem_tel, String rh_content, String rh_readcount);
	public ArrayList<RehomeDTO> rehomesearch(RehomesearchVO sword);
}
