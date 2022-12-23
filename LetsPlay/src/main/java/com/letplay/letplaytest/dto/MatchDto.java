package com.letplay.letplaytest.dto;

import java.util.Date;

/*CREATE TABLE `MATCH_BOARD` (
	`MATCH_SEQ`	int unsigned auto_increment	NOT NULL PRIMARY KEY,
	`ID`	VARCHAR(300)	NOT NULL,
	`SPO_ID`	INT	NOT NULL,
	`MATCH_TITLE`	VARCHAR(100)	NOT NULL,
	`MATCH_CONTENT`	VARCHAR(1000)	NULL,
	`MATCH_REGDATE`	DATETIME	NOT NULL,
	`MATCH_UPDATE`	DATETIME	NULL,
	`MATCH_ENDDATE`	DATETIME	NULL,
	`MATCH_LOCATION`	VARCHAR(100)	NULL,
	`MATCH_TOTAL`	TINYINT	NOT NULL	DEFAULT '0',
	`MATCH_CNT`	INT	NOT NULL	DEFAULT '0',
	`MATCH_LEVEL`	INT	NOT NULL	DEFAULT '0',
	`MATCH_FACILITY`	VARCHAR(2)	NOT NULL	DEFAULT 'Y',
	`MATCH_STATUS`	CHAR(1)	NULL	DEFAULT 'N',
	`CNT_COMMENT`	INT	NOT NULL	DEFAULT '0',
	FOREIGN KEY (ID) REFERENCES MEMBER(ID),
	FOREIGN KEY (SPO_ID) REFERENCES SPORTS(SPO_ID)
); */
public class MatchDto {
	
	private int matchSeq;
	private String id;
	private int spoId;
	private String matchTitle;
	private String matchContent;
	private Date matchRegdate;
	private Date matchUpdate;
	private Date endDate;
	private String matchLocation;
	private int matchTotal;
	private int matchCnt;
	private int matchLevel;
	private String matchFacility;
	private char matchStatus;
	private int cntComment;
	public MatchDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MatchDto(int matchSeq, String id, int spoId, String matchTitle, String matchContent, Date matchRegdate,
			Date matchUpdate, Date endDate, String matchLocation, int matchTotal, int matchCnt, int matchLevel,
			String matchFacility, char matchStatus, int cntComment) {
		super();
		this.matchSeq = matchSeq;
		this.id = id;
		this.spoId = spoId;
		this.matchTitle = matchTitle;
		this.matchContent = matchContent;
		this.matchRegdate = matchRegdate;
		this.matchUpdate = matchUpdate;
		this.endDate = endDate;
		this.matchLocation = matchLocation;
		this.matchTotal = matchTotal;
		this.matchCnt = matchCnt;
		this.matchLevel = matchLevel;
		this.matchFacility = matchFacility;
		this.matchStatus = matchStatus;
		this.cntComment = cntComment;
	}
	public int getMatchSeq() {
		return matchSeq;
	}
	public void setMatchSeq(int matchSeq) {
		this.matchSeq = matchSeq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getSpoId() {
		return spoId;
	}
	public void setSpoId(int spoId) {
		this.spoId = spoId;
	}
	public String getMatchTitle() {
		return matchTitle;
	}
	public void setMatchTitle(String matchTitle) {
		this.matchTitle = matchTitle;
	}
	public String getMatchContent() {
		return matchContent;
	}
	public void setMatchContent(String matchContent) {
		this.matchContent = matchContent;
	}
	public Date getMatchRegdate() {
		return matchRegdate;
	}
	public void setMatchRegdate(Date matchRegdate) {
		this.matchRegdate = matchRegdate;
	}
	public Date getMatchUpdate() {
		return matchUpdate;
	}
	public void setMatchUpdate(Date matchUpdate) {
		this.matchUpdate = matchUpdate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getMatchLocation() {
		return matchLocation;
	}
	public void setMatchLocation(String matchLocation) {
		this.matchLocation = matchLocation;
	}
	public int getMatchTotal() {
		return matchTotal;
	}
	public void setMatchTotal(int matchTotal) {
		this.matchTotal = matchTotal;
	}
	public int getMatchCnt() {
		return matchCnt;
	}
	public void setMatchCnt(int matchCnt) {
		this.matchCnt = matchCnt;
	}
	public int getMatchLevel() {
		return matchLevel;
	}
	public void setMatchLevel(int matchLevel) {
		this.matchLevel = matchLevel;
	}
	public String getMatchFacility() {
		return matchFacility;
	}
	public void setMatchFacility(String matchFacility) {
		this.matchFacility = matchFacility;
	}
	public char getMatchStatus() {
		return matchStatus;
	}
	public void setMatchStatus(char matchStatus) {
		this.matchStatus = matchStatus;
	}
	public int getCntComment() {
		return cntComment;
	}
	public void setCntComment(int cntComment) {
		this.cntComment = cntComment;
	}
}
