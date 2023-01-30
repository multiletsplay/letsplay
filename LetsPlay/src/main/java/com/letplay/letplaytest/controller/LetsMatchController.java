package com.letplay.letplaytest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.letplay.letplaytest.biz.LikesBiz;
import com.letplay.letplaytest.biz.MatchBiz;
import com.letplay.letplaytest.biz.MemberBiz;
import com.letplay.letplaytest.biz.NoticeBiz;
import com.letplay.letplaytest.dto.Criteria;
import com.letplay.letplaytest.dto.LikesDto;
import com.letplay.letplaytest.dto.MatchDto;
import com.letplay.letplaytest.dto.MemberDto;
import com.letplay.letplaytest.dto.NoticeDto;
import com.letplay.letplaytest.dto.PageDto;
import com.letplay.letplaytest.dto.ReplyDto;
import com.letplay.letplaytest.dto.SearchDto;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/")
public class LetsMatchController {
	@Autowired
	private MatchBiz matchBiz;
	@Autowired
	private NoticeBiz noticeBiz;
	@Autowired
	private MemberBiz memBiz;
	@Autowired
	private LikesBiz likesBiz;
	
	// 매치controller
	
		@GetMapping("/match/list")
		public String selectMatchList(Model model, HttpServletRequest request) {
			HttpSession session = request.getSession();
			MemberDto member = (MemberDto) session.getAttribute("login");
			List<MatchDto> matchlist = matchBiz.selectMatchList(member.getId());
			Map<MatchDto, Integer> dDayMap = new HashMap<MatchDto, Integer>();
			for(MatchDto dto : matchlist) {
				LocalDateTime matchEnddate = dto.getMatchEnddate();
				LocalDateTime matchRegdate = dto.getMatchRegdate();
				Duration duration = Duration.between(matchEnddate, matchRegdate);
				int days = ((int) duration.toDays()-1)*-1;
				dto.setdDay(days);
				dDayMap.put(dto, days);
			}
			model.addAttribute("ddays", dDayMap);
			model.addAttribute("list",matchBiz.selectMatchList(member.getId()));
			model.addAttribute("cnt",matchBiz.matchListCount());
			model.addAttribute("endcnt",matchBiz.matchEndCount());
			return "matchlist";
		}
		
		@GetMapping("/match/category")
		public String selectSports(Model model, int spoId, HttpServletRequest request) {
			HttpSession session = request.getSession();
			MemberDto member = (MemberDto) session.getAttribute("login");
			List<MatchDto> matchEndlist = matchBiz.selectEndList(spoId);
			Map<MatchDto, Integer> dEndDayMap = new HashMap<MatchDto, Integer>();
			for(MatchDto dto : matchEndlist) {
				LocalDateTime matchEnddate = dto.getMatchEnddate();
				LocalDateTime matchRegdate = dto.getMatchRegdate();
				Duration duration = Duration.between(matchEnddate, matchRegdate);
				int days = ((int) duration.toDays()-1)*-1;
				dto.setdDay(days);
				dEndDayMap.put(dto, days);
			}
			List<MatchDto> matchlist = matchBiz.selectMatchList(member.getId());
			Map<MatchDto, Integer> dDayMap = new HashMap<MatchDto, Integer>();
			for(MatchDto dto : matchlist) {
				LocalDateTime matchEnddate = dto.getMatchEnddate();
				LocalDateTime matchRegdate = dto.getMatchRegdate();
				Duration duration = Duration.between(matchEnddate, matchRegdate);
				int days = ((int) duration.toDays()-1)*-1;
				dto.setdDay(days);
				dDayMap.put(dto, days);
			}
			model.addAttribute("dEnddays", dEndDayMap);
			model.addAttribute("ddays", dDayMap);
			model.addAttribute("list",matchBiz.selectSports(spoId));
			model.addAttribute("cnt",matchBiz.matchListCount());
			model.addAttribute("end",matchBiz.selectEndList(spoId));
			model.addAttribute("endcnt",matchBiz.matchEndCount());
			return "matchlist";
		}
		
