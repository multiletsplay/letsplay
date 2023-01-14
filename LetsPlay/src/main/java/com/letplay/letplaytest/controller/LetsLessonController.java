package com.letplay.letplaytest.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.letplay.letplaytest.biz.LessonBiz;
import com.letplay.letplaytest.biz.MemberBiz;
import com.letplay.letplaytest.biz.ReviewBiz;
import com.letplay.letplaytest.dto.LessonDto;
import com.letplay.letplaytest.dto.LessonResDto;
import com.letplay.letplaytest.dto.MemberDto;

@Controller
@RequestMapping("/")
public class LetsLessonController {
	
	@Autowired
	private LessonBiz LessonBiz;
	@Autowired
	private ReviewBiz reviewBiz;
	@Autowired
	private MemberBiz memBiz;
	
	@GetMapping("/lesson/list")
	public String lessonList(Model model) {
		model.addAttribute("lessonlist", LessonBiz.selectLessonList());
		return "lessonlist";
	}
	
	@GetMapping("/lesson/select")
	public String selectSports(Model model, int spoId) {
		model.addAttribute("lessonlist", LessonBiz.selectSports(spoId));
		return "lessonlist";
	}
	
	@GetMapping("/lesson/detail")
	public String lessonDetail(Model model, int lesSeq) {
		model.addAttribute("dto", LessonBiz.selectLesson(lesSeq));
		model.addAttribute("reviewlist", reviewBiz.selectLesRevlist(lesSeq));
		return "lessondetail";
	}
	
	@GetMapping("/lesson/insertform")
	public String insertLesson() {
		return "lessoninsert";
	}
	
//	@PostMapping("/lesson/insert")
//	public String insertLesson(Model model, LessonDto dto, MultipartFile file) throws Exception {
//		System.out.println(dto.getSpoId());
//		System.out.println(dto.getLesName());
//		System.out.println(dto.getLesTeacher());
//		System.out.println(dto.getLesLocation());
//		System.out.println(dto.getLesContact());
//		System.out.println(dto.getLesCost());
//		System.out.println(dto.getLesType());
//		System.out.println(dto.getLesWeekend());
//		if(LessonBiz.insertLesson(dto, file)>0) {
//			model.addAttribute("msg", "등록 완료");
//			model.addAttribute("url", "/lesson/list");
//			return "alert";
//		}else {
//			model.addAttribute("msg", "등록 실패");
//			model.addAttribute("url", "/lesson/insertform");
//			return "alert";
//		}
//	}
	
	@PostMapping("/lesson/insert")
	public String insertLesson(Model model, LessonDto dto, MultipartFile file) throws Exception {
		if(LessonBiz.insertLesson(dto, file)>0) {
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
	
	//레슨 예약
	@PostMapping("/lesson/reserve")
	public String reserveConfirm(HttpServletRequest request, Model model, LessonResDto dto) {
		//로그인정보 가져오기
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("login");
		model.addAttribute("member", memBiz.selectmember(member.getId()));
		
		//예약번호 부여
		LocalDateTime now = LocalDateTime.now();
		String localtime = now.format(DateTimeFormatter.ofPattern("yyMMddHHmmss"));
		String resId = "res_"+ localtime;
		dto.setResId(resId);
		model.addAttribute("dto", dto);
		return "reslesconfirm";
	}
	
	@PostMapping("/lesson/payment")
	public String reservePayment(Model model, LessonResDto dto) {
		if(LessonBiz.insertRes(dto)>0) {
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

