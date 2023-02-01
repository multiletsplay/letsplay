package com.letplay.letplaytest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.letplay.letplaytest.biz.FacBiz;
import com.letplay.letplaytest.biz.LessonBiz;
import com.letplay.letplaytest.biz.MatchBiz;

@Controller
@SpringBootApplication
public class LetsPlayApplication {
	@Autowired
	private FacBiz facBiz;
	@Autowired
	private LessonBiz lessonBiz;
	@Autowired
	private MatchBiz matchBiz;
	
	public static void main(String[] args) {
		SpringApplication.run(LetsPlayApplication.class, args);
	}
	
	@GetMapping("/")
	public String root(Model model) {
		model.addAttribute("faclist", facBiz.selectRateavg());
		model.addAttribute("leslist", lessonBiz.selectRateavg());
		return "index";
	}
	
	@GetMapping("/selectmat")
	public String rootSelectmat(Model model, int spoId ) {
		model.addAttribute("matlist", facBiz.selectRatesports(spoId));
		return "index";
	}
	
	@GetMapping("/selectfac")
	public String rootSelectfac(Model model, int spoId ) {
		model.addAttribute("faclist", facBiz.selectRatesports(spoId));
		return "index";
	}
	
	@GetMapping("/selectles")
	public String rootSelectles(Model model, int spoId ) {
		model.addAttribute("leslist", lessonBiz.selectRatesports(spoId));
		return "index";
	}
}
