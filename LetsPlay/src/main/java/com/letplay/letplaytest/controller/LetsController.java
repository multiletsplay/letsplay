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
import com.letplay.letplaytest.biz.MatchBiz;
import com.letplay.letplaytest.dto.InquiryDto;
import com.letplay.letplaytest.dto.MatchDto;

@Controller
@RequestMapping("/")
public class LetsController {
	@Autowired
	private MatchBiz matchBiz;
	
	
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
	
	
	
	
	
	
	
	
	
	
	
}

