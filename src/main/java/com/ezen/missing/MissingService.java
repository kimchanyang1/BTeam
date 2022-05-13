package com.ezen.missing;

import java.util.ArrayList;

public interface MissingService {
	public void missing_insert(String mis_gb,String mis_title,String mis_pname,String mis_pno,String mis_misdate,String mis_misplace,String mis_image,int mem_no,String mem_nickname,String mem_tel,String mis_content);
	public ArrayList<MissingDTO> missingout();
	public MissingDTO missingdetail(int mis_no);
	public void missingdelete(int mis_no);
	public void missingmodify_insert(int mis_no, String mis_gb,String mis_title,String mis_pname,String mis_pno,String mis_misdate,String mis_misplace,String mis_image,int mem_no, String mem_nickname, String mem_tel, String mis_content,String mis_readcount);
}
