package com.letplay.letplaytest.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.letplay.letplaytest.dao.ReviewMapper;
import com.letplay.letplaytest.dto.ReviewDto;

@Service
public class ReviewImpl implements ReviewBiz{
	@Autowired
	private ReviewMapper reviewMapper;

	@Override
	public List<ReviewDto> selectReviewList(int facSeq) {
		return reviewMapper.selectList(facSeq);
	}

	@Override
	public List<ReviewDto> selectLesRevlist(int lesSeq) {
		return reviewMapper.selectLessonList(lesSeq);
	}

}
