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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.letplay.letplaytest.biz.LessonBiz;
import com.letplay.letplaytest.biz.LikesBiz;
import com.letplay.letplaytest.biz.MemberBiz;
import com.letplay.letplaytest.biz.ReviewBiz;
import com.letplay.letplaytest.dto.LessonDto;
import com.letplay.letplaytest.dto.LessonResDto;
import com.letplay.letplaytest.dto.LikesDto;
import com.letplay.letplaytest.dto.MemberDto;
import com.letplay.letplaytest.dto.ReviewDto;

@Controller
@RequestMapping("/")
public class LetsLessonController {
	
	@Autowired
	private LessonBiz LessonBiz;
	@Autowired
	private ReviewBiz reviewBiz;
	@Autowired
	private MemberBiz memBiz;
	@Autowired
	private LikesBiz likesBiz;
	
	@GetMapping("/lesson/list")
	public String lessonList(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("login");
		model.addAttribute("member", memBiz.selectmember(member.getId()));
		model.addAttribute("lessonlist", LessonBiz.selectLessonList(member.getId()));
		return "lessonlist";
	}
	
	@GetMapping("/lesson/select")
	public String selectSports(HttpServletRequest request, Model model, int spoId) {
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("login");
		model.addAttribute("member", memBiz.selectmember(member.getId()));
		model.addAttribute("lessonlist", LessonBiz.selectSports(member.getId(), spoId));
		return "lessonlist";
	}
	
	@GetMapping("/lesson/detail")
	public String lessonDetail(HttpServletRequest request, Model model, int lesSeq) {
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("login");
		model.addAttribute("dto", LessonBiz.selectLesson(lesSeq));
		model.addAttribute("schlist", LessonBiz.selectSchedule(lesSeq));
		model.addAttribute("like", likesBiz.selectles(lesSeq, member.getId()));
		model.addAttribute("reviewlist", reviewBiz.selectLesRevlist(lesSeq));
		return "lessondetail";
	}
	
	@GetMapping("/lesson/insertform")
	public String insertLesson() {
		return "lessoninsert";
	}
	
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
	
	//시설 찜하기
	@ResponseBody
	@RequestMapping(value="/lesson/likes", method=RequestMethod.POST)
	public void insertLike(@RequestParam int lesSeq, HttpServletRequest request, Model model) {
		LikesDto dto = new LikesDto();
		dto.setLesSeq(lesSeq);
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("login");
		dto.setId(member.getId());
		if(likesBiz.insertles(dto)>0) {
			System.out.println("찜 성공");		
		}else {
			System.out.println("찜 실패");
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/lesson/dellikes", method=RequestMethod.GET)
	public void deleteLike(@RequestParam int lesSeq, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("login");
		if(likesBiz.deleteles(lesSeq, member.getId())>0) {
			System.out.println("취소 성공");	
		}else {
			System.out.println("취소 실패");	
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

