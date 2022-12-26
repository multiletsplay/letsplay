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
@RequestMapping("/facility")
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
	@GetMapping("/inquiry/list")
	public String selectInquirylist(Model model) {
		List<InquiryDto> inqlist = inquiryBiz.selectList();
		model.addAttribute("inquirylist", inqlist);
		return "inquirylist";
	}

	@GetMapping("/inquiry/detail")
	public String selectInquiryOne(Model model, int inqSeq) {
		model.addAttribute("dto", inquiryBiz.selectOne(inqSeq));
		return "inquirydetail";
	}
	
	@GetMapping("/inquiry/insertform")
	public String insertInquiryForm() {
		return "inquiryinsert";
	}
	
	@PostMapping("/inquiry/insert")
	public String insertInquiry(InquiryDto dto) {
		if(inquiryBiz.insert(dto)>0) {
			return "redirect:/inquiry/list";
		}else {
			return "redirect:/inquiry/insertform";
		}
	}
	
	@GetMapping("/inquiry/updateform")
	public String updateInquiry(Model model, int inqSeq) {
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
