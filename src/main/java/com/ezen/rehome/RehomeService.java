package com.ezen.rehome;

public interface RehomeService {

	public String memNickname(int mem_no);
	public String memTel(int mem_no);
	public void rehomeinput(String rh_gb1, String rh_gb2, String rh_gb3, String rh_title, String rh_pname, int rh_pno, String rh_misdate, String rh_misplace, String rh_image, int mem_no, String mem_nickname, String mem_tel, String rh_content);
}
