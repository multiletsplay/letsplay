package com.letplay.letplaytest.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.letplay.letplaytest.dao.LessonMapper;
import com.letplay.letplaytest.dto.LessonDto;

@Service
public class LessonImpl implements LessonBiz{
	
	@Autowired
	private LessonMapper lessonMapper;
	
	@Override
	public List<LessonDto> selectLessonList() {
		return lessonMapper.selectLessonList();
	}

	@Override
	public LessonDto selectLesson(int lesSeq) {
		return lessonMapper.selectLesson(lesSeq);
	}

	@Override
	public int delete(int lesSeq) {
		return lessonMapper.delete(lesSeq);
	}

}
