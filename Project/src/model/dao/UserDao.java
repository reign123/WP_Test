package model.dao;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import jdk.nashorn.internal.ir.RuntimeNode.Request;
import model.dto.User;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import constants.DBConstants;

public class UserDao extends HttpServlet {
	public UserDao() {
		// TODO Auto-generated constructor stub
	}

	private static UserDao instance = new UserDao();

	public static UserDao getInstance() {
		return instance;
	}

	private Connection getConnection() {
		Connection con = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = (Connection) DriverManager.getConnection(DBConstants.URL,
					DBConstants.USER_ID, DBConstants.USER_PASSWORD);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}

	@SuppressWarnings("finally")
	public boolean checkUserId(String userId) {
		Connection con = this.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from " + DBConstants.USER_INFORM
				+ " where id=?";

		boolean flag = false;
		try {
			pstmt = (PreparedStatement) con.prepareStatement(query);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				flag = false;
			} else {
				flag = true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeStream(con, pstmt, rs);
			return flag;
		}
	}

	public boolean loginUser(User user) {
		// TODO Auto-generated method stub
		Connection con = this.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from " + DBConstants.USER_INFORM
				+ " where id=? and pwd=?";

		boolean flag = false;
		try {
			pstmt = (PreparedStatement) con.prepareStatement(query);
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getPwd());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				flag = true;
				user.setUser_name(rs.getString("user_name"));
				user.setJoin_date(rs.getTimestamp("join_date"));
			} else {
				flag = false;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeStream(con, pstmt, rs);
			return flag;
		}
	}

	public void insertMember(User user) {
		Connection con = this.getConnection();
		PreparedStatement pstmt = null;
		String sql = "";

		try {
			con = getConnection();
			sql = "INSERT INTO user" + "(id, pwd, user_name, email) VALUES"
					+ "(?,?,?,?)";
			pstmt = (PreparedStatement) con.prepareStatement(sql);
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getPwd());
			pstmt.setString(3, user.getUser_name());
			pstmt.setString(4, user.getEmail());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeStream(con, pstmt);
		}
	}

	public void editUser(User user) {

		Connection con = this.getConnection();
		PreparedStatement pstmt = null;
		String sql = "";

		try {
			con = getConnection();
			sql = "UPDATE user SET pwd = ?, email = ? WHERE id = ?";

			pstmt = (PreparedStatement) con.prepareStatement(sql);
			pstmt.setString(1, user.getPwd());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getId());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeStream(con, pstmt);
		}

	}

	private void closeStream(Connection con, PreparedStatement pstmt) {
		// TODO Auto-generated method stub
		try {
			con.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void closeStream(Connection con, PreparedStatement pstmt,
			ResultSet rs) {
		// TODO Auto-generated method stub
		try {
			con.close();
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
