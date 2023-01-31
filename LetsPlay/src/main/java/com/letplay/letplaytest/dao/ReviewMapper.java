package com.letplay.letplaytest.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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

	@Insert(" INSERT INTO REVIEW VALUES(NULL, #{id}, #{lesSeq}, #{facSeq}, #{revRate}, #{revContent}, NOW(), NULL ) ")
	int reviewInsert(ReviewDto dto);

	@Update(" UPDATE REVIEW SET REV_RATE=#{revRate}, REV_CONTENT=#{revContent}, REV_MODIDATE=NOW() WHERE REV_ID=#{revId} ")
	int reviewUpdate(ReviewDto dto);
	
	@Delete(" DELETE FROM REVIEW WHERE REV_ID = #{revId} ")
	int reviewDelete(ReviewDto dto);
	
}
