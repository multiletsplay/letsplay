package com.letplay.letplaytest.dto;

import java.util.Date;

public class ReviewDto {
	private int revId;
	private String nickname;
	private int lesSeq;
	private int facSeq;
	private int revRate;
	private String revContent;
	private Date revWritedate;
	private Date revModidate;
	
	public ReviewDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReviewDto(int revId, String nickname, int lesSeq, int facSeq, int revRate, String revContent,
			Date revWritedate, Date revModidate) {
		super();
		this.revId = revId;
		this.nickname = nickname;
		this.lesSeq = lesSeq;
		this.facSeq = facSeq;
		this.revRate = revRate;
		this.revContent = revContent;
		this.revWritedate = revWritedate;
		this.revModidate = revModidate;
	}

	public int getRevId() {
		return revId;
	}

	public void setRevId(int revId) {
		this.revId = revId;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getLesSeq() {
		return lesSeq;
	}

	public void setLesSeq(int lesSeq) {
		this.lesSeq = lesSeq;
	}

	public int getFacSeq() {
		return facSeq;
	}

	public void setFacSeq(int facSeq) {
		this.facSeq = facSeq;
	}

	public int getRevRate() {
		return revRate;
	}

	public void setRevRate(int revRate) {
		this.revRate = revRate;
	}

	public String getRevContent() {
		return revContent;
	}

	public void setRevContent(String revContent) {
		this.revContent = revContent;
	}

	public Date getRevWritedate() {
		return revWritedate;
	}

	public void setRevWritedate(Date revWritedate) {
		this.revWritedate = revWritedate;
	}

	public Date getRevModidate() {
		return revModidate;
	}

	public void setRevModidate(Date revModidate) {
		this.revModidate = revModidate;
	}
	
}
