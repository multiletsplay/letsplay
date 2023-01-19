package com.letplay.letplaytest.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.letplay.letplaytest.dto.FacResDto;
import com.letplay.letplaytest.dto.LessonResDto;
import com.letplay.letplaytest.dto.MemberDto;

@Mapper
public interface MemberMapper {
	
	@Select(" SELECT * FROM `MEMBER` WHERE ID=#{id} AND PASSWORD=#{password} ")
	MemberDto login(MemberDto dto);
	
	@Select(" SELECT * FROM `MEMBER` WHERE ID=#{id}")
	MemberDto selectmember(String id);
	
	@Insert(" INSERT INTO `MEMBER` VALUES( #{id}, #{birth}, #{password}, #{name}, #{gender}, #{nickname}, #{email}, #{phone}, DEFAULT) ")
	int insert(MemberDto dto);
	
	@Update(" UPDATE `MEMBER` SET NAME=#{name}, NICKNAME=#{nickname}, EMAIL=#{email}, PHONE=#{phone} WHERE ID=#{id} ")
	int update(MemberDto dto);
	
	@Delete(" DELETE FROM `MEMBER` WHERE ID=#{id} ")
	int delete(String id);
	
	@Select(" SELECT ID FROM `MEMBER` WHERE NAME=#{name} AND PHONE=#{phone} ")
	String findid(String name, String phone);
	
	@Select(" SELECT COUNT(ID) FROM `MEMBER` WHERE ID=#{id} ")
	int idcheck(String id);
	
	@Select(" SELECT COUNT(PHONE) FROM `MEMBER` WHERE PHONE=#{tel} ")
	int CountTel(String tel);

	@Select(" SELECT COUNT(NICKNAME) FROM `MEMBER` WHERE NICKNAME=#{nickname} ")
	int nicknamecheck(String nickname);
	
	
	@Select(" SELECT fr.*, f.FAC_NAME , f.FAC_LOCATION "
			+ " FROM FACILITY_RESERVATION fr "
			+ " LEFT OUTER JOIN FACILITY f ON fr.FAC_SEQ = f.FAC_SEQ "
			+ " WHERE ID=#{id} "
			+ " ORDER BY RES_DATE DESC ")
	List<FacResDto> selectResfac(String id);
	
	@Select(" SELECT lr.*, l.LES_NAME , l.LES_LOCATION "
			+ " FROM LESSON_RESERVATION lr "
			+ " LEFT OUTER JOIN LESSON l ON lr.LES_SEQ = l.LES_SEQ "
			+ " WHERE ID=#{id} "
			+ " ORDER BY RES_DATE DESC ")
	List<LessonResDto> selectResles(String id);
}
