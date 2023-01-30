package com.letplay.letplaytest.dto;

import java.util.Date;

public class ReplyDto {

	private int repSeq;
	private String repContent;
	private Date repRegdate;
	private String id;
	private int matchSeq;
	private String nickName;
	public ReplyDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReplyDto(int repSeq, String repContent, Date repRegdate, String id, int matchSeq, String nickName) {
		super();
		this.repSeq = repSeq;
		this.repContent = repContent;
		this.repRegdate = repRegdate;
		this.id = id;
		this.matchSeq = matchSeq;
		this.nickName = nickName;
	}
	public int getRepSeq() {
		return repSeq;
	}
	public void setRepSeq(int repSeq) {
		this.repSeq = repSeq;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getMatchSeq() {
		return matchSeq;
	}
	public void setMatchSeq(int matchSeq) {
		this.matchSeq = matchSeq;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
}
