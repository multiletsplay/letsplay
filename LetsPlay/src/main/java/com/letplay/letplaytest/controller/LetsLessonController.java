package com.letplay.letplaytest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.letplay.letplaytest.biz.LessonBiz;

@Controller
@RequestMapping("/")
public class LetsLessonController {
	
	@Autowired
	private LessonBiz LessonBiz;
	
	@GetMapping("/lesson/list")
	public String lessonList(Model model) {
		model.addAttribute("leslist", LessonBiz.selectLessonList());
		return "lessonlist";
	}
	
	@GetMapping("/lesson/detail")
	public String lessonDetail(Model model, int lesSeq) {
		model.addAttribute("dto", LessonBiz.selectLesson(lesSeq));
		return "lessondetail";
	}
	
	@GetMapping("/lesson/delete")
	public String lessonDelete(int lesSeq) {
		if(LessonBiz.delete(lesSeq)>0) {
			return "redirect:/lesson/list";
		}else {
			return "redirect:/lesson/detail?lesSeq="+lesSeq;
		}
	}
		
	
	
	
}

