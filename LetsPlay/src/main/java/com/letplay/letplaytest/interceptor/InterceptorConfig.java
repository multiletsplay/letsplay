package com.letplay.letplaytest.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer{
	@Autowired
	private LoginInterceptor loginInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(loginInterceptor)
				.addPathPatterns("/match/**")
				.addPathPatterns("/lesson/**")
				.addPathPatterns("/facility/**")
				.addPathPatterns("/inquiry/**")
				.addPathPatterns("/notice/**")
				.excludePathPatterns("/member/**");
		
	}
}
