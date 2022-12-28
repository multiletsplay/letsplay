package com.letplay.letplaytest.dto;

public class Criteria {
	private int pageNum;	//현재 페이지번호
	private int amount;		//페이지당 출력할 데이터 개수
	
	public Criteria() {this(1,10);}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		if(pageNum<=0) {
			this.pageNum=1;
		} else {
			this.pageNum = pageNum;
		}
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getSkip() {
		//특정 페이지의 범위를 정하는 구간, 현재 페이지의 게시글 시작 번호
		return (this.pageNum-1) * amount;
	}
	
}
