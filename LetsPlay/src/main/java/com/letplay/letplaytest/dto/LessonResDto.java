package com.letplay.letplaytest.dto;

import java.time.LocalTime;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class LessonResDto {
	private String resId;
	private String id;
	private int lesSeq;
	private String lesName;
	private String lesImgpath;
	private String lesLocation;
	private String lesTeacher;
	private String lesContact;
	private String resDate;
	private String resStarttime;
	private String resEndtime;
	private String resPrice;
	@DateTimeFormat(pattern="yyyy-MM-dd'T'HH:mm")
	private Date resDatetime;
	
	public LessonResDto() {
		super();
	}

	public LessonResDto(String resId, String id, int lesSeq, String lesName, String lesImgpath, String lesLocation,
			String lesTeacher, String lesContact, String resDate, String resStarttime, String resEndtime,
			String resPrice, Date resDatetime) {
		super();
		this.resId = resId;
		this.id = id;
		this.lesSeq = lesSeq;
		this.lesName = lesName;
		this.lesImgpath = lesImgpath;
		this.lesLocation = lesLocation;
		this.lesTeacher = lesTeacher;
		this.lesContact = lesContact;
		this.resDate = resDate;
		this.resStarttime = resStarttime;
		this.resEndtime = resEndtime;
		this.resPrice = resPrice;
		this.resDatetime = resDatetime;
	}

	public String getResId() {
		return resId;
	}
	public void setResId(String resId) {
		this.resId = resId;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getLesImgpath() {
		return lesImgpath;
	}
	public void setLesImgpath(String lesImgpath) {
		this.lesImgpath = lesImgpath;
	}
	public String getLesLocation() {
		return lesLocation;
	}
	public void setLesLocation(String lesLocation) {
		this.lesLocation = lesLocation;
	}
	public String getLesTeacher() {
		return lesTeacher;
	}
	public void setLesTeacher(String lesTeacher) {
		this.lesTeacher = lesTeacher;
	}
	public String getLesContact() {
		return lesContact;
	}
	public void setLesContact(String lesContact) {
		this.lesContact = lesContact;
	}
	public String getResPrice() {
		return resPrice;
	}
	public void setResPrice(String resPrice) {
		this.resPrice = resPrice;
	}
	public String getResDate() {
		return resDate;
	}
	public void setResDate(String resDate) {
		this.resDate = resDate;
	}
	public String getResStarttime() {
		return resStarttime;
	}
	public void setResStarttime(String resStarttime) {
		this.resStarttime = resStarttime;
	}
	public String getResEndtime() {
		return resEndtime;
	}
	public void setResEndtime(String resEndtime) {
		this.resEndtime = resEndtime;
	}
	public Date getResDatetime() {
		return resDatetime;
	}
	public void setResDatetime(Date resDatetime) {
		this.resDatetime = resDatetime;
	}
	
}



