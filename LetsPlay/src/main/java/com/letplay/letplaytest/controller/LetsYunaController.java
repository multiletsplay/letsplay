package com.letplay.letplaytest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.letplay.letplaytest.biz.FacBiz;
import com.letplay.letplaytest.biz.InquiryBiz;
import com.letplay.letplaytest.dto.InquiryDto;

@Controller
@RequestMapping("/")
public class LetsYunaController {
	@Autowired
	private FacBiz facBiz;
	@Autowired
	private InquiryBiz inquiryBiz;
	
	// 시설controller 각 url는 임시
	@GetMapping("/facility/list")
	public String selectFacList(Model model) {
		model.addAttribute("faclist", facBiz.selectFacList());
		return "facilitylist";
	}
	
	@GetMapping("/facility/detail")
	public String selectFacDetail(Model model, int facSeq) {
		model.addAttribute("dto", facBiz.selectFac(facSeq));
		return "facilitydetail";
	}
	
	@GetMapping("/facility/delete")
	public String deletFac(int facSeq) {
		if(facBiz.delete(facSeq)>0) {
			return "redirect:/facility/list";
		}else {
			return "redirect:/facility/detail?facSeq="+facSeq;
		}
	}
	
	//1대1문의
	@GetMapping("/inquiry/list")				/*page:default 페이지, size:한페이지게시글수, sort:정렬기준컬럼, direction:정렬순서*/
	public String selectInquirylist(Model model) {
		model.addAttribute("inquirylist", inquiryBiz.selectList());
		//Page<InquiryDto> inquirylist = inquiryBiz.selectList(pageable);
		//int nowPage = inquirylist.getPageable().getPageNumber()+1;			//현재페이지, pageable이 갖고 있는 페이지는 0부터 시작
		//int startPage = Math.max(nowPage -4, 1);							//블럭에서 보여줄 시작 페이지
		//int endPage = Math.min(nowPage + 5, inquirylist.getTotalPages());	//블럭에서 보여줄 마지막 페이지
		
		return "inquirylist";
	}

	@GetMapping("/inquiry/detail")
	public String selectInquiryOne(Model model, int inqSeq) {
		model.addAttribute("dto", inquiryBiz.selectOne(inqSeq));
		return "inquirydetail";
	}
	
	@GetMapping("/inquiry/insertform")
	public String insertFormInq() {
		return "inquiryinsert";
	}
	
	@PostMapping("/inquiry/insert")
	public String insertInq(InquiryDto dto) {
		if(inquiryBiz.insert(dto)>0) {
			return "redirect:/inquiry/list";
		}else {
			return "redirect:/inquiry/insertform";
		}
	}
	
	@GetMapping("/inquiry/updateform")
	public String updateFormInq(Model model, int inqSeq) {
		model.addAttribute("dto", inquiryBiz.selectOne(inqSeq));
		return "inquiryupdate";
	}
	
	@PostMapping("/inquiry/update")
	public String updateInq(InquiryDto dto) {
		if(inquiryBiz.update(dto)>0) {
			return "redirect:/inquiry/detail?inqSeq="+dto.getInqSeq();
		}else {
			return "redirect:/inquiry/updateform?inqSeq="+dto.getInqSeq();
		}
	}
	
	@GetMapping("/inquiry/delete")
	public String deleteInq(int inqSeq) {
		if(inquiryBiz.delete(inqSeq)>0) {
			return "redirect:/inquiry/list";
		}else {
			return "redirect:/inquiry/detail?inqSeq="+inqSeq;
		}
	}
}
