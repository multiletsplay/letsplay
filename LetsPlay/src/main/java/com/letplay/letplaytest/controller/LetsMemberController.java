package com.letplay.letplaytest.controller;

import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
//import javax.validation.Valid;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.letplay.letplaytest.biz.FacBiz;
import com.letplay.letplaytest.biz.LessonBiz;
import com.letplay.letplaytest.biz.MatchBiz;
import com.letplay.letplaytest.biz.MemberBiz;
import com.letplay.letplaytest.biz.ReviewBiz;
import com.letplay.letplaytest.dto.MatchDto;
import com.letplay.letplaytest.dto.MemberDto;
import com.letplay.letplaytest.dto.ReviewDto;


@Controller
@RequestMapping("/member")
public class LetsMemberController {
	
	@Autowired
	private ReviewBiz reviewBiz;
	@Autowired
	private MemberBiz membiz;
	@Autowired
	private MatchBiz matchbiz;
	@Autowired
	private FacBiz facbiz;
	@Autowired
	private LessonBiz lessonbiz;
	
	//로그인
	@RequestMapping("/loginform")
	public String login() {
		return "login";
	}
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> ajaxLogin(HttpSession session, @RequestBody MemberDto dto){
		MemberDto res = membiz.login(dto);
		boolean check = false;
		
		if(res != null) {
			session.setAttribute("login", res);
			check=true;
		}
		Map<String, Boolean> map = new HashMap<String,Boolean>();	
		map.put("check", check);
		
		return map;
	}
	
	@RequestMapping("/logout")
	public String logout() {
		return "logout";
	}
	
	//회원가입
	@RequestMapping("/signupform")
	public String signup() {
		return "signup";
	}
	
	//@RequestMapping("/signup")
	//public String insertRes(MemberDto dto, Model model) {
	//	int res = membiz.insert(dto);
	//	
	//	if(res>0) {
	//		model.addAttribute("msg", "회원가입 성공");
	//		model.addAttribute("url", "/member/loginform");
	//		return "alert";
	//	}else {
	//		model.addAttribute("msg", "회원가입 실패");
	//		model.addAttribute("url", "/member/signupform");
	//		return "alert";
	//	}
	//}
	
	@PostMapping(value = "/signup")
    public String validCheck(@Valid MemberDto dto, Errors errors, Model model){
        if(errors.hasErrors()){
        	model.addAttribute("dto", dto);
        //패스워드 유효성 검사 부적합
            Map<String, String> validatorResult = membiz.validateHandling(errors);
            for (String key : validatorResult.keySet()) {
                model.addAttribute(key, validatorResult.get(key));
            }

            // 유효성 통과 못한 필드와 메시지를 핸들링
            
            return "signup";
        } else {
        	if(membiz.insert(dto)>0) {
                model.addAttribute("msg", "회원가입 성공");
                model.addAttribute("url", "/member/loginform");
                return "alert";
            }else {
                model.addAttribute("msg", "회원가입 실패");
                model.addAttribute("url", "/member/signupform");
                return "alert";
            }
        
        
        }
        
    }
	
	
	
	@ResponseBody
	@RequestMapping(value="/idcheck", method=RequestMethod.GET)
	public int idcheck(@RequestParam String id ) {
		int result = membiz.idcheck(id);
		return result;
	}
	
	@RequestMapping("/findidform")
	public String findIdform() {
		return "findid";
	}
	
	@GetMapping("/findid")
	public String findId(@RequestParam("name") String name, @RequestParam("phone") String phone, Model model ) {
		model.addAttribute("id", membiz.findid(name, phone));
		if( membiz.findid(name, phone) == null ) {
			model.addAttribute("msg", "아이디가 존재하지 않습니다.");
			model.addAttribute("url", "/member/findidform");
			return "alert";
		}
		return "forward:/member/findidform";
	}
	
//	@RequestMapping("/findpwform")
//	public String findPwform(Model model, HttpSession session ) {
//		MemberDto member = (MemberDto) session.getAttribute("login");
//		model.addAttribute("pw", membiz.findpw(member.getId()));
//		return "findpw";
//	}
	
