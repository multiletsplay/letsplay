package com.letplay.letplaytest.biz;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.letplay.letplaytest.dao.LessonMapper;
import com.letplay.letplaytest.dto.LessonDto;
import com.letplay.letplaytest.dto.LessonResDto;

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
	public int deleteLesson(int lesSeq) {
		return lessonMapper.delete(lesSeq);
	}

	@Override
	public int insertLesRes(LessonResDto dto) {
		return lessonMapper.insertLesRes(dto);
	}

	//@Override
	//public LessonResDto selectLesRes(int lesSeq, String id, Date resDate, String resStarttime) {
	//	return lessonMapper.selectLesRes(lesSeq, id, resDate, resStarttime);
	//}

	@Override
	public int insertlesson(LessonDto dto) {
		return lessonMapper.insertLesson(dto);
	}

	@Override
	public int updatelesson(LessonDto dto) {
		return lessonMapper.updateLesson(dto);
	}

}
