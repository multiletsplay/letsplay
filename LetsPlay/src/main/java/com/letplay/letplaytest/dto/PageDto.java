package com.letplay.letplaytest.dto;

public class PageDto {
	private int pageCount =10 ;	//화면 하단에 출력할 페이지 사이즈
	private int total;		//전체 데이터 개수
	private int startPage;	//화면 시작 번호
	private int endPage;	//화면 끝 번호
	private int realEnd;
	private boolean prev;	//페이지 이전버튼 활성화여부
	private boolean next;	//페이지 다음버튼 활성화여부
	private Criteria cri;
	
	public PageDto() {}
	
//	public PageDto(int pageCount, int total,Criteria cri) {
//		this.pageCount = pageCount;
//		this.total = total;
//		this.cri = cri;
//		
//		this.endPage = (int)(Math.ceil(cri.getPageNum()*1.0/pageCount))*pageCount;
//		this.startPage = endPage - (pageCount -1);
//		
//		int realEnd = (int)(Math.ceil(total*1.0/cri.getAmount()));
//		
//		if(endPage>realEnd) {
//			this.endPage = realEnd == 0 ? 1 : realEnd;
//		}
//		
//		this.prev = this.startPage >1;
//		this.next = this.endPage <realEnd;
//		
//	}

	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
		pagingData();
    }
    
    private void pagingData() {
        
        endPage = (int) (Math.ceil(cri.getPageNum()*1.0 / (double) pageCount) * pageCount);
        // endPage = (현재 페이지 번호 / 화면에 보여질 페이지 번호의 개수) * 화면에 보여질 페이지 번호의 개수
        startPage = (endPage - pageCount) + 1;
        // startPage = (끝 페이지 번호 - 화면에 보여질 페이지 번호의 개수) + 1
        
        realEnd = (int)(Math.ceil(total*1.0/cri.getAmount()));
        int tempEndPage = (int) (Math.ceil(total / (double) cri.getAmount()));    
        if(endPage > tempEndPage) {
            endPage = tempEndPage;
        }
        // 마지막 페이지 번호 = 총 게시글 수 / 한 페이지당 보여줄 게시글의개수
        
        this.prev = (startPage == 1) ? false : true;  
        // 이전 버튼 생성 여부 = 시작 페이지 번호가 1과 같으면 false, 아니면 true
        this.next = (endPage * cri.getAmount()) >= total ? false : true;
        // 다음 버튼 생성 여부 = 끝 페이지 번호 * 한 페이지당 보여줄 게시글의 개수가 총 게시글의 수보다
        // 크거나 같으면 false, 아니면 true
    }
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
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
	public int getRealEnd() {
		return realEnd;
	}
	public void setRealEnd(int realEnd) {
		this.realEnd = realEnd;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public Criteria getCri() {
		return cri;
	}
	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	
}