	@RequestMapping("/findpwform")
	public String findPwform(Model model ) {
		return "findpw";
	}
	
	@ResponseBody
	@RequestMapping(value="/findpw", method=RequestMethod.GET)
	public String findPw(Model model, @RequestParam String id ) {
		String pw = membiz.findpw(id);
		return pw;
	}
	
	// 마이페이지
	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public String selectmember(HttpSession session, Model model ) {
		MemberDto member = (MemberDto) session.getAttribute("login");
		List<MatchDto> matchlist = membiz.selectMatchList(member.getId());
		Map<MatchDto, Integer> dDayMap = new HashMap<MatchDto, Integer>();
		for(MatchDto dto : matchlist) {
			LocalDate matchEnddate = dto.getMatchEnddate();
			LocalDate matchRegdate = LocalDate.now();
			Period period = Period.between(matchEnddate, matchRegdate);
			int days = ((int) period.getDays()*-1);
			dto.setdDay(days);
			System.out.println("Remaining days: " + days);
			dDayMap.put(dto, days);
		}
		List<MatchDto> matchjoinlist = membiz.selectMatchjoinList(member.getId());
		Map<MatchDto, Integer> dDayMap2 = new HashMap<MatchDto, Integer>();
		for(MatchDto dto : matchjoinlist) {
			LocalDate matchEnddate = dto.getMatchEnddate();
			LocalDate matchRegdate = LocalDate.now();
			Period period = Period.between(matchEnddate, matchRegdate);
			int days = ((int) period.getDays()*-1);
			dto.setdDay(days);
			System.out.println("Remaining days: " + days);
			dDayMap2.put(dto, days);
		}
		model.addAttribute("ddays", dDayMap);
		model.addAttribute("ddays2", dDayMap2);
		model.addAttribute("list", membiz.selectMatchList(member.getId()));
		model.addAttribute("joinlist", membiz.selectMatchjoinList(member.getId()));
		model.addAttribute("member", membiz.selectmember(member.getId()));
		model.addAttribute("faclist", membiz.selectResfac(member.getId()));
		model.addAttribute("leslist", membiz.selectResles(member.getId()));
		model.addAttribute("likesfaclist", membiz.selectLikesfac(member.getId()));
		model.addAttribute("likesmatlist", membiz.selectLikesmat(member.getId()));
		model.addAttribute("likesleslist", membiz.selectLikesles(member.getId()));
		//model.addAttribute("listdto", membiz.selectmyreview(member.getId()) );
		model.addAttribute("inqlist", membiz.selectInq(member.getId()));
		return "mypage";
	}
	
	@GetMapping("/mypage/resselect")
	public String selectSports(HttpServletRequest request, Model model, char type) {
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("login");
		model.addAttribute("member", membiz.selectmember(member.getId()));
		if(type == 'F') {
			model.addAttribute("faclist", membiz.selectResfac(member.getId()));
		}else {
			model.addAttribute("leslist", membiz.selectResles(member.getId()));
		}
		return "mypage";
	}
	
	@GetMapping("/cancelfacres")
	public String cancelFacres(Model model, String resId) {
		if(facbiz.cancelres(resId)>0) {
			model.addAttribute("msg", "취소 성공");
			model.addAttribute("url", "/member/mypage");
			return "alert";
		}else {
			model.addAttribute("msg", "취소 실패");
			model.addAttribute("url", "/member/mypage");
			return "alert";
		}
	}
	
