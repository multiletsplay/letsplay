package com.letplay.letplaytest.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.letplay.letplaytest.dto.MemberDto;

@Mapper
public interface MemberMapper {
	
	@Select(" SELECT * FROM `MEMBER` WHERE ID=#{id} AND PASSWORD=#{password} ")
	MemberDto login(MemberDto dto);
	
	@Select(" SELECT * FROM `MEMBER` WHERE ID=#{id}")
	MemberDto selectmember(String id);
	
	@Insert(" INSERT INTO `MEMBER` VALUES( #{id}, #{birth}, #{password}, #{name}, #{gender}, #{nickname}, #{email}, #{phone}, DEFAULT) ")
	int insert(MemberDto dto);
	
	@Select(" SELECT ID FROM `MEMBER` WHERE NAME=#{name} AND PHONE=#{phone} ")
	String findid(String name, String phone);
	
	@Select(" SELECT COUNT(ID) FROM `MEMBER` WHERE ID=#{id} ")
	int idcheck(String id);
	
	@Select(" SELECT COUNT(PHONE) FROM `MEMBER` WHERE PHONE=#{tel} ")
	int CountTel(String tel);
	
}
