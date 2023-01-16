package com.letplay.letplaytest.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.letplay.letplaytest.dto.LikesDto;

@Mapper
public interface LikesMapper {
	@Select(" SELECT COUNT(LIKES_ID) FROM LIKES WHERE FAC_SEQ=#{facSeq} AND ID=#{id} ")
	int select(int facSeq, String id);
	
	@Insert(" INSERT INTO LIKES VALUES(NULL, #{id}, NULL, NULL, #{facSeq}, 1 ) ")
	int insert(LikesDto dto);
	
	@Delete(" DELETE FROM LIKES WHERE FAC_SEQ=#{facSeq} AND ID=#{id} ")
	int delete(int facSeq, String id);
	
	@Update(" UPDATE FACILITY SET LIKECOUNT = "
			+ " (SELECT COUNT(*) FROM LIKES WHERE FAC_SEQ=#{facSeq}) "
			+ " WHERE FAC_SEQ=#{facSeq} ")
	int update(int facSeq);
}
