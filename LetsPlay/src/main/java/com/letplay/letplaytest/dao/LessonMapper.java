package com.letplay.letplaytest.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.letplay.letplaytest.dto.LessonDto;

@Mapper
public interface LessonMapper {
	
	@Select(" SELECT LES_SEQ, LES_NAME, SPO_NAME, LES_LOCATION, LES_IMG, LES_DATE\n"
			+ " FROM LESSON, SPORTS\n"
			+ " WHERE LESSON.SPO_ID = SPORTS.SPO_ID ")
	List<LessonDto> selectLessonList();
	
	@Select(" SELECT LES_SEQ, LES_NAME, SPO_NAME, LES_TEACHER, LES_LOCATION, LES_CONTACT, LES_IMG, LES_DATE, LES_TYPE, LES_WEEKEND, LES_COST \n"
			+ " FROM LESSON, SPORTS\n"
			+ " WHERE LES_SEQ = #{lesSeq} AND LESSON.SPO_ID = SPORTS.SPO_ID ")
	LessonDto selectLesson(int lesSeq);
	
	@Delete(" DELETE FROM LESSON WHERE LES_SEQ = #{lesSeq} ")
	int delete(int lesSeq);

}
