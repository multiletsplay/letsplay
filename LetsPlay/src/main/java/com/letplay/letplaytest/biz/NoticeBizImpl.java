package com.letplay.letplaytest.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.letplay.letplaytest.dao.NoticeMapper;
import com.letplay.letplaytest.dto.NoticeDto;

public class NoticeBizImpl implements NoticeBiz{

	@Autowired
	private NoticeMapper noticeMapper;
	
	@Override
	public List<NoticeDto> selectList() {
		return noticeMapper.selectList();
	}

	
}
