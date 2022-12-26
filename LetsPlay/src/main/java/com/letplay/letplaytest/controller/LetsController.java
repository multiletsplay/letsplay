package com.letplay.letplaytest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.letplay.letplaytest.biz.FacBiz;
import com.letplay.letplaytest.biz.InquiryBiz;
import com.letplay.letplaytest.biz.MatchBiz;
import com.letplay.letplaytest.dto.InquiryDto;
import com.letplay.letplaytest.dto.MatchDto;

@Controller
@RequestMapping("/")
public class LetsController {
	@Autowired
	private FacBiz facBiz;
	@Autowired
	private MatchBiz matchBiz;
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
	
	
	// 매치controller
	
	@GetMapping("/match/list")
	public String selectMatchList(Model model) {
		model.addAttribute("list",matchBiz.selectList());
		
		return "matchlist";
	}
	
	@PostMapping("/match/insert")
	public String insertMatch(MatchDto dto) {
		if(matchBiz.insert(dto) > 0 ) {
			return "redirect:/match/list";
		}else {
			return "redirect:/match/insertform";
		}
	}
	
	@GetMapping("/match/insertform")
	public String insertFormMatch() {
		return "matchinsert";
	}
	
	@GetMapping("/match/detail")
	public String selectOneMatch(Model model, int matchSeq) {
		model.addAttribute("dto", matchBiz.selectOne(matchSeq));
		
		return "matchdetail";
	}
	
	@GetMapping("/match/updateform")
	public String updateFormMatch(Model model, int matchSeq) {
		model.addAttribute("dto", matchBiz.selectOne(matchSeq));
		return "matchupdate";
	}
	
	@PostMapping("/match/update")
	public String updateMatch(MatchDto dto) {
		if(matchBiz.update(dto)>0) {
			return "redirect:/match/deatil?matchSeq="+dto.getMatchSeq();
		}else {
			return "redirect:/match/updateform?matchSeq="+dto.getMatchSeq();
		}
	}
	
	@GetMapping("/match/delete")
	public String deleteMatch(int matchSeq) {
		if(matchBiz.delete(matchSeq)>0) {
			return "redirect:/match/list";
		}else {
			return "redirect:/match/list";
		}
	}
	
	
	
	
	
	//1대1문의
	@GetMapping("/inquiry/list")
	public String selectInquirylist(Model model) {
		model.addAttribute("inquirylist", inquiryBiz.selectList());
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

