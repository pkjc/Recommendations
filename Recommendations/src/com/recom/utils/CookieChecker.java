package com.recom.utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CookieChecker {
	public boolean checkCookie(HttpServletRequest request){
		Cookie[] cookies = request.getCookies();
		boolean cookieFound = false;
		
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if ((cookie.getName().equals("patID")) || (cookie.getName().equals("docID"))) {
					System.out.println("found cookie \n");
					cookieFound = true;
					break;
				}
			}
		}
		return cookieFound;
	}
}
