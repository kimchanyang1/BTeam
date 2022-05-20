package com.ezen.teamb;


public class PagingDTO {
	//          내가 보는   아래에 보여지는 아래에 보여지는 보유중인   모든 자료의   현재 페이지의
	//          현재 페이지, 시작 페이지,  마지막 페이지, 총 자료 수, 최종 페이지, 시작,     끝
	private int nowPage, startPage, endPage,    total,   lastPage, start, end;
	//한 페이지당 몇개의 페이지를 보여줄 건지
	private int cntPage;
	//한 페이지당 항목 개수
	private int cntPerPage;
	
	
	
	public PagingDTO() {
		super();
	
	}

	public PagingDTO(int total, int nowPage, int cntPerPage, int cntPage)
	{
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		setCntPage(cntPage);
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), getCntPage());
		calcStartEnd(getNowPage(), getCntPerPage());
	}
	
	public void calcLastPage(int total, int cntPerPage) {
		setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
	}
	
	public void calcStartEndPage(int nowPage, int cntPage)
	{
		setEndPage((int)Math.ceil((double)nowPage / (double)cntPage) * cntPage);
		if(getLastPage()<getEndPage())
		{
			setEndPage(getLastPage());
		}
		setStartPage(getEndPage() - cntPage + 1);
		if(getStartPage() < 1)
		{
			setStartPage(1);
		}		
	}
	
	public void calcStartEnd(int nowpage, int cntPerPage)
	{
		setEnd(nowPage * cntPerPage);
		setStart(getEnd()-cntPerPage + 1);
		
	}
	
		
	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCntPerPage() {
		return cntPerPage;
	}

	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getCntPage() {
		return cntPage;
	}

	public void setCntPage(int cntPage) {
		this.cntPage = cntPage;
	}
	
	
}
