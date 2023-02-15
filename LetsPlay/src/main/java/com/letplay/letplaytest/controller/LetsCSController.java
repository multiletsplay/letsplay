package com.letplay.letplaytest.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.letplay.letplaytest.biz.InqReplyBiz;
import com.letplay.letplaytest.biz.InquiryBiz;
import com.letplay.letplaytest.biz.MemberBiz;
import com.letplay.letplaytest.biz.NoticeBiz;
import com.letplay.letplaytest.dto.Criteria;
import com.letplay.letplaytest.dto.InqReplyDto;
import com.letplay.letplaytest.dto.InquiryDto;
import com.letplay.letplaytest.dto.MemberDto;
import com.letplay.letplaytest.dto.NoticeDto;
import com.letplay.letplaytest.dto.PageDto;

@Controller
public class LetsCSController {
	
	@Autowired
	private NoticeBiz noticeBiz;
	@Autowired
	private MemberBiz memBiz;
	@Autowired
	private InquiryBiz inquiryBiz;
	@Autowired
	private InqReplyBiz inqreplyBiz;
	
	@RequestMapping("/faqcontent")
	public String FaqContent() {
		return "faqcontent";
		
	};
	
	//공지사항
	@GetMapping("/notice/list")
	public String selectNoticelist(NoticeDto dto, Model model, Criteria criteria, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("login");
		model.addAttribute("member", memBiz.selectmember(member.getId()));
		int noticeListCnt = noticeBiz.getTotal();
		PageDto paging = new PageDto();
		paging.setCri(criteria);
		paging.setTotal(noticeListCnt);
		model.addAttribute("noticelist", noticeBiz.selectNoticeList(criteria));
		model.addAttribute("paging", paging);
		return "noticelist";
	}

	@GetMapping("/notice/detail")
	public String selectNoticeOne(Model model, int noticeSeq) {
		model.addAttribute("dto", noticeBiz.selectNoticeOne(noticeSeq));
		
		return "noticedetail";
	}
	
	@GetMapping("/notice/insertform")
	public String insertNoticeForm(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("login");
		model.addAttribute("member", memBiz.selectmember(member.getId()));
		return "noticeinsert";
	}
	
	@PostMapping("/notice/insert")
	public String insertNotice(NoticeDto dto, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("login");
		model.addAttribute("member", memBiz.selectmember(member.getId()));
		if(noticeBiz.insertNotice(dto)>0) {
			return "redirect:/notice/list";
		}else {
			return "redirect:/notice/insertform";
		}
	}
	
	@GetMapping("/notice/updateform")
	public String updateForm(Model model, int noticeSeq) {
		model.addAttribute("dto", noticeBiz.selectNoticeOne(noticeSeq));
		return "noticeupdate";
	}
	
	@PostMapping("/notice/update")
	public String updateNotice(NoticeDto dto) {
		if(noticeBiz.updateNotice(dto) > 0) {
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
//			model.addAttribute("paging", new PageDto(10, inquiryBiz.getTotal(), criteria));
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
}
