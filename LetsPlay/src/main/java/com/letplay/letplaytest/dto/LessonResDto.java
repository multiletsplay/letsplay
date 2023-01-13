package com.letplay.letplaytest.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class LessonResDto {
	String resId;
	String id;
	String name;
	String nickname;
	String email;
	String phone;
	int lesSeq;
	String lesName;
	String lesImg;
	String lesLocation;
	String lesTeacher;
	String lesContact;
	String lesCost;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	Date resDate;
	String resStarttime;
	String resEndtime;
	
	
	public LessonResDto() {
		super();
	}


	public LessonResDto(String resId, String id, String name, String nickname, String email, String phone, int lesSeq,
			String lesName, String lesImg, String lesLocation, String lesTeacher, String lesContact, String lesCost,
			Date resDate, String resStarttime, String resEndtime) {
		super();
		this.resId = resId;
		this.id = id;
		this.name = name;
		this.nickname = nickname;
		this.email = email;
		this.phone = phone;
		this.lesSeq = lesSeq;
		this.lesName = lesName;
		this.lesImg = lesImg;
		this.lesLocation = lesLocation;
		this.lesTeacher = lesTeacher;
		this.lesContact = lesContact;
		this.lesCost = lesCost;
		this.resDate = resDate;
		this.resStarttime = resStarttime;
		this.resEndtime = resEndtime;
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


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
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


	public String getLesImg() {
		return lesImg;
	}


	public void setLesImg(String lesImg) {
		this.lesImg = lesImg;
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


	public String getLesCost() {
		return lesCost;
	}


	public void setLesCost(String lesCost) {
		this.lesCost = lesCost;
	}


	public Date getResDate() {
		return resDate;
	}


	public void setResDate(Date resDate) {
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
	


	
	
	
}



