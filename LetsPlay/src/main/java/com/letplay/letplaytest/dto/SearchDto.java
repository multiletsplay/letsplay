package com.letplay.letplaytest.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class SearchDto {
	//공통
	private String searchRegion1;		// 시/도
	private String searchRegion2;		// 군/구
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date searchDate;
	private String id;
	
	//시설
	private String searchTime1;
	private String searchTime2;
	private boolean optParking;
	private boolean optLent;
	private boolean optShower;
	private boolean optLocker;
	private boolean optLight;
	private String optCost;
	
	//match
	private int searchLevel;
	private String searchFacStatus;
	private int searchTotal;
	private String searchStartTime;
	
	//레슨
	private String optType;
	private String optWeekend;
	
	public SearchDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SearchDto(String searchRegion1, String searchRegion2, Date searchDate, String id, String searchTime1,
			String searchTime2, boolean optParking, boolean optLent, boolean optShower, boolean optLocker,
			boolean optLight, String optCost, int searchLevel, String searchFacStatus, int searchTotal,
			String searchStartTime, String optType, String optWeekend) {
		super();
		this.searchRegion1 = searchRegion1;
		this.searchRegion2 = searchRegion2;
		this.searchDate = searchDate;
		this.id = id;
		this.searchTime1 = searchTime1;
		this.searchTime2 = searchTime2;
		this.optParking = optParking;
		this.optLent = optLent;
		this.optShower = optShower;
		this.optLocker = optLocker;
		this.optLight = optLight;
		this.optCost = optCost;
		this.searchLevel = searchLevel;
		this.searchFacStatus = searchFacStatus;
		this.searchTotal = searchTotal;
		this.searchStartTime = searchStartTime;
		this.optType = optType;
		this.optWeekend = optWeekend;
	}

	public String getSearchRegion1() {
		return searchRegion1;
	}

	public void setSearchRegion1(String searchRegion1) {
		this.searchRegion1 = searchRegion1;
	}

	public String getSearchRegion2() {
		return searchRegion2;
	}

	public void setSearchRegion2(String searchRegion2) {
		this.searchRegion2 = searchRegion2;
	}

	public Date getSearchDate() {
		return searchDate;
	}

	public void setSearchDate(Date searchDate) {
		this.searchDate = searchDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSearchTime1() {
		return searchTime1;
	}

	public void setSearchTime1(String searchTime1) {
		this.searchTime1 = searchTime1;
	}

	public String getSearchTime2() {
		return searchTime2;
	}

	public void setSearchTime2(String searchTime2) {
		this.searchTime2 = searchTime2;
	}

	public boolean isOptParking() {
		return optParking;
	}

	public void setOptParking(boolean optParking) {
		this.optParking = optParking;
	}

	public boolean isOptLent() {
		return optLent;
	}

	public void setOptLent(boolean optLent) {
		this.optLent = optLent;
	}

	public boolean isOptShower() {
		return optShower;
	}

	public void setOptShower(boolean optShower) {
		this.optShower = optShower;
	}

	public boolean isOptLocker() {
		return optLocker;
	}

	public void setOptLocker(boolean optLocker) {
		this.optLocker = optLocker;
	}

	public boolean isOptLight() {
		return optLight;
	}

	public void setOptLight(boolean optLight) {
		this.optLight = optLight;
	}

	public String getOptCost() {
		return optCost;
	}

	public void setOptCost(String optCost) {
		this.optCost = optCost;
	}

	public int getSearchLevel() {
		return searchLevel;
	}

	public void setSearchLevel(int searchLevel) {
		this.searchLevel = searchLevel;
	}

	public String getSearchFacStatus() {
		return searchFacStatus;
	}

	public void setSearchFacStatus(String searchFacStatus) {
		this.searchFacStatus = searchFacStatus;
	}

	public int getSearchTotal() {
		return searchTotal;
	}

	public void setSearchTotal(int searchTotal) {
		this.searchTotal = searchTotal;
	}

	public String getSearchStartTime() {
		return searchStartTime;
	}

	public void setSearchStartTime(String searchStartTime) {
		this.searchStartTime = searchStartTime;
	}

	public String getOptType() {
		return optType;
	}

	public void setOptType(String optType) {
		this.optType = optType;
	}

	public String getOptWeekend() {
		return optWeekend;
	}

	public void setOptWeekend(String optWeekend) {
		this.optWeekend = optWeekend;
	}

}