	@GetMapping("/cancellesres")
	public String cancelLesres(Model model, String resId) {
		if(lessonbiz.cancelres(resId)>0) {
			model.addAttribute("msg", "취소 성공");
			model.addAttribute("url", "/member/mypage");
			return "alert";
		}else {
			model.addAttribute("msg", "취소 실패");
			model.addAttribute("url", "/member/mypage");
			return "alert";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/phoneAuth", method=RequestMethod.POST)
	public Boolean phoneAuth(String tel, HttpSession session) {

	    try { // 이미 가입된 전화번호가 있으면
	        if(membiz.memberTelCount(tel) > 0) 
	            return true; 
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    String code = membiz.sendRandomMessage(tel);
	    session.setAttribute("rand", code);
	    
	    return false;
	}
	
	@ResponseBody
	@RequestMapping(value="/phoneAuthOk", method=RequestMethod.POST)
	public Boolean phoneAuthOk(HttpSession session, HttpServletRequest request) {
	    String rand = (String) session.getAttribute("rand");
	    String code = (String) request.getParameter("code");

	    System.out.println(rand + " : " + code);

	    if (rand.equals(code)) {
	        session.removeAttribute("rand");
	        return false;
	    } 

	    return true;
	}
			
	
	@PostMapping("/update")
	public String update(HttpSession session, MemberDto dto) {
		MemberDto member = (MemberDto) session.getAttribute("login");
		dto.setId(member.getId());
		if(membiz.update(dto) > 0) {
			return "redirect:/member/mypage";
		} else {
			return "redirect:/member/mypage";
		}
	}
	
	@GetMapping("/delete")
	public String delete(HttpSession session) {
		MemberDto member = (MemberDto) session.getAttribute("login");
		String id = member.getId();
		if(membiz.delete(id)>0) {
			return "redirect:/member/loginform";
		} else {			
			return "redirect:/member/mypage";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/nicknamecheck", method=RequestMethod.GET)
	public int nicknamecheck(@RequestParam String nickname ) {
		int result = membiz.nicknamecheck(nickname);
		return result;
	}
	
	@GetMapping("/reviewinsertform")
	public String reviewinsert(HttpSession session, Model model, @RequestParam(value="facSeq", required=false)Integer facSeq, @RequestParam(value="lesSeq", required=false)Integer lesSeq) {
		MemberDto member = (MemberDto) session.getAttribute("login");
		model.addAttribute("member", membiz.selectmember(member.getId()));
		if(facSeq != null) {
		model.addAttribute("dto", facbiz.selectFac(facSeq));
		} else {
		model.addAttribute("dto", lessonbiz.selectLesson(lesSeq));
		}
		return "reviewinsert";
	}

	@RequestMapping(value="/review/insert", method=RequestMethod.POST)
	public String reviewInsert(Model model, ReviewDto dto) {
		if(dto.getCon() == 1) {
			dto.setFacSeq(null);
			
			if(reviewBiz.reviewInsert(dto)>0) {
				return "winclose";
			}else {
				return "winclose";
			}
		} else {
			dto.setLesSeq(null);
			if(reviewBiz.reviewInsert(dto)>0) {
				return "winclose";
			}else {
				return "winclose";
			}
		}
	}
	
	@GetMapping("/reviewupdateform")
	public String reviewUpdate(HttpSession session, Model model, @RequestParam(value="facSeq", required=false)Integer facSeq, @RequestParam(value="lesSeq", required=false)Integer lesSeq) {
		MemberDto member = (MemberDto) session.getAttribute("login");
		model.addAttribute("member", membiz.selectmember(member.getId()));
		if(facSeq != null) {
		model.addAttribute("dto", reviewBiz.selectFac(facSeq, member.getId()));
		} else {
		ReviewDto dto = reviewBiz.selectLesson(lesSeq, member.getId());
		model.addAttribute("dto", reviewBiz.selectLesson(lesSeq, member.getId()));
		}
		return "reviewupdate";
	}

	@RequestMapping(value="/review/update", method=RequestMethod.POST)
	public String reviewUpdate(Model model, ReviewDto dto) {
		if(dto.getCon() == 1) {
			dto.setFacSeq(null);
			
			if(reviewBiz.reviewUpdate(dto)>0) {
				return "winclose";
			}else {
				return "winclose";
			}
		} else {
			dto.setLesSeq(null);
			if(reviewBiz.reviewUpdate(dto)>0) {
				return "winclose";
			}else {
				return "winclose";
			}
		}
	}
	
	@GetMapping("/review/delete")
	public String reviewDelete(int revId, Model model) {
		
		if(reviewBiz.reviewDelete(revId)>0) {
			model.addAttribute("msg", "후기 삭제 완료");
			model.addAttribute("url", "/member/mypage");
			return "alert";
		} else {			
			model.addAttribute("msg", "후기 삭제 실패");
			model.addAttribute("url", "/member/mypage");
			return "alert";
		}
	}
	
}