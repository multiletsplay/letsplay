package com.letplay.letplaytest.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.letplay.letplaytest.dto.MemberDto;

@Mapper
public interface MemberMapper {
	
	@Select(" SELECT * FROM `MEMBER` WHERE ID=#{id} AND PASSWORD=#{password} ")
	MemberDto login(MemberDto dto);
	
	@Select(" SELECT * FROM `MEMBER` WHERE ID=#{id}")
	MemberDto selectmember(String id);
}
