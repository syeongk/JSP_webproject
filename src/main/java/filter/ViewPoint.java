package filter;

import java.io.IOException;
import java.sql.SQLException;

import dao.PostList;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

//@WebFilter("/post/post.jsp")
public class ViewPoint implements Filter {
	@Override
	public void init(FilterConfig config) throws ServletException {
		System.out.println("ViewPoint filter initialized");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpSession session =  ((HttpServletRequest) request).getSession();

		String userId = (String) session.getAttribute("id");

		if (userId != null) {
			if (request instanceof HttpServletRequest) {
				HttpServletRequest httpRequest = (HttpServletRequest) request;

				String postIdParam = httpRequest.getParameter("postId");
				PostList postlist = new PostList();
				try {
					postlist.increaseView(postIdParam);
				} catch (SQLException e) {
					e.printStackTrace();
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}
			}
		}
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		System.out.println("ViewPoint filter destroyed");
	}
}