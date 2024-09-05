package servlet;

import java.io.IOException;
import java.sql.SQLException;

import dao.CommentList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

//@WebServlet("*.comment")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());

		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		if (command.equals("/commentOn.comment")) {
			try {
				commentOn(request, response);
			} catch (ClassNotFoundException | IOException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
		
		
	public void commentOn(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException {
	
		HttpSession session = request.getSession();
	
		request.setCharacterEncoding("utf-8");
		
		String userId = (String)session.getAttribute("id");
		String postId = request.getParameter("postId");
		String comment = request.getParameter("comment-textarea");

		String message = null;
		
		CommentList commentlist = new CommentList();
		
		message = commentlist.addComment(postId, userId, comment);
		
		session.setAttribute("message", message);
		
		response.sendRedirect("post/post.jsp?postId=" + postId);

	}
}
