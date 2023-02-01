package com.letplay.letplaytest.controller;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.letplay.letplaytest.dto.LikesDto;
import com.letplay.letplaytest.dto.MatchDto;
import com.letplay.letplaytest.dto.MemberDto;
import com.letplay.letplaytest.dto.SearchDto;

@Controller
@RequestMapping("/")
public class LetsMatchController {
	@Autowired
	private MatchBiz matchBiz;
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
	
	//메인
	
	@GetMapping("/index")
	public String selectMainList(Model model, HttpServletRequest request, int spoId, String id) {
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
		
		model.addAttribute("spolist",matchBiz.selectMainSports(spoId));
		model.addAttribute("Hot",matchBiz.selectMainHot(id));
		return "index";
	}
		
}