package com.letplay.letplaytest.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class FacResDto {
	int resId;
	String id;
	int facSeq;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	Date resDate;
	String resStarttime;
	String resEndtime;
	String resPrice;
	
	public FacResDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public FacResDto(int resId, String id, int facSeq, Date resDate, String resStarttime, String resEndtime,
			String resPrice) {
		super();
		this.resId = resId;
		this.id = id;
		this.facSeq = facSeq;
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
	
	
}
