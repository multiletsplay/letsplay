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
	public String insertRes(MemberDto dto) {
		int res = membiz.insert(dto);
		
		if(res>0) {
			return "redirect:/member/loginform"
					+ "";
		}else {
			return "redirect:/member/signupform";
		}
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
