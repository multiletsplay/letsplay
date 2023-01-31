package com.letplay.letplaytest.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.letplay.letplaytest.biz.FacBiz;
import com.letplay.letplaytest.biz.InqReplyBiz;
import com.letplay.letplaytest.biz.InquiryBiz;
import com.letplay.letplaytest.biz.LikesBiz;
import com.letplay.letplaytest.biz.MemberBiz;
import com.letplay.letplaytest.biz.ReviewBiz;
import com.letplay.letplaytest.dto.Criteria;
import com.letplay.letplaytest.dto.FacDto;
import com.letplay.letplaytest.dto.FacResDto;
import com.letplay.letplaytest.dto.InqReplyDto;
import com.letplay.letplaytest.dto.InquiryDto;
import com.letplay.letplaytest.dto.LikesDto;
import com.letplay.letplaytest.dto.MemberDto;
import com.letplay.letplaytest.dto.PageDto;
import com.letplay.letplaytest.dto.SearchDto;
import com.letplay.letplaytest.dto.TimeDto;

@Controller
@SessionAttributes("member")
@RequestMapping("/")
public class LetsFacilityController {
	@Autowired
	private FacBiz facBiz;
	@Autowired
	private ReviewBiz reivewBiz;
	@Autowired
	private MemberBiz memBiz;
	@Autowired
	private LikesBiz likesBiz;
	
	// 시설
	@GetMapping("/facility/list")
	public String selectFacList(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("login");
		model.addAttribute("member", memBiz.selectmember(member.getId()));
		model.addAttribute("faclist", facBiz.selectFacList(member.getId()));
		return "facilitylist";
	}
	
	@GetMapping("/facility/select")
	public String selectSports(HttpServletRequest request, Model model, int spoId) {
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("login");
		model.addAttribute("member", memBiz.selectmember(member.getId()));
		model.addAttribute("faclist", facBiz.selectSports(spoId, member.getId()));
		return "facilitylist";
	}
	
	//시설 검색	
	@GetMapping("/facility/search")
	public String searchfac(HttpServletRequest request, Model model, SearchDto dto) {
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("login");
		model.addAttribute("member", memBiz.selectmember(member.getId()));
		dto.setId(member.getId());
		model.addAttribute("faclist", facBiz.searchFac(dto));
		return "facilitylist";
	}
	
	@GetMapping("/facility/detail")
	public String selectFacDetail(HttpServletRequest request, Model model, int facSeq ) {
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("login");
		
		//datetime -> 날짜와 시간으로 각각 나눠서 view에 전달
		List<TimeDto> datelist = facBiz.selectTime(facSeq);
		//Map<TimeDto, List<String>> datetimeMap = new HashMap<TimeDto, List<String>>();
		//List<String> timelist = new ArrayList<String>();
		for(TimeDto dto : datelist) {
			Date dt = dto.getDt();
			SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String ds = fm.format(dt);
			String date = ds.substring(0, 10);
			String time = ds.substring(11);
			dto.setDate(date);
			dto.setTime(time);
			//timelist.add(time);
			//datetimeMap.put(dto, null);
		}
//		List<List<String>> times = new ArrayList<>();
//		int partitionSize = 24;
//		times.add(timelist.subList(0,18));
//// 		for(int i=18; i<timelist.size(); i+=partitionSize) {
////			times.add(timelist.subList(i, Math.min(i + partitionSize, timelist.size())));
////		}
// 		for(TimeDto dto : datelist) {
// 			datetimeMap.put(dto, times.get(0));
// 		}
		//model.addAttribute("timeMap", datetimeMap);

		model.addAttribute("time", datelist);
		
		model.addAttribute("member", memBiz.selectmember(member.getId()));
		model.addAttribute("dto", facBiz.selectFac(facSeq));
		model.addAttribute("like", likesBiz.selectfac(facSeq, member.getId()));
		model.addAttribute("reviewlist", reivewBiz.selectReviewList(facSeq));
		return "facilitydetail";
	}
	
//	@RequestMapping(value="/facility/pathfind", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
//	@ResponseBody
//	public RedirectView findPath(@RequestParam("facName") String facName, @RequestParam("coordsy") String coordsy, @RequestParam("coordsx") String coordsx) {
//		RedirectView redirectView = new RedirectView();
//		redirectView.setUrl("https://map.kakao.com/link/to/"+facName+","+coordsy+","+coordsx);
//		return redirectView;
//	}
	
