package com.letplay.letplaytest.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.letplay.letplaytest.dto.Criteria;
import com.letplay.letplaytest.dto.InquiryDto;

@Mapper
public interface InquiryMapper {
	@Select(" SELECT INQ_SEQ, REPLY_CHECK, INQ_TITLE, ID, INQ_DATE\n"
			+ "FROM (\n"
			+ "	SELECT @ROWNUM := @ROWNUM + 1 AS rnum, INQ_SEQ, REPLY_CHECK, INQ_TITLE, ID, INQ_DATE\n"
			+ "	FROM `ONE-ON-ONE INQUIRY` I, (SELECT @ROWNUM := 0 ) A\n"
			+ "	ORDER BY INQ_SEQ DESC\n"
			+ ") TMP\n"
			+ "WHERE rnum > (#{pageNum } - 1) * #{amount} \n"
			+ "LIMIT #{amount } ")
	List<InquiryDto> selectList(Criteria criteria);

	@Select(" SELECT * FROM `ONE-ON-ONE INQUIRY` WHERE INQ_SEQ=#{inqSeq} ")
	InquiryDto selectOne(int inqSeq);
	
	@Insert(" INSERT INTO `ONE-ON-ONE INQUIRY` VALUES(NULL, #{id}, #{inqTitle}, #{inqContent}, now(), DEFAULT ) ")
	int insert(InquiryDto dto);
	
	@Update(" UPDATE `ONE-ON-ONE INQUIRY` SET INQ_TITLE=#{inqTitle}, INQ_CONTENT=#{inqContent} WHERE INQ_SEQ=#{inqSeq} ")
	int update(InquiryDto dto);
	
	@Delete(" DELETE FROM `ONE-ON-ONE INQUIRY` WHERE INQ_SEQ=#{inqSeq} ")
	int delete(int inqSeq);
	
	@Select(" SELECT count(*) FROM `ONE-ON-ONE INQUIRY` ")
	int getTotal();
}
