package com.letplay.letplaytest.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class FacResDto {
	private String resId;
	private String id;
	private int facSeq;
	private String facName;
	private String facImgpath;
	private String facLocation;
	private String facContact;
	private String resDate;
	private String resStarttime;
	private String resEndtime;
	private String resPrice;
	@DateTimeFormat(pattern="yyyy-MM-dd'T'HH:mm")
	private Date resDatetime;
	private int revStatus;
	
	public FacResDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FacResDto(String resId, String id, int facSeq, String facName, String facImgpath, String facLocation,
			String facContact, String resDate, String resStarttime, String resEndtime, String resPrice,
			Date resDatetime, int revStatus) {
		super();
		this.resId = resId;
		this.id = id;
		this.facSeq = facSeq;
		this.facName = facName;
		this.facImgpath = facImgpath;
		this.facLocation = facLocation;
		this.facContact = facContact;
		this.resDate = resDate;
		this.resStarttime = resStarttime;
		this.resEndtime = resEndtime;
		this.resPrice = resPrice;
		this.resDatetime = resDatetime;
		this.revStatus = revStatus;
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

	public int getFacSeq() {
		return facSeq;
	}

	public void setFacSeq(int facSeq) {
		this.facSeq = facSeq;
	}

	public String getFacName() {
		return facName;
	}

	public void setFacName(String facName) {
		this.facName = facName;
	}

	public String getFacImgpath() {
		return facImgpath;
	}

	public void setFacImgpath(String facImgpath) {
		this.facImgpath = facImgpath;
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

	public String getResPrice() {
		return resPrice;
	}

	public void setResPrice(String resPrice) {
		this.resPrice = resPrice;
	}

	public Date getResDatetime() {
		return resDatetime;
	}

	public void setResDatetime(Date resDatetime) {
		this.resDatetime = resDatetime;
	}

	public int getRevStatus() {
		return revStatus;
	}

	public void setRevStatus(int revStatus) {
		this.revStatus = revStatus;
	}

	

	
	
}
