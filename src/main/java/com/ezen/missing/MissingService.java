package com.ezen.missing;

import java.util.ArrayList;




public interface MissingService {
	public void missing_insert(String mis_gb,String mis_title,String mis_pname,String mis_pno,String mis_misdate,String mis_misplace,String mis_image,int i,String j,String k,String mis_content);
	public ArrayList<MissingDTO> missingout();
	public ArrayList<MissingDTO> missingdetail(int mis_no);
	public void missingdelete(int mis_no);
	public MissingDTO missingmodifyinputform(int mis_no);
	public void missingmodify_insert(String mis_gb,String mis_title,String mis_pname,String mis_pno,String mis_misdate,String mis_misplace,String mis_image,String mis_content,int mis_no);
}
