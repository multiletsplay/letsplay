package com.letplay.letplaytest.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.letplay.letplaytest.dto.InquiryDto;

@Mapper
public interface InquiryMapper {
	@Select(" SELECT *  FROM `ONE-ON-ONE INQUIRY` ORDER BY INQ_SEQ DESC ")
	List<InquiryDto> selectList();

	@Select(" SELECT * FROM `ONE-ON-ONE INQUIRY` WHERE INQ_SEQ=#{inqSeq} ")
	InquiryDto selectOne(int inqSeq);
	
	@Insert(" INSERT INTO `ONE-ON-ONE INQUIRY` VALUES(NULL, #{id}, #{inqTitle}, #{inqContent}, now(), DEFAULT ) ")
	int insert(InquiryDto dto);
	
	@Update(" UPDATE `ONE-ON-ONE INQUIRY` SET INQ_TITLE=#{inqTitle}, INQ_CONTENT=#{inqContent} WHERE INQ_SEQ=#{inqSeq} ")
	int update(InquiryDto dto);
	
	@Delete(" DELETE FROM `ONE-ON-ONE INQUIRY` WHERE INQ_SEQ=#{inqSeq} ")
	int delete(int inqSeq);
}
