package com.letplay.letplaytest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.letplay.letplaytest.biz.MatchBiz;
import com.letplay.letplaytest.biz.NoticeBiz;
import com.letplay.letplaytest.dto.MatchDto;
import com.letplay.letplaytest.dto.NoticeDto;

@Controller
@RequestMapping("/")
public class LetsMatchController {
	@Autowired
	private MatchBiz matchBiz;
	@Autowired
	private NoticeBiz noticeBiz;
	
	// 매치controller
	
		@GetMapping("/match/list")
		public String selectMatchList(Model model) {
			model.addAttribute("list",matchBiz.selectMatchList());
			
			return "matchlist";
		}
		
		@PostMapping("/match/insert")
		public String insertMatch(MatchDto dto) {
			if(matchBiz.insertMatch(dto) > 0 ) {
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
			model.addAttribute("dto", matchBiz.selectMatchOne(matchSeq));
			
			return "matchdetail";
		}
		
		@GetMapping("/match/updateform")
		public String updateFormMatch(Model model, int matchSeq) {
			model.addAttribute("dto", matchBiz.selectMatchOne(matchSeq));
			return "matchupdate";
		}
		
		@PostMapping("/match/update")
		public String updateMatch(MatchDto dto) {
			if(matchBiz.updateMatch(dto)>0) {
				return "redirect:/match/deatil?matchSeq="+dto.getMatchSeq();
			}else {
				return "redirect:/match/updateform?matchSeq="+dto.getMatchSeq();
			}
		}
		
		@GetMapping("/match/delete")
		public String deleteMatch(int matchSeq) {
			if(matchBiz.deleteMatch(matchSeq)>0) {
				return "redirect:/match/list";
			}else {
				return "redirect:/match/list";
			}
		}
		
		@GetMapping("/match/cntReply")
		public String cntReply(int matchSeq) {
			matchBiz.cntReply(matchSeq);
			
			return "redirect:/match/list";
		}
		
		@PostMapping("/match/insertReply")
		public String insertReply(String matchContent, String id, int matchSeq) {
			if(matchBiz.insertReply(matchContent, id, matchSeq)>0) {
				return "redirect:/match/detail?matchSeq=" + matchSeq;
			}else {
				return "redirect:/match/detail?matchSeq=" + matchSeq;
			}
		}
		
		@GetMapping("/match/delReply")
		public String delReply(int repSeq, int matchSeq) {
			matchBiz.delReply(repSeq);
			return "redirect:/match/detail?matchSeq=" + matchSeq;
		}
		
		//공지사항
		@GetMapping("/notice/list")
		public String selectNoticelist(Model model) {
			model.addAttribute("noticelist", noticeBiz.selectNoticeList());
			return "noticelist";
		}

		@GetMapping("/notice/detail")
		public String selectNoticeOne(Model model, int noticeSeq) {
			model.addAttribute("dto", noticeBiz.selectNoticeOne(noticeSeq));
			return "noticedetail";
		}
		
		@GetMapping("/notice/insertform")
		public String insertNoticeForm() {
			return "noticeinsert";
		}
		
		@PostMapping("/notice/insert")
		public String insertNotice(NoticeDto dto) {
			if(noticeBiz.insertNotice(dto)>0) {
				return "redirect:/notice/list";
			}else {
				return "redirect:/notice/insertform";
			}
		}
		
		@GetMapping("/notice/updateform")
		public String updateNotice(Model model, int noticeSeq) {
			model.addAttribute("dto", noticeBiz.selectNoticeOne(noticeSeq));
			return "noticeupdate";
		}
		
		@PostMapping("/notice/update")
		public String updateNotice(NoticeDto dto) {
			if(noticeBiz.updateNotice(dto)>0) {
				return "redirect:/notice/detail?noticeSeq="+dto.getNoticeSeq();
			}else {
				return "redirect:/notice/updateform?noticeSeq="+dto.getNoticeSeq();
			}
		}
		
		@GetMapping("/notice/delete")
		public String deleteNotice(int noticeSeq) {
			if(noticeBiz.deleteNotice(noticeSeq)>0) {
				return "redirect:/notice/list";
			}else {
				return "redirect:/notice/detail?noticeSeq="+noticeSeq;
			}
		}
}