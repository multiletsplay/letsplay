package com.letplay.letplaytest.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.letplay.letplaytest.dto.ReviewDto;

@Mapper
public interface ReviewMapper {
	@Select(" SELECT REV_ID, NICKNAME, FAC_SEQ, REV_RATE, REV_CONTENT "
			+ "FROM REVIEW, MEMBER "
			+ "WHERE FAC_SEQ=#{facSeq} AND REVIEW.ID = MEMBER.ID "
			+ "ORDER BY REV_ID DESC ")
	List<ReviewDto> selectList(int facSeq);
	
	@Select(" SELECT REV_ID, NICKNAME, FAC_SEQ, REV_RATE, REV_CONTENT "
			+ "FROM REVIEW, MEMBER "
			+ "WHERE LES_SEQ=#{lesSeq} AND REVIEW.ID = MEMBER.ID "
			+ "ORDER BY REV_ID DESC ")
	List<ReviewDto> selectLessonList(int lesSeq);

}
