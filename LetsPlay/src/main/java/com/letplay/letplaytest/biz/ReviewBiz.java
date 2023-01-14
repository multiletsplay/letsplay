package com.letplay.letplaytest.biz;

import java.util.List;

import com.letplay.letplaytest.dto.ReviewDto;

public interface ReviewBiz {
	
	public List<ReviewDto> selectReviewList(int facSeq);
	
	public List<ReviewDto> selectLesRevlist(int lesSeq);
}
