package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import dao.PostList;
import dto.Post;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

//@WebServlet("*.post")
public class PostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());

		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		if (command.equals("/createPost.post")) {
			createPost(request, response);
		}
	}
		
		
	public void createPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
	
		HttpSession session = request.getSession();
	
		request.setCharacterEncoding("utf-8");

		LocalDate currentDate = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy/MM/dd");
		String postDate = currentDate.format(formatter);
		
		String userId = (String) session.getAttribute("id");
		String postTitle = request.getParameter("postTitle");
		String postContent = request.getParameter("postContent");
		String category = request.getParameter("postCategory");
		String url = "post/posts.jsp?category=" + category;

		String message = null;

		Post post = new Post(userId, postTitle, postContent, postDate, 0, category);
		PostList postlist = new PostList();

		try {
			message = postlist.addPost(post);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		session.setAttribute("message", message);

		response.sendRedirect(url);

	}
}
