package filter;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Arrays;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.*;

//@WebFilter("/lectures/lec.jsp")
public class LecCookie implements Filter {

	@Override
	public void init(FilterConfig config) throws ServletException {
		System.out.println("LecCookie filter initialized");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpSession session =  ((HttpServletRequest) request).getSession();
		HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
		
		List<String> lectureList = new ArrayList<>();
		
		String lectureId = request.getParameter("lecId");
		
	    if (lectureId != null && !lectureId.trim().isEmpty()) {
	        Cookie[] cookies = httpRequest.getCookies();
	        Cookie lectureCookie = null;
	        String lectureCookieValue = "";

	        if (cookies != null) {
	            for (Cookie cookie : cookies) {
	                if ("recentLectures".equals(cookie.getName())) {
	                    lectureCookie = cookie;
	                    lectureCookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
	                    break;
	                }
	            }
	        }

	        
	        if (lectureCookieValue != null && !lectureCookieValue.trim().isEmpty()) {
	            String[] lectures = lectureCookieValue.split(",");
	            lectureList.addAll(Arrays.asList(lectures));
	            lectureList.remove(lectureId);
	        }

	        lectureList.add(0, lectureId);

	        if (lectureList.size() > 5) {
	            lectureList.remove(lectureList.size() - 1);
	        }
	        
	        String newLectureCookieValue = String.join(",", lectureList);
	        newLectureCookieValue = URLEncoder.encode(newLectureCookieValue, "UTF-8");

	        Cookie newLectureCookie = new Cookie("recentLectures", newLectureCookieValue);
	        newLectureCookie.setPath("/");
	        newLectureCookie.setMaxAge(60*60*24);
	        httpResponse.addCookie(newLectureCookie);
	    }
	    chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		System.out.println("LecCookie filter destroyed");
	}
}