package com.ezen.rehome;

public class RehomesearchVO {

	String[] gb2list;
	String[] gb3list;
	
	String gb2;
	String gb3;
	
	String sword;

	public RehomesearchVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RehomesearchVO(String[] gb2list, String[] gb3list, String gb2, String gb3, String sword) {
		super();
		this.gb2list = gb2list;
		this.gb3list = gb3list;
		this.gb2 = gb2;
		this.gb3 = gb3;
		this.sword = sword;
	}

	public String[] getGb2list() {
		return gb2list;
	}

	public void setGb2list(String[] gb2list) {
		this.gb2list = gb2list;
	}

	public String[] getGb3list() {
		return gb3list;
	}

	public void setGb3list(String[] gb3list) {
		this.gb3list = gb3list;
	}

	public String getGb2() {
		return gb2;
	}

	public void setGb2(String gb2) {
		this.gb2 = gb2;
	}

	public String getGb3() {
		return gb3;
	}

	public void setGb3(String gb3) {
		this.gb3 = gb3;
	}

	public String getSword() {
		return sword;
	}

	public void setSword(String sword) {
		this.sword = sword;
	}
}
