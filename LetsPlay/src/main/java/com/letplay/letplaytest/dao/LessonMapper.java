package com.letplay.letplaytest.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.letplay.letplaytest.dto.LessonDto;
import com.letplay.letplaytest.dto.LessonResDto;
import com.letplay.letplaytest.dto.LessonSchDto;

@Mapper
public interface LessonMapper {
	
	@Select(" SELECT l.*, s.SPO_NAME, ANY_VALUE(ls.LIKES_STATUS) LIKES_STATUS, COUNT(REV_ID) CNT_REVIEW "
			+ " FROM LESSON l "
			+ "		LEFT OUTER JOIN SPORTS s ON l.SPO_ID=s.SPO_ID "
			+ " 	LEFT OUTER JOIN LIKES ls ON l.LES_SEQ=ls.LES_SEQ AND ls.ID=#{id} "
			+ "		LEFT OUTER JOIN REVIEW r ON l.LES_SEQ=r.LES_SEQ "
			+ " GROUP BY l.LES_SEQ "
			+ " ORDER BY l.LES_DATE DESC ")
	List<LessonDto> selectLessonList(String id);
	
	@Select(" SELECT l.*, s.SPO_NAME, ANY_VALUE(ls.LIKES_STATUS) LIKES_STATUS, COUNT(REV_ID) CNT_REVIEW "
			+ " FROM LESSON l "
			+ "		LEFT OUTER JOIN SPORTS s ON l.SPO_ID=s.SPO_ID "
			+ " 	LEFT OUTER JOIN LIKES ls ON l.LES_SEQ=ls.LES_SEQ AND ls.ID=#{id} "
			+ "		LEFT OUTER JOIN REVIEW r ON l.LES_SEQ=r.LES_SEQ "
			+ " WHERE l.SPO_ID=#{spoId} "
			+ " GROUP BY l.LES_SEQ "
			+ " ORDER BY l.LES_DATE DESC ")
	List<LessonDto> selectSports(String id, int spoId);
	
	@Select(" SELECT l.*, s.SPO_NAME "
			+ " FROM LESSON l, SPORTS s "
			+ " WHERE LES_SEQ = #{lesSeq} AND l.SPO_ID = s.SPO_ID ")
	LessonDto selectLesson(int lesSeq);
	
	@Delete(" DELETE FROM LESSON WHERE LES_SEQ = #{lesSeq} ")
	int delete(int lesSeq);
	
	@Insert(" INSERT INTO `LESSON` VALUES(NULL, #{lesName}, #{spoId}, #{lesTeacher}, #{lesLocation}, #{lesContact}, #{lesImg}, #{lesImgpath}, #{lesCost}, NOW(), #{lesType}, #{lesWeekend} ) ")
	int insertLesson(LessonDto dto);
	
	@Update(" UPDATE `LESSON` "
			+ " SET SPO_ID=#{spoId}, LES_NAME=#{lesName}, LES_TEACHER=#{lesTeacher}, LES_LOCATION=#{lesLocation}, LES_CONTACT=#{lesContact}, LES_IMG=#{lesImg}, LES_TYPE=#{lesType}, LES_WEEKEND=#{lesWeekend}, LES_COST=#{lesCost} "
			+ " WHERE LES_SEQ=#{lesSeq} ")
	int updateLesson(LessonDto dto);
	
	@Insert(" INSERT INTO `LESSON_RESERVATION` VALUES(NULL, #{id}, #{lesSeq}, #{resDate}, #{resStarttime}, #{resEndtime}, #{resPrice} )")
	int insertRes(LessonResDto dto);

	//@Select("SELECT NAME, NICKNAME, EMAIL, PHONE, LES_IMG, LES_NAME, LES_LOCATION, LES_CONTACT, LES_COST, RES_DATE, RES_STARTTIME, RES_ENDTIME, SCH_STARTTIME, SCH_ENDTIME "
	//		+ " FROM LESSON_RESERVATION, MEMBER, LESSON, LESSON_SCHEDULE "
	//		+ " WHERE LES_SEQ = #{lesSeq} AND MEMBER = #{ID} AND RES_DATE=#{resDate} AND RES_STARTTIME=#{resStarttime}; ")
	//LessonResDto selectLesRes(int lesSeq, String id, Date resDate, String resStarttime);
	
	@Select(" SELECT s.* "
			+" FROM LESSON l, LESSON_SCHEDULE s "
			+" WHERE l.LES_SEQ=#{lesSeq} AND l.LES_SEQ = s.LES_SEQ ")
	List<LessonSchDto> selectSchedule(int lesSeq);
}