		//매칭 검색	
			@GetMapping("/match/search")
			public String searchmatch(Model model, SearchDto dto, HttpServletRequest request) {
				HttpSession session = request.getSession();
				MemberDto member = (MemberDto) session.getAttribute("login");
				List<MatchDto> matchlist = matchBiz.selectMatchList(member.getId());
				
				Map<MatchDto, Integer> dDayMap = new HashMap<MatchDto, Integer>();
				for(MatchDto vo : matchlist) {
					LocalDateTime matchEnddate = vo.getMatchEnddate();
					LocalDateTime matchRegdate = vo.getMatchRegdate();
					Duration duration = Duration.between(matchEnddate, matchRegdate);
					int days = ((int) duration.toDays()-1)*-1;
					vo.setdDay(days);
					dDayMap.put(vo, days);
				}
				
				
				model.addAttribute("ddays", dDayMap);
				model.addAttribute("cnt",matchBiz.matchListCount());
				model.addAttribute("list",matchBiz.searchMatch(dto));
				model.addAttribute("endcnt",matchBiz.matchEndCount());

				
				return "matchlist";
			}
			
		@GetMapping("/match/detail")
		public String selectOneMatch(HttpServletRequest request, Model model, int matchSeq) {
			HttpSession session = request.getSession();
			MemberDto member = (MemberDto) session.getAttribute("login");
			model.addAttribute("member", memBiz.selectmember(member.getId()));
			model.addAttribute("dto", matchBiz.selectMatchOne(matchSeq, member.getId()));
			model.addAttribute("reply",matchBiz.selectReplyList(matchSeq));
			model.addAttribute("joinlist", matchBiz.selectJoinList(matchSeq));
			model.addAttribute("like",likesBiz.selectMatch(matchSeq, member.getId()));
			return "matchdetail";
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
		public String insertFormMatch(HttpServletRequest request, Model model) {
			HttpSession session = request.getSession();
			MemberDto member = (MemberDto) session.getAttribute("login");
			model.addAttribute("member", memBiz.selectmember(member.getId()));
			return "matchinsert";
		}
		
		
		
		@GetMapping("/match/updateform")
		public String updateFormMatch(HttpServletRequest request, Model model, int matchSeq) {
			HttpSession session = request.getSession();
			MemberDto member = (MemberDto) session.getAttribute("login");
			model.addAttribute("dto", matchBiz.selectMatchOne(matchSeq, member.getId()));
			return "matchupdate";
		}
		
		@PostMapping("/match/update")
		public String updateMatch(Model model, MatchDto dto) {
			if(matchBiz.updateMatch(dto)>0) {
				return "redirect:/match/detail?matchSeq="+dto.getMatchSeq();
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
		
		@PostMapping("/match/insertreply")
		public String insertReply(HttpServletRequest request, String repContent, int matchSeq, Model model) {
			HttpSession session = request.getSession();
			MemberDto member = (MemberDto) session.getAttribute("login");
			String id = member.getId();
			if(matchBiz.insertReply(repContent, id, matchSeq)>0) {
				return "redirect:/match/detail?matchSeq=" + matchSeq;
			}else {
				return "redirect:/match/detail?matchSeq=" + matchSeq;
			}
		}
		
		@GetMapping("/match/delreply")
		public String delReply(int repSeq, int matchSeq) {
			matchBiz.delReply(repSeq);
			
			return "redirect:/match/detail?matchSeq=" + matchSeq;
		}
		
//		@GetMapping("/match/joinMatchList")
//		public String joinMatchList(HttpSession session,Model model) {
//			MemberDto member = (MemberDto) session.getAttribute("login");
//			
//			model.addAttribute("joinmatchlist", member.getId()); 
//			
//			return "matchdetail";
//		}
			
		@ResponseBody
		@PostMapping("/match/matchJoin")
		public void MatchJoin(@RequestParam int matchSeq, @RequestParam String id) {
			if(matchBiz.MatchJoin(matchSeq, id)>0) {
				System.out.println("참여 성공");
			}else {
				System.out.println("참여 실패");
			}
		}
		
		@ResponseBody
		@GetMapping("/match/matchUnjoin")
		public void MatchUnjoin(@RequestParam int matchSeq, @RequestParam String id) {
			if(matchBiz.MatchUnjoin(matchSeq, id)>0) {
				System.out.println("취소 성공");
			}else {
				System.out.println("취소 실패");
			}
		}
//		@GetMapping("/match/session")
//		public String JavaSession(Model model, HttpServletRequest request) {
//			// 세션생성
//		    HttpSession session = request.getSession();
//		    HttpSession session1 = request.getSession(true);
//		    HttpSession session2 = request.getSession(false);
//
//		    // 새로운세션 생성여부
//		    boolean sNew = session.isNew();
//
//		    // 세션 유지시간 설정(초단위로)
//		    // 60*60 = 1시간
//		    int sTime = 60*60; 
//		    session.setMaxInactiveInterval(sTime);
//
//		    // 무한대설정
//		    session.setMaxInactiveInterval(-1);
//
//		    // 세션Id 값 가져오기
//		    String sId = session.getId();
//		    
//		    String hello = "Hello session!!";
//
//		    // 세션에 값 저장하기
//		    session.setAttribute("session_hello", hello);
//
//		    // 세션에서 값 가져오기
//		    String word = (String) session.getAttribute("session_hello");
//		    System.out.println(word);
//		    
//		    // 세션에서 일부 값 삭제하기
//		    session.removeAttribute("session_hello");
//
//		    // 모든세션 정보 삭제하기
//		    session.invalidate();
//		    return null;
//		}
		//매치 찜하기
		@ResponseBody
		@RequestMapping(value="/match/likes", method=RequestMethod.POST)
		public void insertLike(@RequestParam int matchSeq, HttpServletRequest request) {
			LikesDto dto = new LikesDto();
			dto.setMatchSeq(matchSeq);
			HttpSession session = request.getSession();
			MemberDto member = (MemberDto) session.getAttribute("login");
			dto.setId(member.getId());
			if(likesBiz.insertMatch(dto)>0) {
				System.out.println("찜 성공");		
			}else {
				System.out.println("찜 실패");
			}
		}
		
		@ResponseBody
		@RequestMapping(value="/match/dellikes", method=RequestMethod.GET)
		public void deleteLike(@RequestParam int matchSeq, HttpServletRequest request) {
			HttpSession session = request.getSession();
			MemberDto member = (MemberDto) session.getAttribute("login");
			if(likesBiz.deleteMatch(matchSeq, member.getId())>0) {
				System.out.println("취소 성공");	
			}else {
				System.out.println("취소 실패");	
			}
		}
		
		// 매칭확정/취소
		@ResponseBody
		@RequestMapping(value="/match/fixmatch", method=RequestMethod.POST)
		public void fixMatch(@RequestParam int matchSeq) {
			if(matchBiz.fixMatch(matchSeq)>0) {
				System.out.println("찜 성공");		
			}else {
				System.out.println("찜 실패");
			}
		}
		
		@ResponseBody
		@RequestMapping(value="/match/unfixmatch", method=RequestMethod.GET)
		public void unfixMatch(@RequestParam int matchSeq) {
			if(matchBiz.unfixMatch(matchSeq)>0) {
				System.out.println("취소 성공");	
			}else {
				System.out.println("취소 실패");	
			}
		}
		
		@RequestMapping(value="/match/facimport")
		public String facImport(Model model, HttpServletRequest request) {
			HttpSession session = request.getSession();
			MemberDto member = (MemberDto) session.getAttribute("login");
			
			model.addAttribute("faclist",memBiz.selectResfac(member.getId()));
			return "facimport-pop";
		}
		
		//공지사항
		@GetMapping("/notice/list")
		public String selectNoticelist(NoticeDto dto, Model model, Criteria criteria) {
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
		
		
		
}