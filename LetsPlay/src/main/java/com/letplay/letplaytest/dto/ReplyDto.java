package com.letplay.letplaytest.dto;

import java.util.Date;

public class ReplyDto {

	private int repSeq;
	private String repContent;
	private Date repRegdate;
	private String id;
	private int matchSeq;
	public ReplyDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReplyDto(int repSeq, int matchSeq, String id, String repContent, Date repRegdate) {
		super();
		this.repSeq = repSeq;
		this.matchSeq = matchSeq;
		this.id = id;
		this.repContent = repContent;
		this.repRegdate = repRegdate;
	}
	public int getRepSeq() {
		return repSeq;
	}
	public void setRepSeq(int repSeq) {
		this.repSeq = repSeq;
	}
	public int getMatchSeq() {
		return matchSeq;
	}
	public void setMatchSeq(int matchSeq) {
		this.matchSeq = matchSeq;
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
	public Date getRepRegdate() {
		return repRegdate;
	}
	public void setRepRegdate(Date repRegdate) {
		this.repRegdate = repRegdate;
	}
}
