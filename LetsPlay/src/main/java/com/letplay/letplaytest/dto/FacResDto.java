package com.letplay.letplaytest.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class FacResDto {
	int resId;
	String id;
	String name;
	String nickname;
	String email;
	String phone;
	int facSeq;
	String facName;
	String facImg;
	String facLocation;
	String facContact;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	Date resDate;
	String resStarttime;
	String resEndtime;
	String resPrice;
	
	public FacResDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FacResDto(int resId, String id, String name, String nickname, String email, String phone, int facSeq,
			String facName, String facImg, String facLocation, String facContact, Date resDate, String resStarttime,
			String resEndtime, String resPrice) {
		super();
		this.resId = resId;
		this.id = id;
		this.name = name;
		this.nickname = nickname;
		this.email = email;
		this.phone = phone;
		this.facSeq = facSeq;
		this.facName = facName;
		this.facImg = facImg;
		this.facLocation = facLocation;
		this.facContact = facContact;
		this.resDate = resDate;
		this.resStarttime = resStarttime;
		this.resEndtime = resEndtime;
		this.resPrice = resPrice;
	}

	public int getResId() {
		return resId;
	}
	public void setResId(int resId) {
		this.resId = resId;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getFacSeq() {
		return facSeq;
	}
	public void setFacSeq(int facSeq) {
		this.facSeq = facSeq;
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
	public String getResPrice() {
		return resPrice;
	}
	public void setResPrice(String resPrice) {
		this.resPrice = resPrice;
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
	public String getFacName() {
		return facName;
	}
	public void setFacName(String facName) {
		this.facName = facName;
	}
	public String getFacImg() {
		return facImg;
	}
	public void setFacImg(String facImg) {
		this.facImg = facImg;
	}
	public String getFacLocation() {
		return facLocation;
	}
	public void setFacLocation(String facLocation) {
		this.facLocation = facLocation;
	}
	public String getFacContact() {
		return facContact;
	}
	public void setFacContact(String facContact) {
		this.facContact = facContact;
	}
	
	
}
