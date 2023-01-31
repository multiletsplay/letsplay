package com.letplay.letplaytest.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.letplay.letplaytest.dto.MemberDto;


@Component
public class LoginInterceptor implements HandlerInterceptor{
	
	private Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		logger.info("[interceptor] : preHandle");
		
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("login");
		
		if(member == null ) {
			request.setAttribute("msg", "로그인 후 이용가능합니다.");
			request.setAttribute("url", "/member/loginform");
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/alert.jsp");
			view.forward(request, response);
			return false;
		}else {
			return true;
		}
		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.info("[interceptor] : postHandle");
	}

	
	
	
}
