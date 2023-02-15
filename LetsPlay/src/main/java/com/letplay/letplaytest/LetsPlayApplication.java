package com.letplay.letplaytest;

import java.time.LocalDate;
import java.time.Period;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String root(Model model, @RequestParam(required = false) Integer mspoId, @RequestParam(required = false) Integer fspoId, @RequestParam(required = false) Integer lspoId, 
			@RequestParam(required = false) String match, @RequestParam(required = false) String facility, @RequestParam(required = false) String lesson) {
		List<MatchDto> matchlist = matchBiz.selectMainList();
		Map<MatchDto, Integer> dDayMap = new HashMap<MatchDto, Integer>();
		for(MatchDto dto : matchlist) {
			LocalDate matchEnddate = dto.getMatchEnddate();
			LocalDate matchRegdate = LocalDate.now();
			Period period = Period.between(matchEnddate, matchRegdate);
			int days = ((int) period.getDays()*-1);
			dto.setdDay(days);
			dDayMap.put(dto, days);
		}
		model.addAttribute("ddays", dDayMap);
		model.addAttribute("cnt",matchBiz.matchListCount());
		model.addAttribute("matlist", matchBiz.selectMainList());
		model.addAttribute("matlisthot", matchBiz.selectMainHot(mspoId));
		model.addAttribute("faclist", facBiz.selectRateavg(fspoId));
		model.addAttribute("leslist", lessonBiz.selectRateavg(lspoId));
		return "index";
	}
}