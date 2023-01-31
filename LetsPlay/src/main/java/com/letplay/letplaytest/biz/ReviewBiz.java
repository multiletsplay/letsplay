package com.letplay.letplaytest.biz;

import java.util.List;

import com.letplay.letplaytest.dto.ReviewDto;

public interface ReviewBiz {
	
	public List<ReviewDto> selectReviewList(int facSeq);
	
	public List<ReviewDto> selectLesRevlist(int lesSeq);

	public int reviewInsert(ReviewDto dto);

	public int reviewUpdate(ReviewDto dto);
	
	public int reviewDelete(int revId);

	public ReviewDto selectFac(Integer facSeq, String id);

	public ReviewDto selectLesson(Integer lesSeq, String id);

	

	
}