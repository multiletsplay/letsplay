package com.letplay.letplaytest;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@SpringBootApplication
public class LetsPlayApplication {

	public static void main(String[] args) {
		SpringApplication.run(LetsPlayApplication.class, args);
	}
	
	@GetMapping("/")
	public String root() {
		return "index";
		//return "main";	//메인으로 이동 (추후 사용)
	}
}
