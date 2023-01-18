package com.letplay.letplaytest.dto;

import java.util.Date;

public class LessonDto {
	private int lesSeq;
	private String lesName;
	private int spoId;
	private String spoName;
	private String lesTeacher;
	private String lesLocation;
	private String lesContact;
	private String lesImg;
	private String lesImgpath;
	private Date lesDate;
	private String lesType;
	private String lesWeekend;
	private int lesCost;
	private int likesStatus;
	private int cntReview;
	
	public LessonDto() {
		super();
	}

	public LessonDto(int lesSeq, String lesName, int spoId, String spoName, String lesTeacher, String lesLocation,
			String lesContact, String lesImg, String lesImgpath, Date lesDate, String lesType, String lesWeekend,
			int lesCost, int likesStatus, int cntReview) {
		super();
		this.lesSeq = lesSeq;
		this.lesName = lesName;
		this.spoId = spoId;
		this.spoName = spoName;
		this.lesTeacher = lesTeacher;
		this.lesLocation = lesLocation;
		this.lesContact = lesContact;
		this.lesImg = lesImg;
		this.lesImgpath = lesImgpath;
		this.lesDate = lesDate;
		this.lesType = lesType;
		this.lesWeekend = lesWeekend;
		this.lesCost = lesCost;
		this.likesStatus = likesStatus;
		this.cntReview = cntReview;
	}

	public int getLesSeq() {
		return lesSeq;
	}

	public void setLesSeq(int lesSeq) {
		this.lesSeq = lesSeq;
	}

	public String getLesName() {
		return lesName;
	}

	public void setLesName(String lesName) {
		this.lesName = lesName;
	}

	public int getSpoId() {
		return spoId;
	}

	public void setSpoId(int spoId) {
		this.spoId = spoId;
	}

	public String getSpoName() {
		return spoName;
	}

	public void setSpoName(String spoName) {
		this.spoName = spoName;
	}

	public String getLesTeacher() {
		return lesTeacher;
	}

	public void setLesTeacher(String lesTeacher) {
		this.lesTeacher = lesTeacher;
	}

	public String getLesLocation() {
		return lesLocation;
	}

	public void setLesLocation(String lesLocation) {
		this.lesLocation = lesLocation;
	}

	public String getLesContact() {
		return lesContact;
	}

	public void setLesContact(String lesContact) {
		this.lesContact = lesContact;
	}

	public String getLesImg() {
		return lesImg;
	}

	public void setLesImg(String lesImg) {
		this.lesImg = lesImg;
	}

	public Date getLesDate() {
		return lesDate;
	}

	public void setLesDate(Date lesDate) {
		this.lesDate = lesDate;
	}

	public String getLesType() {
		return lesType;
	}

	public void setLesType(String lesType) {
		this.lesType = lesType;
	}

	public String getLesWeekend() {
		return lesWeekend;
	}

	public void setLesWeekend(String lesWeekend) {
		this.lesWeekend = lesWeekend;
	}

	public int getLesCost() {
		return lesCost;
	}

	public void setLesCost(int lesCost) {
		this.lesCost = lesCost;
	}

	public String getLesImgpath() {
		return lesImgpath;
	}

	public void setLesImgpath(String lesImgpath) {
		this.lesImgpath = lesImgpath;
	}

	public int getLikesStatus() {
		return likesStatus;
	}

	public void setLikesStatus(int likesStatus) {
		this.likesStatus = likesStatus;
	}

	public int getCntReview() {
		return cntReview;
	}

	public void setCntReview(int cntReview) {
		this.cntReview = cntReview;
	}
	
}
