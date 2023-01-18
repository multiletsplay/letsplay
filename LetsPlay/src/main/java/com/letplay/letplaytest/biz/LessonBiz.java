package com.letplay.letplaytest.biz;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.letplay.letplaytest.dto.LessonDto;
import com.letplay.letplaytest.dto.LessonResDto;
import com.letplay.letplaytest.dto.LessonSchDto;

public interface LessonBiz {
	public List<LessonDto> selectLessonList(String id);
	public List<LessonDto> selectSports(String id, int spoId);		//선택 스포츠시설 불러오기
	public LessonDto selectLesson(int lesSeq);
	public int deleteLesson(int lesSeq);
	public int insertLesson(LessonDto dto, MultipartFile file) throws Exception ;	
	public int updatelesson(LessonDto dto);
	public List<LessonSchDto> selectSchedule(int lesSeq);	//레슨 스케줄 불러오기
	
	public int insertRes(LessonResDto dto);
	
}
