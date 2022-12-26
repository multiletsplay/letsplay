package com.letplay.letplaytest.biz;

import java.util.List;

import com.letplay.letplaytest.dto.NoticeDto;

public interface NoticeBiz {

	public List<NoticeDto> selectNoticeList();
	public NoticeDto selectNoticeOne(int noticeSeq);	//공지디테일
	public int insertNotice(NoticeDto dto);			//공지등록
	public int updateNotice(NoticeDto dto);			//공지수정
	public int deleteNotice(int noticeSeq);			//공지삭제
}
