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

	@Override
	public int reviewInsert(ReviewDto dto) {
		return reviewMapper.reviewInsert(dto);
	}

	@Override
	public int reviewUpdate(ReviewDto dto) {
		return reviewMapper.reviewUpdate(dto);
	}

	@Override
	public int reviewDelete(int revId) {
		return reviewMapper.reviewDelete(revId);
	}

	@Override
	public ReviewDto selectFac(Integer facSeq, String id) {
		return reviewMapper.selectFac(facSeq, id);
	}

	@Override
	public ReviewDto selectLesson(Integer lesSeq, String id) {
		return reviewMapper.selectLesson(lesSeq, id);
	}


}
