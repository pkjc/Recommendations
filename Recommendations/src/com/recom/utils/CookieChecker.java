package com.recom.utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CookieChecker {
	public boolean checkCookie(HttpServletRequest request){
		Cookie[] cookies = request.getCookies();
		boolean cookieFound = false;
		
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("patID")) {
					cookieFound = true;
					request.setAttribute("patID", cookie.getValue());
					break;
				}else if(cookie.getName().equals("docID")){
					cookieFound = true;
					request.setAttribute("docID", cookie.getValue());
					break;
				}
			}
		}
		return cookieFound;
	}
}
