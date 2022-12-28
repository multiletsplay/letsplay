package com.letplay.letplaytest.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.letplay.letplaytest.dto.InqReplyDto;

@Mapper
public interface InqReplyMapper {
	@Select(" SELECT * FROM `INQUIRY_REPLY` WHERE INQ_SEQ=#{inqSeq} ")
	InqReplyDto select(int inqSeq);
	
	@Insert(" INSERT INTO `INQUIRY_REPLY` VALUES(NULL, #{inqSeq}, #{id}, #{repContent}, now()) ")
	int insert(InqReplyDto dto);
	
	@Update(" UPDATE `INQUIRY_REPLY` SET REP_CONTENT=#{repContent} WHERE REP_SEQ=#{repSeq} ")
	int update(InqReplyDto dto);
	
	@Delete(" DELETE FROM `INQUIRY_REPLY` WHERE REP_SEQ=#{repSeq} ")
	int delete(int repSeq);
}
