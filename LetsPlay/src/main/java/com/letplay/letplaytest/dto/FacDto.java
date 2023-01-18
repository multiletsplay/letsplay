package com.letplay.letplaytest.dto;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class FacDto {
	private int facSeq;
	private String facName;
	private int spoId;
	private String spoName;
	private String facLocation;
	private String facContact;
	private int facCost;
	private String facImg;			//이미지파일명
	private String facImgpath;		//이미지파일주소
	private Date facDate;
	private Boolean facParking;
	private Boolean facLent;
	private Boolean facShower;
	private Boolean facLocker;
	private Boolean facLight;
	private Boolean facCostcheck;
	private int likesStatus;
	private int cntReview;
	private double avgRate;
	
	public FacDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FacDto(int facSeq, String facName, int spoId, String spoName, String facLocation, String facContact,
			int facCost, String facImg, String facImgpath, Date facDate, Boolean facParking, Boolean facLent,
			Boolean facShower, Boolean facLocker, Boolean facLight, Boolean facCostcheck, int likesStatus,
			int cntReview, double avgRate) {
		super();
		this.facSeq = facSeq;
		this.facName = facName;
		this.spoId = spoId;
		this.spoName = spoName;
		this.facLocation = facLocation;
		this.facContact = facContact;
		this.facCost = facCost;
		this.facImg = facImg;
		this.facImgpath = facImgpath;
		this.facDate = facDate;
		this.facParking = facParking;
		this.facLent = facLent;
		this.facShower = facShower;
		this.facLocker = facLocker;
		this.facLight = facLight;
		this.facCostcheck = facCostcheck;
		this.likesStatus = likesStatus;
		this.cntReview = cntReview;
		this.avgRate = avgRate;
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
	public int getFacCost() {
		return facCost;
	}
	public void setFacCost(int facCost) {
		this.facCost = facCost;
	}
	public Boolean getFacCostcheck() {
		return facCostcheck;
	}
	public void setFacCostcheck(Boolean facCostcheck) {
		this.facCostcheck = facCostcheck;
	}
	public String getFacImg() {
		return facImg;
	}
	public void setFacImg(String facImg) {
		this.facImg = facImg;
	}

	public String getFacImgpath() {
		return facImgpath;
	}

	public void setFacImgpath(String facImgpath) {
		this.facImgpath = facImgpath;
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

	public double getAvgRate() {
		return avgRate;
	}

	public void setAvgRate(double avgRate) {
		this.avgRate = avgRate;
	}

}