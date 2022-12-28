package com.letplay.letplaytest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LetsFaqController {
	
	@RequestMapping("/faqcontent")
	public String FaqContent() {
		return "faqcontent";
		
	};
	
	
}
