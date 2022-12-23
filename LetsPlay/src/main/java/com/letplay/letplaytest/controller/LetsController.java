package com.letplay.letplaytest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.letplay.letplaytest.biz.FacBiz;
import com.letplay.letplaytest.biz.MatchBiz;
import com.letplay.letplaytest.dto.MatchDto;

@Controller
@RequestMapping("/")
public class LetsController {
	@Autowired
	private FacBiz facBiz;
	
	
	// 시설controller 각 url는 임시
	@GetMapping("/facility/list")
	public String main(Model model) {
		model.addAttribute("faclist", facBiz.selectFacList());
		return "facilitylist";
	}
	
	@GetMapping("/facility/detail")
	public String main(Model model, int facSeq) {
		model.addAttribute("dto", facBiz.selectFac(facSeq));
		return "facilitydetail";
	}
	
	@GetMapping("/notice/delete")
	public String delete(int facSeq) {
		if(facBiz.delete(facSeq)>0) {
			return "redirect:/facility/list";
		}else {
			return "redirect:/facility/detail?facSeq="+facSeq;
		}
	}
	
	@Autowired
	private MatchBiz matchBiz;
	
	@GetMapping("/match/list")
	public String selectList(Model model) {
		model.addAttribute("list",matchBiz.selectList());
		
		return "matchlist";
	}
	
	@PostMapping("/match/insert")
	public String insert(MatchDto dto) {
		if(matchBiz.insert(dto) > 0 ) {
			return "redirect:/match/list";
		}else {
			return "redirect:/match/insertform";
		}
	}
	
	@GetMapping("/match/insertform")
	public String insertForm() {
		return "matchinsert";
	}
	
	@GetMapping("/match/detail")
	public String selectOne(Model model, int matchSeq) {
		model.addAttribute("dto",matchBiz.selectOne(matchSeq));
		
		return "matchdetail";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

