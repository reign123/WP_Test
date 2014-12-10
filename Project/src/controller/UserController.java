package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import constants.DBConstants;
import model.dao.UserDao;
import model.dto.User;

import org.json.simple.JSONObject;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/user")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final ServletRequest request = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserController() {
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
		UserDao dao = new UserDao();
		response.setContentType("application/json");
		if (action != null) {
			if (action.equals("requestCheckId")) {
				// id check
				String userId = request.getParameter("userId");
				boolean result = dao.checkUserId(userId);
				String resultString = String.valueOf(result);
				/* System.out.println(resultString); */

				JSONObject jsonObject = new JSONObject();
				jsonObject.put("result", resultString);
				PrintWriter out = response.getWriter();
				out.print(jsonObject);
				out.close();
			} else if (action.equals("registUser")) {
				// get data
				String userId = request.getParameter("id");
				String userPw = request.getParameter("pwd");
				String userName = request.getParameter("user_name");
				String email = request.getParameter("email");

				// user
				User user = new User();
				user.setId(userId);
				user.setPwd(userPw);
				user.setUser_name(userName);
				user.setEmail(email);

				// insert
				dao.insertMember(user);
				
				request.setCharacterEncoding("UTF-8");
				RequestDispatcher rd = getServletContext()
						.getRequestDispatcher("/index.jsp");
				rd.forward(request, response);
			} else if (action.equals("login")) {

				String userId = request.getParameter("id");
				String userPw = request.getParameter("pwd");

				User user = new User();

				user.setId(userId);
				user.setPwd(userPw);

				// insert
				boolean flag = dao.loginUser(user);

				RequestDispatcher view = null;

				if (flag == true) {
					// login routine
					request.getSession().setAttribute("user", user);
					view = request.getRequestDispatcher("/loginpage.jsp");
				} else {
					// login fail
					view = request.getRequestDispatcher("/loginPro.jsp");
				}
				view.forward(request, response);
			} else if (action.equals("editUser")) {
				
				String userId = request.getParameter("id");
				String userPw = request.getParameter("pwd");
				String userName = request.getParameter("user_name");
				String email = request.getParameter("email");

				User user = new User();
				
				user.setId(userId);
				user.setPwd(userPw);
				user.setUser_name(userName);
				user.setEmail(email);
				
				// edit
				
				dao.editUser(user);
				
				request.setCharacterEncoding("UTF-8");
				RequestDispatcher rd = getServletContext()
						.getRequestDispatcher("/loginpage.jsp");
				rd.forward(request, response);
			}

		}
	}
}
