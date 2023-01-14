package com.letplay.letplaytest.biz;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.letplay.letplaytest.dto.LessonDto;
import com.letplay.letplaytest.dto.LessonResDto;

public interface LessonBiz {
	public List<LessonDto> selectLessonList();
	public List<LessonDto> selectSports(int spoId);		//선택 스포츠시설 불러오기
	public LessonDto selectLesson(int lesSeq);
	public int deleteLesson(int lesSeq);
	public int insertLesson(LessonDto dto, MultipartFile file) throws Exception ;	
	public int updatelesson(LessonDto dto);
	
	public int insertRes(LessonResDto dto);
	
}
