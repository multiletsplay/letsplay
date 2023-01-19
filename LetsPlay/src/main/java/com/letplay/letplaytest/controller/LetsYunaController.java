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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.letplay.letplaytest.biz.FacBiz;
import com.letplay.letplaytest.biz.InqReplyBiz;
import com.letplay.letplaytest.biz.InquiryBiz;
import com.letplay.letplaytest.biz.LikesBiz;
import com.letplay.letplaytest.biz.MemberBiz;
import com.letplay.letplaytest.biz.ReviewBiz;
import com.letplay.letplaytest.dto.Criteria;
import com.letplay.letplaytest.dto.FacDto;
import com.letplay.letplaytest.dto.FacResDto;
import com.letplay.letplaytest.dto.InqReplyDto;
import com.letplay.letplaytest.dto.InquiryDto;
import com.letplay.letplaytest.dto.LikesDto;
import com.letplay.letplaytest.dto.MemberDto;
import com.letplay.letplaytest.dto.PageDto;
import com.letplay.letplaytest.dto.SearchDto;

@Controller
@SessionAttributes("member")
@RequestMapping("/")
public class LetsYunaController {
	@Autowired
	private FacBiz facBiz;
	@Autowired
	private InquiryBiz inquiryBiz;
	@Autowired
	private InqReplyBiz inqreplyBiz;
	@Autowired
	private ReviewBiz reivewBiz;
	@Autowired
	private MemberBiz memBiz;
	@Autowired
	private LikesBiz likesBiz;
	
	// 시설
	@GetMapping("/facility/list")
	public String selectFacList(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("login");
		model.addAttribute("member", memBiz.selectmember(member.getId()));
		model.addAttribute("faclist", facBiz.selectFacList(member.getId()));
		return "facilitylist";
	}
	
	@GetMapping("/facility/select")
	public String selectSports(HttpServletRequest request, Model model, int spoId) {
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("login");
		model.addAttribute("member", memBiz.selectmember(member.getId()));
		model.addAttribute("faclist", facBiz.selectSports(spoId, member.getId()));
		return "facilitylist";
	}
	
	@GetMapping("/facility/detail")
	public String selectFacDetail(HttpServletRequest request, Model model, int facSeq) {
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("login");
		model.addAttribute("member", memBiz.selectmember(member.getId()));
		model.addAttribute("dto", facBiz.selectFac(facSeq));
		model.addAttribute("like", likesBiz.selectfac(facSeq, member.getId()));
		model.addAttribute("reviewlist", reivewBiz.selectReviewList(facSeq));
		return "facilitydetail";
	}
	
//	@RequestMapping(value="/facility/pathfind", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
//	@ResponseBody
//	public RedirectView findPath(@RequestParam("facName") String facName, @RequestParam("coordsy") String coordsy, @RequestParam("coordsx") String coordsx) {
//		RedirectView redirectView = new RedirectView();
//		redirectView.setUrl("https://map.kakao.com/link/to/"+facName+","+coordsy+","+coordsx);
//		return redirectView;
//	}
	
	@PostMapping("/facility/delete")
	public String deletFac(Model model, @RequestParam(value="delList", required=false) List<Integer> ids) {
		if (ids == null) {
			model.addAttribute("msg", "시설을 선택해주세요.");
			model.addAttribute("url", "/facility/list");
			return "alert";
		}else {
			for(Integer facSeq : ids) facBiz.deleteFac(facSeq);
			model.addAttribute("msg", "삭제 성공");
			model.addAttribute("url", "/facility/list");
			return "alert";
		}
	}
	
	@GetMapping("/facility/insertform")
	public String insertFac() {
		return "facilityinsert";
	}
	
	@PostMapping("/facility/insert")
	public String insertFac(Model model, FacDto dto, MultipartFile file) throws Exception {
		if(facBiz.insertFac(dto, file)>0) {
			model.addAttribute("msg", "등록 완료");
			model.addAttribute("url", "/facility/list");
			return "alert";
		}else {
			model.addAttribute("msg", "등록 실패");
			model.addAttribute("url", "/facility/insertform");
			return "alert";
		}
	}
	
	@GetMapping("/facility/updateform")
	public String updateFac(Model model, int facSeq) {
		model.addAttribute("dto", facBiz.selectFac(facSeq));
		return "facilityupdate";
	}
	
	@PostMapping("/facility/update")
	public String updatefac(Model model, FacDto dto) {
		if(facBiz.updateFac(dto)>0) {
			model.addAttribute("msg", "수정 완료");
			model.addAttribute("url", "/facility/detail?facSeq="+dto.getFacSeq());
			return "alert";
		}else {
			model.addAttribute("msg", "수정 실패");
			model.addAttribute("url", "/facility/detail?facSeq="+dto.getFacSeq());
			return "alert";
		}
	}
	
	//시설 검색	
	@GetMapping("/facility/search")
	public String searchfac(HttpServletRequest request, Model model, SearchDto dto) {
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("login");
		model.addAttribute("member", memBiz.selectmember(member.getId()));
		model.addAttribute("faclist", facBiz.searchFac(dto));
		return "facilitylist";
	}
	
