package com.letplay.letplaytest.dto;

import java.util.Date;

public class NoticeDto {

	private int noticeSeq;
	private String id;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDate;
	private Date noticeModidate;
	public NoticeDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NoticeDto(int noticeSeq, String id, String noticeTitle, String noticeContent, Date noticeDate,
			Date noticeModidate) {
		super();
		this.noticeSeq = noticeSeq;
		this.id = id;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.noticeModidate = noticeModidate;
	}
	public int getNoticeSeq() {
		return noticeSeq;
	}
	public void setNoticeSeq(int noticeSeq) {
		this.noticeSeq = noticeSeq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public Date getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}
	public Date getNoticeModidate() {
		return noticeModidate;
	}
	public void setNoticeModidate(Date noticeModidate) {
		this.noticeModidate = noticeModidate;
	}
}
