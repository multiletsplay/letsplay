package com.letplay.letplaytest.dto;

import java.util.Date;

public class FacDto {
	private int facSeq;
	private String facName;
	private int spoId;
	private String spoName;
	private String facLocation;
	private String facContact;
	private String facImg;
	private Date facDate;
	private Boolean facParking;
	private Boolean facLent;
	private Boolean facShower;
	private Boolean facLocker;
	private Boolean facLight;
	private Boolean facCost;
	
	public FacDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FacDto(int facSeq, String facName, int spoId, String spoName, String facLocation, String facContact,
			String facImg, Date facDate, Boolean facParking, Boolean facLent, Boolean facShower, Boolean facLocker,
			Boolean facLight, Boolean facCost) {
		super();
		this.facSeq = facSeq;
		this.facName = facName;
		this.spoId = spoId;
		this.spoName = spoName;
		this.facLocation = facLocation;
		this.facContact = facContact;
		this.facImg = facImg;
		this.facDate = facDate;
		this.facParking = facParking;
		this.facLent = facLent;
		this.facShower = facShower;
		this.facLocker = facLocker;
		this.facLight = facLight;
		this.facCost = facCost;
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
	public String getFacImg() {
		return facImg;
	}
	public void setFacImg(String facImg) {
		this.facImg = facImg;
	}
	public Date getFacDate() {
		return facDate;
	}
	public void setFacDate(Date facDate) {
		this.facDate = facDate;
	}
	public Boolean getFacParking() {
		return facParking;
	}
	public void setFacParking(Boolean facParking) {
		this.facParking = facParking;
	}
	public Boolean getFacLent() {
		return facLent;
	}
	public void setFacLent(Boolean facLent) {
		this.facLent = facLent;
	}
	public Boolean getFacShower() {
		return facShower;
	}
	public void setFacShower(Boolean facShower) {
		this.facShower = facShower;
	}
	public Boolean getFacLocker() {
		return facLocker;
	}
	public void setFacLocker(Boolean facLocker) {
		this.facLocker = facLocker;
	}
	public Boolean getFacLight() {
		return facLight;
	}
	public void setFacLight(Boolean facLight) {
		this.facLight = facLight;
	}
	public Boolean getFacCost() {
		return facCost;
	}
	public void setFacCost(Boolean facCost) {
		this.facCost = facCost;
	}

}