package com.letplay.letplaytest.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class TimeDto {
	private int facSeq;
	@DateTimeFormat(pattern="yyyy-MM-dd'T'HH:mm")
	private Date dt;
	private int resStatus;
	private String date;
	private String time;
	
	public TimeDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TimeDto(int facSeq, Date dt, int resStatus, String date, String time) {
		super();
		this.facSeq = facSeq;
		this.dt = dt;
		this.resStatus = resStatus;
		this.date = date;
		this.time = time;
	}

	public int getFacSeq() {
		return facSeq;
	}

	public void setFacSeq(int facSeq) {
		this.facSeq = facSeq;
	}

	public Date getDt() {
		return dt;
	}
	public void setDt(Date dt) {
		this.dt = dt;
	}
	public int getResStatus() {
		return resStatus;
	}
	public void setResStatus(int resStatus) {
		this.resStatus = resStatus;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	
}
