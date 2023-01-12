package com.letplay.letplaytest.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.letplay.letplaytest.biz.FacBiz;
import com.letplay.letplaytest.biz.InqReplyBiz;
import com.letplay.letplaytest.biz.InquiryBiz;
import com.letplay.letplaytest.biz.ReviewBiz;
import com.letplay.letplaytest.dto.Criteria;
import com.letplay.letplaytest.dto.FacDto;
import com.letplay.letplaytest.dto.FacResDto;
import com.letplay.letplaytest.dto.InqReplyDto;
import com.letplay.letplaytest.dto.InquiryDto;
import com.letplay.letplaytest.dto.PageDto;
import com.letplay.letplaytest.dto.SearchDto;

@Controller
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
	
	// 시설
	@GetMapping("/facility/list")
	public String selectFacList(Model model) {
		model.addAttribute("faclist", facBiz.selectFacList());
		return "facilitylist";
	}
	
	@GetMapping("/facility/select")
	public String selectSports(Model model, int spoId) {
		model.addAttribute("faclist", facBiz.selectSports(spoId));
		return "facilitylist";
	}
	
	@GetMapping("/facility/detail")
	public String selectFacDetail(Model model, int facSeq) {
		model.addAttribute("dto", facBiz.selectFac(facSeq));
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
	
	//@RequestMapping(value="/facility/delete", method=RequestMethod.POST)
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
//	@GetMapping("/facility/search")
//	public String searchfac(Model model, @RequestParam("searchRegion1") String region1, @RequestParam("searchRegion2") String region2,
//			@RequestParam("optParking") boolean parking ) {
//		model.addAttribute("faclist", facBiz.searchFac(region1, region2, parking));
//		return "facilitylist";
//	}
	
	@GetMapping("/facility/search")
	public String searchfac(Model model, SearchDto dto) {
		model.addAttribute("faclist", facBiz.searchFac(dto));
		return "facilitylist";
	}
	
	//시설예약
	@PostMapping("/facility/reserve")
	public String reserveConfirm(Model model, FacResDto dto) {
		//예약번호 부여
		LocalDateTime now = LocalDateTime.now();
		String localtime = now.format(DateTimeFormatter.ofPattern("yyMMddHHmmss"));
		String resId = "res_"+ localtime;
		dto.setResId(resId);
		model.addAttribute("dto", dto);
		return "resconfirm";
	}
	
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
	public String selectInquirylist(Model model, Criteria criteria) {
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
	public String selectInquiryOne(Model model, int inqSeq) {
		model.addAttribute("dto", inquiryBiz.selectOne(inqSeq));
		model.addAttribute("reply", inqreplyBiz.select(inqSeq));
		return "inquirydetail";
	}
	
	@GetMapping("/inquiry/insertform")
	public String insertFormInq() {
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
