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
	int selectfac(int facSeq, String id);
	
	@Insert(" INSERT INTO LIKES VALUES(NULL, #{id}, NULL, NULL, #{facSeq}, 1 ) ")
	int insertfac(LikesDto dto);
	
	@Delete(" DELETE FROM LIKES WHERE FAC_SEQ=#{facSeq} AND ID=#{id} ")
	int deletefac(int facSeq, String id);
	
	
	@Select(" SELECT COUNT(LIKES_ID) FROM LIKES WHERE LES_SEQ=#{lesSeq} AND ID=#{id} ")
	int selectles(int lesSeq, String id);
	
	@Insert(" INSERT INTO LIKES VALUES(NULL, #{id}, NULL, #{lesSeq}, NULL, 1 ) ")
	int insertles(LikesDto dto);
	
	@Delete(" DELETE FROM LIKES WHERE LES_SEQ=#{lesSeq} AND ID=#{id} ")
	int deleteles(int lesSeq, String id);
	
	
	@Select(" SELECT COUNT(LIKES_ID) FROM LIKES WHERE MATCH_SEQ=#{matchSeq} AND ID=#{id} ")
	int selectMatch(int matchSeq, String id);
	
	@Insert(" INSERT INTO LIKES VALUES(NULL, #{id}, #{matchSeq}, NULL, NULL, 1 ) ")
	int insertMatch(LikesDto dto);
	
	@Delete(" DELETE FROM LIKES WHERE MATCH_SEQ=#{matchSeq} AND ID=#{id} ")
	int deleteMatch(int matchSeq, String id);

	
}