	@PostMapping("/facility/delete")
	public String deletFac(Model model, @RequestParam(value="delList", required=false) List<Integer> ids) {
		if (ids == null) {
			model.addAttribute("msg", "시설을 선택해주세요.");
			model.addAttribute("url", "/facility/list");
			return "alert";
		}else {
			for(Integer facSeq : ids) facBiz.deleteFac(facSeq);
			model.addAttribute("msg", "삭제 성공");
			model.addAttribute("url", "/facility/list");
			return "alert";
		}
	}
	
	@GetMapping("/facility/insertform")
	public String insertFac() {
		return "facilityinsert";
	}
	
	@PostMapping("/facility/insert")
	public String insertFac(Model model, FacDto dto, MultipartFile file) throws Exception {
		if(facBiz.insertFac(dto, file)>0) {
			model.addAttribute("msg", "등록 완료");
			model.addAttribute("url", "/facility/list");
			return "alert";
		}else {
			model.addAttribute("msg", "등록 실패");
			model.addAttribute("url", "/facility/insertform");
			return "alert";
		}
	}
	
	@GetMapping("/facility/updateform")
	public String updateFac(Model model, int facSeq) {
		model.addAttribute("dto", facBiz.selectFac(facSeq));
		return "facilityupdate";
	}
	
	@PostMapping("/facility/update")
	public String updatefac(Model model, FacDto dto) {
		if(facBiz.updateFac(dto)>0) {
			model.addAttribute("msg", "수정 완료");
			model.addAttribute("url", "/facility/detail?facSeq="+dto.getFacSeq());
			return "alert";
		}else {
			model.addAttribute("msg", "수정 실패");
			model.addAttribute("url", "/facility/detail?facSeq="+dto.getFacSeq());
			return "alert";
		}
	}
	
	//시설 찜하기
	@ResponseBody
	@RequestMapping(value="/facility/likes", method=RequestMethod.POST)
	public void insertLike(@RequestParam int facSeq, HttpServletRequest request) {
		LikesDto dto = new LikesDto();
		dto.setFacSeq(facSeq);
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("login");
		dto.setId(member.getId());
		if(likesBiz.insertfac(dto)>0) {
			System.out.println("찜 성공");		
		}else {
			System.out.println("찜 실패");
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/facility/dellikes", method=RequestMethod.GET)
	public void deleteLike(@RequestParam int facSeq, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("login");
		if(likesBiz.deletefac(facSeq, member.getId())>0) {
			System.out.println("취소 성공");	
		}else {
			System.out.println("취소 실패");	
		}
	}
	
	//시설예약
	@PostMapping("/facility/reserve")
	public String reserveConfirm(HttpServletRequest request, Model model, FacResDto dto) {
		//로그인정보 가져오기
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("login");
		model.addAttribute("member", memBiz.selectmember(member.getId()));
		//예약번호 부여
		LocalDateTime now = LocalDateTime.now();
		String localtime = now.format(DateTimeFormatter.ofPattern("yyMMddHHmmss"));
		String resId = "res_"+ localtime;
		dto.setResId(resId);
		model.addAttribute("dto", dto);
		return "resconfirm";
	}
	
	//시설 결제후 예약내역 db저장
	@PostMapping("/facility/payment")
	public String reservePayment(Model model, FacResDto dto) throws ParseException {
		//예약날짜,시간 데이터변환
		String ds = dto.getResDate() + " " + dto.getResStarttime();
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date dt = fm.parse(ds);
		dto.setResDatetime(dt);
		System.out.println(dto.getResDatetime());
		
		if(facBiz.insertRes(dto)>0) {
			model.addAttribute("msg", "예약 성공");
			model.addAttribute("url", "/member/mypage");
			return "alert";
		}else {
			model.addAttribute("msg", "예약 실패");
			model.addAttribute("url", "/facility/detail?facSeq="+dto.getFacSeq());
			return "alert";
		}
	}
	
}
