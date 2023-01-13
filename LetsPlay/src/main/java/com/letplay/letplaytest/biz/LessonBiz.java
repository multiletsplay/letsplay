package com.letplay.letplaytest.biz;

import java.util.Date;
import java.util.List;

import com.letplay.letplaytest.dto.LessonDto;
import com.letplay.letplaytest.dto.LessonResDto;

public interface LessonBiz {
	public List<LessonDto> selectLessonList();
	public LessonDto selectLesson(int lesSeq);
	public int deleteLesson(int lesSeq);
	public int insertlesson(LessonDto dto);
	public int updatelesson(LessonDto dto);
	
	public int insertLesRes(LessonResDto dto);
	//public LessonResDto selectLesRes(int lesSeq, String id, Date resDate, String resStarttime);
	
}
