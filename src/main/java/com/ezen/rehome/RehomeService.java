package com.ezen.rehome;

import java.util.ArrayList;

public interface RehomeService {

	public String memNickname(int mem_no);
	public String memTel(int mem_no);
	
	public void rehomeinput(String rh_gb1, String rh_gb2, String rh_gb3, String rh_title, String rh_pname, int rh_pno, String rh_misdate, String rh_misplace, String rh_image, String rh_content);
	public ArrayList<RehomeDTO> rehomeoutput();
	public RehomeDTO rehomedetail(int rh_no);
}
