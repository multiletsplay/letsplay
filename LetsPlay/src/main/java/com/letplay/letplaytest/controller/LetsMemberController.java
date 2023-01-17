package com.letplay.letplaytest.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.letplay.letplaytest.biz.MemberBiz;
import com.letplay.letplaytest.dto.MemberDto;


@Controller
@RequestMapping("/member")
public class LetsMemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(LetsMemberController.class);
	
	@Autowired
	private MemberBiz membiz;
	
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
		return "login";
	}
	
	//회원가입
	@RequestMapping("/signupform")
	public String signup() {
		return "signup";
	}
	
	@RequestMapping("/signup")
	public String insertRes(MemberDto dto, Model model) {
		int res = membiz.insert(dto);
		
		if(res>0) {
			model.addAttribute("msg", "회원가입 성공");
			model.addAttribute("url", "/member/loginform");
			return "alert";
		}else {
			model.addAttribute("msg", "회원가입 실패");
			model.addAttribute("url", "/member/signupform");
			return "alert";
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
	
	@RequestMapping("/findpwform")
	public String findPwform() {
		return "findpw";
	}
	
	// 마이페이지 수정해야함
	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public String selectmember(HttpSession session,Model model, String id) {
		MemberDto member = (MemberDto) session.getAttribute("login");
		
		model.addAttribute("list", member.getId());
		logger.info(id);
		model.addAttribute("listdto", membiz.selectmyreview(member.getId()) );
		
		return "mypage";
	}
	
	
}
