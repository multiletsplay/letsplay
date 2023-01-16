package com.letplay.letplaytest.dto;

public class LikesDto {
	private int likesId;
	private String id;
	private int matchSeq;
	private int lesSeq;
	private int facSeq;
	private int likesStatus;
	
	public LikesDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public LikesDto(int likesId, String id, int matchSeq, int lesSeq, int facSeq, int likesStatus) {
		super();
		this.likesId = likesId;
		this.id = id;
		this.matchSeq = matchSeq;
		this.lesSeq = lesSeq;
		this.facSeq = facSeq;
		this.likesStatus = likesStatus;
	}
	
	public int getLikesId() {
		return likesId;
	}
	public void setLikesId(int likesId) {
		this.likesId = likesId;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getMatchSeq() {
		return matchSeq;
	}
	public void setMatchSeq(int matchSeq) {
		this.matchSeq = matchSeq;
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
	public int getLikesStatus() {
		return likesStatus;
	}
	public void setLikesStatus(int likesStatus) {
		this.likesStatus = likesStatus;
	}
	
}
