package com.letplay.letplaytest.dto;

import java.util.Date;

public class ReviewDto {
	private int revId;
	private String id;
	private String nickname;
	private Integer lesSeq;
	private Integer facSeq;
	private int revRate;
	private String revContent;
	private Date revWritedate;
	private Date revModidate;
	private int con;
	private String facName;
	private String facLocation;
	private String lesName;
	private String lesLocation;
	
	public ReviewDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReviewDto(int revId, String id, String nickname, Integer lesSeq, Integer facSeq, int revRate,
			String revContent, Date revWritedate, Date revModidate, int con, String facName, String facLocation,
			String lesName, String lesLocation) {
		super();
		this.revId = revId;
		this.id = id;
		this.nickname = nickname;
		this.lesSeq = lesSeq;
		this.facSeq = facSeq;
		this.revRate = revRate;
		this.revContent = revContent;
		this.revWritedate = revWritedate;
		this.revModidate = revModidate;
		this.con = con;
		this.facName = facName;
		this.facLocation = facLocation;
		this.lesName = lesName;
		this.lesLocation = lesLocation;
	}

	public int getRevId() {
		return revId;
	}

	public void setRevId(int revId) {
		this.revId = revId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Integer getLesSeq() {
		return lesSeq;
	}

	public void setLesSeq(Integer lesSeq) {
		this.lesSeq = lesSeq;
	}

	public Integer getFacSeq() {
		return facSeq;
	}

	public void setFacSeq(Integer facSeq) {
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

	public int getCon() {
		return con;
	}

	public void setCon(int con) {
		this.con = con;
	}

	public String getFacName() {
		return facName;
	}

	public void setFacName(String facName) {
		this.facName = facName;
	}

	public String getFacLocation() {
		return facLocation;
	}

	public void setFacLocation(String facLocation) {
		this.facLocation = facLocation;
	}

	public String getLesName() {
		return lesName;
	}

	public void setLesName(String lesName) {
		this.lesName = lesName;
	}

	public String getLesLocation() {
		return lesLocation;
	}

	public void setLesLocation(String lesLocation) {
		this.lesLocation = lesLocation;
	}

	
	
	
}