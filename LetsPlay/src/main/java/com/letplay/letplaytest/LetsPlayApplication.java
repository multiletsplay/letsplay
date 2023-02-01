package com.letplay.letplaytest;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.letplay.letplaytest.biz.FacBiz;
import com.letplay.letplaytest.biz.LessonBiz;
import com.letplay.letplaytest.biz.MatchBiz;
import com.letplay.letplaytest.dto.MatchDto;

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
		List<MatchDto> matchlist = matchBiz.selectMainList();
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
		model.addAttribute("cnt",matchBiz.matchListCount());
		model.addAttribute("matlist", matchBiz.selectMainList());
		model.addAttribute("matlisthot", matchBiz.selectMainHot());
		model.addAttribute("faclist", facBiz.selectRateavg());
		model.addAttribute("leslist", lessonBiz.selectRateavg());
		return "index";
	}
	
	@GetMapping("/selectmat")
	public String rootSelectmat(Model model, int spoId ) {
		model.addAttribute("matlist", matchBiz.selectMainSports(spoId));
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
