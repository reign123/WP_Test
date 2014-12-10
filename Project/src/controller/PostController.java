package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.PostDao;
import model.dto.Post;
import model.dto.User;

/**
 * Servlet implementation class BoardController
 */
@WebServlet("/post")
public class PostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final ServletRequest request = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PostController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		response.setContentType("application/json");
		ArrayList<Post> postList = null;
		if (action.equals("list")) {
			int category = Integer.parseInt(request.getParameter("category"));
			int pageNumber = Integer.parseInt(request
					.getParameter("pageNumber"));
			if (category == 0) {
				// 전체 불러오기
				postList = PostDao.getInstance().list(pageNumber);
			} else {
				// 카테고리대로 가져오기
				postList = PostDao.getInstance().list(category, pageNumber);
			}
			request.setAttribute("postList", postList);
			request.setCharacterEncoding("UTF-8");

			RequestDispatcher rd = request.getRequestDispatcher("/search.jsp");
			rd.forward(request, response);
		} else if (action.equals("view")) {
			int num = Integer.parseInt(request.getParameter("num"));

			Post post = PostDao.getInstance().view(num);
			request.setAttribute("post", post);

			request.setCharacterEncoding("UTF-8");
			RequestDispatcher rd = request.getRequestDispatcher("/view.jsp");
			rd.forward(request, response);
		} else if (action.equals("editFile")) {

			int num = Integer.parseInt(request.getParameter("num"));

			Post post = PostDao.getInstance().view(num);
			request.setAttribute("post", post);
			
			request.setCharacterEncoding("UTF-8");
			RequestDispatcher rd = request
					.getRequestDispatcher("/editFile.jsp");
			rd.forward(request, response);
		} 
		/*
		 * else if(action.equals("serach")){
		 * 
		 * String data = request.getParameter("searchValue");
		 * 
		 * Post post = PostDao.getInstance().search(data); }
		 */
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");

		PostDao dao = new PostDao();
		response.setContentType("application/json");

		if (action != null) {
			if (action.equals("write")) {
				String subject = request.getParameter("subject");
				String user_id = request.getParameter("id");
				int category = Integer.parseInt(request
						.getParameter("category"));
				String content = request.getParameter("content");

				Post post = new Post();
				post.setTitle(subject);
				post.setUser_id(user_id);
				post.setContent(content);
				post.setCategory(category);

				dao.write(post);

				// 전체 불러오기
				ArrayList<Post> postList = null;
				postList = PostDao.getInstance().list(1);
				request.setAttribute("postList", postList);

				request.setCharacterEncoding("UTF-8");
				RequestDispatcher rd = request
						.getRequestDispatcher("/search.jsp");
				rd.forward(request, response);
			} else if (action.equals("delete")) {

				int num = Integer.parseInt(request.getParameter("num"));

				dao.delete(num);

				ArrayList<Post> postList = null;
				postList = PostDao.getInstance().list(1);
				request.setAttribute("postList", postList);

				request.setCharacterEncoding("UTF-8");
				RequestDispatcher rd = request
						.getRequestDispatcher("/search.jsp");
				rd.forward(request, response);

			}else if(action.equals("edit")){
				
				int num = Integer.parseInt(request.getParameter("num"));
				String subject = request.getParameter("subject");
				String content = request.getParameter("content");
				int category = Integer.parseInt(request.getParameter("category"));
				
				Post post = new Post();
				
				post.setId(num);
				post.setTitle(subject);
				post.setContent(content);
				post.setCategory(category);
				System.out.println(post.getContent());
				PostDao.getInstance().editFile(post);
				System.out.println(post.getContent());
				
				request.setCharacterEncoding("UTF-8");
				RequestDispatcher rd = getServletContext()
						.getRequestDispatcher("/search.jsp");
				rd.forward(request, response);	
			}
		}
	}
}