	//시설 찜하기
	@ResponseBody
	@RequestMapping(value="/facility/likes", method=RequestMethod.POST)
	public void insertLike(@RequestParam int facSeq, HttpServletRequest request) {
		LikesDto dto = new LikesDto();
		dto.setFacSeq(facSeq);
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("login");
		dto.setId(member.getId());
		if(likesBiz.insertfac(dto)>0) {
			System.out.println("찜 성공");		
		}else {
			System.out.println("찜 실패");
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/facility/dellikes", method=RequestMethod.GET)
	public void deleteLike(@RequestParam int facSeq, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("login");
		if(likesBiz.deletefac(facSeq, member.getId())>0) {
			System.out.println("취소 성공");	
		}else {
			System.out.println("취소 실패");	
		}
	}
	
	//시설예약
	@PostMapping("/facility/reserve")
	public String reserveConfirm(HttpServletRequest request, Model model, FacResDto dto) {
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
		return "resconfirm";
	}
	
	//시설 결제후 예약내역 db저장
	@PostMapping("/facility/payment")
	public String reservePayment(Model model, FacResDto dto) {
		if(facBiz.insertRes(dto)>0) {
			model.addAttribute("msg", "예약 성공");
			model.addAttribute("url", "/mypage");
			return "alert";
		}else {
			model.addAttribute("msg", "예약 실패");
			model.addAttribute("url", "/facility/detail?facSeq="+dto.getFacSeq());
			return "alert";
		}
	}
	
	//1대1문의
	@GetMapping("/inquiry/list")
	public String selectInquirylist(HttpServletRequest request, Model model, Criteria criteria) {
		//로그인정보
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("login");
		model.addAttribute("member", memBiz.selectmember(member.getId()));
		
		//페이징
		int inqListCnt = inquiryBiz.getTotal();
		PageDto paging = new PageDto();
		paging.setCri(criteria);
		paging.setTotal(inqListCnt);
		model.addAttribute("inquirylist", inquiryBiz.selectList(criteria));
		model.addAttribute("paging", paging);
//		model.addAttribute("paging", new PageDto(10, inquiryBiz.getTotal(), criteria));
		return "inquirylist";
	}

	@GetMapping("/inquiry/detail")
	public String selectInquiryOne(HttpServletRequest request, Model model, int inqSeq) {
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("login");
		model.addAttribute("member", memBiz.selectmember(member.getId()));
		model.addAttribute("dto", inquiryBiz.selectOne(inqSeq));
		model.addAttribute("reply", inqreplyBiz.select(inqSeq));
		return "inquirydetail";
	}
	
	@GetMapping("/inquiry/insertform")
	public String insertFormInq(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("login");
		model.addAttribute("member", memBiz.selectmember(member.getId()));
		return "inquiryinsert";
	}
	
	@PostMapping("/inquiry/insert")
	public String insertInq(Model model, InquiryDto dto) {
		if(inquiryBiz.insert(dto)>0) {
			model.addAttribute("msg", "등록 완료");
			model.addAttribute("url", "/inquiry/list");
			return "alert";
		}else {
			model.addAttribute("msg", "등록 실패");
			model.addAttribute("url", "/inquiry/insertform");
			return "alert";
		}
	}
	
	@GetMapping("/inquiry/updateform")
	public String updateFormInq(Model model, int inqSeq) {
		model.addAttribute("dto", inquiryBiz.selectOne(inqSeq));
		return "inquiryupdate";
	}
	
	@PostMapping("/inquiry/update")
	public String updateInq(Model model, InquiryDto dto) {
		if(inquiryBiz.update(dto)>0) {
			model.addAttribute("msg", "수정 완료");
			model.addAttribute("url", "/inquiry/detail?inqSeq="+dto.getInqSeq());
			return "redirect:/inquiry/detail?inqSeq="+dto.getInqSeq();
		}else {
			model.addAttribute("msg", "수정 실패");
			model.addAttribute("url", "/inquiry/detail?inqSeq="+dto.getInqSeq());
			return "alert";
		}
	}
	
	@GetMapping("/inquiry/delete")
	public String deleteInq(Model model, int inqSeq) {
		if(inquiryBiz.delete(inqSeq)>0) {
			model.addAttribute("msg", "삭제 성공");
			model.addAttribute("url", "/inquiry/list");
			return "alert";
		}else {
			model.addAttribute("msg", "삭제 실패");
			model.addAttribute("url", "/inquiry/detail?inqSeq="+inqSeq);
			return "alert";
		}
	}
	
	//문의 댓글
	@PostMapping("/inquiry/reply/insert")
	public String insertInqRep(InqReplyDto dto, int inqSeq, Model model ) {
		if(inqreplyBiz.insert(dto)>0) {
			model.addAttribute("msg", "등록 완료");
			model.addAttribute("url", "/inquiry/detail?inqSeq="+inqSeq);
			return "alert";
		}else {
			model.addAttribute("msg", "등록 실패");
			model.addAttribute("url", "/inquiry/detail?inqSeq="+inqSeq);
			return "alert";
		}
	}
	
	@PostMapping("/inquiry/reply/update")
	public String updateInqRep(InqReplyDto dto, int inqSeq, Model model) {
		if(inqreplyBiz.update(dto)>0) {
			model.addAttribute("msg", "수정 완료");
			model.addAttribute("url", "/inquiry/detail?inqSeq="+dto.getInqSeq());
			return "alert";
		}else {
			model.addAttribute("msg", "수정 실패");
			model.addAttribute("url", "/inquiry/detail?inqSeq="+dto.getInqSeq());
			return "alert";
		}
	}
	
	@GetMapping("/inquiry/reply/delete")
	public String deleteInqRep(int repSeq, int inqSeq, Model model) {
		if(inqreplyBiz.delete(repSeq)>0) {
			model.addAttribute("msg", "삭제 성공");
			model.addAttribute("url", "/inquiry/detail?inqSeq="+inqSeq);
			return "alert";
		}else {
			model.addAttribute("msg", "삭제 실패");
			model.addAttribute("url", "/inquiry/detail?inqSeq="+inqSeq);
			return "alert";
		}
	}
	
	@GetMapping("/mypage")
	public String mypage() {
		return "mypage";
	}
}
