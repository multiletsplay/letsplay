package com.letplay.letplaytest.biz;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
	public int updatelesson(LessonDto dto) {
		return lessonMapper.updateLesson(dto);
	}

	@Override
	public int insertLesson(LessonDto dto, MultipartFile file) throws Exception {
		String projpath = System.getProperty("user.dir")+"/src/main/webapp/image";
		UUID uuid = UUID.randomUUID();
		String filename = uuid+"_"+file.getOriginalFilename();
		File saveFile = new File(projpath,filename);
		file.transferTo(saveFile);
		dto.setLesImg(filename);
		dto.setLesImgpath("/image/"+filename);
		System.out.println(dto.getLesImg());
		System.out.println(dto.getLesImgpath());
		return lessonMapper.insertLesson(dto);
	}

	@Override
	public int insertRes(LessonResDto dto) {
		return lessonMapper.insertRes(dto);
	}

	@Override
	public List<LessonDto> selectSports(int spoId) {
		return lessonMapper.selectSports(spoId);
	}

	//@Override
	//public LessonResDto selectLesRes(int lesSeq, String id, Date resDate, String resStarttime) {
	//	return lessonMapper.selectLesRes(lesSeq, id, resDate, resStarttime);
	//}
}
