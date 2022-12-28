package com.letplay.letplaytest.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.letplay.letplaytest.dao.NoticeMapper;
import com.letplay.letplaytest.dto.Criteria;
import com.letplay.letplaytest.dto.NoticeDto;
@Service
public class NoticeBizImpl implements NoticeBiz{

	@Autowired
	private NoticeMapper noticeMapper;
	
	@Override
	public List<NoticeDto> selectNoticeList(Criteria criteria) {
		return noticeMapper.selectNoticeList(criteria);
	}

	@Override
	public NoticeDto selectNoticeOne(int noticeSeq) {
		return noticeMapper.selectNoticeOne(noticeSeq);
	}

	@Override
	public int insertNotice(NoticeDto dto) {
		return noticeMapper.insertNotice(dto);
	}

	@Override
	public int updateNotice(NoticeDto dto) {
		return noticeMapper.updateNotice(dto);
	}

	@Override
	public int deleteNotice(int noticeSeq) {
		return noticeMapper.deleteNotice(noticeSeq);
	}

	@Override
	public int getTotal() {
		return noticeMapper.getTotal();
	}


	
}
