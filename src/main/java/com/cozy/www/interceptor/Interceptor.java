package com.cozy.www.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Interceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(Interceptor.class);
	
	static final String[] EXCLUDE_URL_LIST = {
			
			// �씤�뜳�뒪
			"/home",
			
			// 濡쒓렇�씤
			"/loginForm","/loginSuccess",
			
			// �쉶�썝媛��엯
			"/joinForm","/mailCheck","/idChk",
			"/user",
			
			// �븘�씠�뵒, 鍮꾨쾲 李얘린
			"/findid", "/findpwd","/foundid","/nowfind","/nowid","/idCheck",
			
			// 鍮좊Ⅸ濡쒓렇�씤
			"/login/oauth_kakao","/naverSave","/callback","/googleloginForm",
			
			// 濡쒓렇�븘�썐
			"/logout",
			
			// �긽�뭹由ъ뒪�듃(移댄뀒怨좊━蹂�)
			"/product",
			
			// 由ъ냼�뒪�뱾
			"/resources"
			     
	};
	
	//관리자 페이지 인터셉터
	static final String[] ADMIN_URL_LIST = {
			"/ad","/aduserList","/pay/admin/list",
	};
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String reqUrl = request.getRequestURL().toString();
		
		for (String target : EXCLUDE_URL_LIST) {
			if(reqUrl.indexOf(target) > -1) {
				return true;
			}
		}
		
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("uid");
		String userIdf = (String)session.getAttribute("fid");
		
		
		String requestUrl = request.getRequestURL().toString();
		
		if (requestUrl.contains("/login.do")) {
			return true;
		}
		
		if((userId == null || userId.trim().equals("")) && (userIdf == null || userIdf.trim().equals(""))) {
			logger.info(">> interceptor catch!!! uid is null..");
			session.invalidate();
			response.sendRedirect(request.getContextPath() + "/login.do");			
			return false;
		}
		
		for (String target: ADMIN_URL_LIST) {
			if(reqUrl.indexOf(target) > -1) {						
				if((userId == null || !userId.trim().equals("admin")) && (userIdf == null || !userIdf.trim().equals("admin"))) {
					logger.info(">> interceptor catch!!! not admin..");
					response.sendRedirect(request.getContextPath() + "/");
					return false;
					}
				}		
				return true;		
			}	
			return true;		
	}
}
