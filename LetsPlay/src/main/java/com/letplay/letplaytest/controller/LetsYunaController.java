package com.letplay.letplaytest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.letplay.letplaytest.biz.FacBiz;
import com.letplay.letplaytest.biz.InqReplyBiz;
import com.letplay.letplaytest.biz.InquiryBiz;
import com.letplay.letplaytest.biz.ReviewBiz;
import com.letplay.letplaytest.dto.Criteria;
import com.letplay.letplaytest.dto.InqReplyDto;
import com.letplay.letplaytest.dto.InquiryDto;
import com.letplay.letplaytest.dto.PageDto;

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
	
	@GetMapping("/facility/detail")
	public String selectFacDetail(Model model, int facSeq) {
		model.addAttribute("dto", facBiz.selectFac(facSeq));
		model.addAttribute("reviewlist", reivewBiz.selectReviewList(facSeq));
		return "facilitydetail";
	}
	
	//@RequestMapping(value="/facility/delete", method=RequestMethod.POST)
	@PostMapping("/facility/delete")
	public String deletFac(@RequestParam("delList") List<Integer> ids) {
		for(Integer facSeq : ids) facBiz.delete(facSeq);
		return "redirect:/facility/list";
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
}
