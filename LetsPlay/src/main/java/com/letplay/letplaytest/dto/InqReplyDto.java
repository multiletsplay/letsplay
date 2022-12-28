package com.letplay.letplaytest.dto;

import java.util.Date;

public class InqReplyDto {
	private int repSeq;
	private int inqSeq;
	private String id;
	private String repContent;
	private Date repDate;
	
	public InqReplyDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public InqReplyDto(int repSeq, int inqSeq, String id, String repContent, Date repDate) {
		super();
		this.repSeq = repSeq;
		this.inqSeq = inqSeq;
		this.id = id;
		this.repContent = repContent;
		this.repDate = repDate;
	}
	public int getRepSeq() {
		return repSeq;
	}
	public void setRepSeq(int repSeq) {
		this.repSeq = repSeq;
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
	public String getRepContent() {
		return repContent;
	}
	public void setRepContent(String repContent) {
		this.repContent = repContent;
	}
	public Date getRepDate() {
		return repDate;
	}
	public void setRepDate(Date repDate) {
		this.repDate = repDate;
	}
	
	
}
