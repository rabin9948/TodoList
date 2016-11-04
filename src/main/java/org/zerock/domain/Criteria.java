package org.zerock.domain;

public class Criteria {
	private int page;
	private int perPageNum;
	private String writer;
	
	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Criteria(){
		this.page = 1;
		this.perPageNum = 6;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		
		if(page <= 0){
			this.page = 1;
			return;
		}
		
		this.page = page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		
		if(perPageNum <=0 || perPageNum > 100){
			this.perPageNum = 4;
			return;
		}
		
		this.perPageNum = perPageNum;
	}
	
	
	public int getPageStart(){
		return (this.page - 1)*perPageNum;
	}
	
	
}
