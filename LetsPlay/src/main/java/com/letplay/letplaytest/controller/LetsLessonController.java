package com.letplay.letplaytest.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.letplay.letplaytest.biz.LessonBiz;
import com.letplay.letplaytest.dto.FacDto;
import com.letplay.letplaytest.dto.FacResDto;
import com.letplay.letplaytest.dto.LessonDto;
import com.letplay.letplaytest.dto.LessonResDto;

@Controller
@RequestMapping("/")
public class LetsLessonController {
	
	@Autowired
	private LessonBiz LessonBiz;
	
	@GetMapping("/lesson/list")
	public String lessonList(Model model) {
		model.addAttribute("lessonlist", LessonBiz.selectLessonList());
		return "lessonlist";
	}
	
	@GetMapping("/lesson/detail")
	public String lessonDetail(Model model, int lesSeq) {
		model.addAttribute("dto", LessonBiz.selectLesson(lesSeq));
		return "lessondetail";
	}
	
		
	@GetMapping("/lesson/insertform")
	public String insertLesson() {
		return "lessoninsert";
	}
	
	@PostMapping("/lesson/insert")
	public String insertLesson(Model model, LessonDto dto) {
		if(LessonBiz.insertlesson(dto)>0) {
			model.addAttribute("msg", "등록 완료");
			model.addAttribute("url", "/lesson/list");
			return "alert";
		}else {
			model.addAttribute("msg", "등록 실패");
			model.addAttribute("url", "/lesson/insertform");
			return "alert";
		}
	}
	
	@GetMapping("/lesson/updateform")
	public String updateLesson(Model model, int lesSeq) {
		model.addAttribute("dto", LessonBiz.selectLesson(lesSeq));
		return "lessonupdate";
	}
	
	@PostMapping("/lesson/update")
	public String updateLesson(Model model, LessonDto dto) {
		if(LessonBiz.updatelesson(dto)>0) {
			model.addAttribute("msg", "수정 완료");
			model.addAttribute("url", "/lesson/detail?lesSeq="+dto.getLesSeq());
			return "alert";
		}else {
			model.addAttribute("msg", "수정 실패");
			model.addAttribute("url", "/lesson/detail?lesSeq="+dto.getLesSeq());
			return "alert";
		}
	}
	@PostMapping("/lesson/delete")
	public String deleteLesson(Model model, @RequestParam(value="delList", required=false) List<Integer> ids) {
		if (ids == null) {
			model.addAttribute("msg", "시설을 선택해주세요.");
			model.addAttribute("url", "/lesson/list");
			return "alert";
		}else {
			for(Integer lesSeq : ids) LessonBiz.deleteLesson(lesSeq);
			model.addAttribute("msg", "삭제 성공");
			model.addAttribute("url", "/lesson/list");
			return "alert";
		}
	}
	
	@PostMapping("/lesson/reserve")
	public String reserveLesConfirm(Model model, LessonResDto dto) {
		LocalDateTime now = LocalDateTime.now();
		String localtime = now.format(DateTimeFormatter.ofPattern("yyMMddHHmmss"));
		String resId = "res_"+ localtime;
		dto.setResId(resId);
		model.addAttribute("dto", dto);
		return "reslesconfirm";
	}
	
	@PostMapping("/lesson/payment")
	public String reserveLesPayment(Model model, LessonResDto dto) {
		if(LessonBiz.insertLesRes(dto)>0) {
			model.addAttribute("msg", "예약 성공");
			model.addAttribute("url", "/mypage");
			return "alert";
		}else {
			model.addAttribute("msg", "예약 실패");
			model.addAttribute("url", "/lesson/detail?lesSeq="+dto.getLesSeq());
			return "alert";
		}
	}
	
	
}

