package com.letplay.letplaytest.dto;

public class LessonSchDto {
	private int schId;
	private int lesSeq;
	private String schStarttime;
	private String schEndtime;
	private int schPeople;
	
	public LessonSchDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public LessonSchDto(int schId, int lesSeq, String schStarttime, String schEndtime, int schPeople) {
		super();
		this.schId = schId;
		this.lesSeq = lesSeq;
		this.schStarttime = schStarttime;
		this.schEndtime = schEndtime;
		this.schPeople = schPeople;
	}
	
	public int getSchId() {
		return schId;
	}
	public void setSchId(int schId) {
		this.schId = schId;
	}
	public int getLesSeq() {
		return lesSeq;
	}
	public void setLesSeq(int lesSeq) {
		this.lesSeq = lesSeq;
	}
	public String getSchStarttime() {
		return schStarttime;
	}
	public void setSchStarttime(String schStarttime) {
		this.schStarttime = schStarttime;
	}
	public String getSchEndtime() {
		return schEndtime;
	}
	public void setSchEndtime(String schEndtime) {
		this.schEndtime = schEndtime;
	}
	public int getSchPeople() {
		return schPeople;
	}
	public void setSchPeople(int schPeople) {
		this.schPeople = schPeople;
	}
	
	
}
