package com.letplay.letplaytest.biz;

import java.util.List;

import com.letplay.letplaytest.dto.LessonDto;

public interface LessonBiz {
	public List<LessonDto> selectLessonList();
	public LessonDto selectLesson(int lesSeq);
	public int delete(int lesSeq);
}
