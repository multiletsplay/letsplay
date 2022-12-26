package com.letplay.letplaytest.dto;

import java.util.Date;

public class InquiryDto {
	private int inqSeq;
	private String id;
	private String inqTitle;
	private String inqContent;
	private Date inqDate;
	private String replyCheck;
	
	public InquiryDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public InquiryDto(int inqSeq, String id, String inqTitle, String inqContent, Date inqDate, String replyCheck) {
		super();
		this.inqSeq = inqSeq;
		this.id = id;
		this.inqTitle = inqTitle;
		this.inqContent = inqContent;
		this.inqDate = inqDate;
		this.replyCheck = replyCheck;
	}

	public int getInqSeq() {
		return inqSeq;
	}
	public void setInqSeq(int inqSeq) {
		this.inqSeq = inqSeq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getInqTitle() {
		return inqTitle;
	}
	public void setInqTitle(String inqTitle) {
		this.inqTitle = inqTitle;
	}
	public String getInqContent() {
		return inqContent;
	}
	public void setInqContent(String inqContent) {
		this.inqContent = inqContent;
	}
	public Date getInqDate() {
		return inqDate;
	}
	public void setInqDate(Date inqDate) {
		this.inqDate = inqDate;
	}
	public String getReplyCheck() {
		return replyCheck;
	}
	public void setReplyCheck(String replyCheck) {
		this.replyCheck = replyCheck;
	}
	
}


