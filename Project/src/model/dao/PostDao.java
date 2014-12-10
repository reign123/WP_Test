package model.dao;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;

import model.dto.Post;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import constants.DBConstants;

public class PostDao {
	public PostDao() {
		// TODO Auto-generated constructor stub
	}

	private static PostDao instance = new PostDao();

	public static PostDao getInstance() {
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

	private int getStartPage(int pageNumber) {
		return (pageNumber - 1) * DBConstants.PAGE_CUT;
	}

	public void write(Post post) {
		Connection con = this.getConnection();
		PreparedStatement pstmt = null;
		String sql = "";

		try {
			con = getConnection();
			sql = "INSERT INTO posts"
					+ "(title, user_id, content, category) VALUES"
					+ "(?,?,?,?)";
			pstmt = (PreparedStatement) con.prepareStatement(sql);

			pstmt.setString(1, post.getTitle());
			pstmt.setString(2, post.getUser_id());
			pstmt.setString(3, post.getContent());
			pstmt.setInt(4, post.getCategory());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeStream(con, pstmt);
		}

	}

	public ArrayList<Post> list(int pageNumber) {
		// TODO Auto-generated method stub
		Connection con = this.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from " + DBConstants.POST_INFORM
				+ " order by id desc limit " + this.getStartPage(pageNumber)
				+ ", " + DBConstants.PAGE_CUT;
		ArrayList<Post> postList = new ArrayList<Post>();
		try {
			pstmt = (PreparedStatement) con.prepareStatement(query);
			// pstmt.setInt(1, pageNumber);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Post post = new Post();
				post.setId(rs.getInt("id"));
				post.setTitle(rs.getString("title"));
				post.setUser_id(rs.getString("user_id"));
				post.setContent(rs.getString("content"));
				post.setCreate_at(rs.getTimestamp("create_at"));
				post.setCategory(rs.getInt("category"));
				postList.add(post);
			}

			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeStream(con, pstmt, rs);
		}
		return postList;
	}

	public ArrayList<Post> list(int category, int pageNumber) {
		Connection con = this.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from " + DBConstants.POST_INFORM 
				+ " where category=?";
		ArrayList<Post> postList = new ArrayList<Post>();
		try {
			pstmt = (PreparedStatement) con.prepareStatement(query);
			pstmt.setInt(1, category);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Post post = new Post();
				post.setId(rs.getInt("id"));
				post.setTitle(rs.getString("title"));
				post.setUser_id(rs.getString("user_id"));
				post.setContent(rs.getString("content"));
				post.setCreate_at(rs.getTimestamp("create_at"));
				post.setCategory(category);
				postList.add(post);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeStream(con, pstmt,rs);
		}
		return postList;
	}

	public Post view(int id) {
		Connection con = this.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from " + DBConstants.POST_INFORM
				+ " where id=?";
		
		Post post = new Post();
		try {
			pstmt = (PreparedStatement) con.prepareStatement(query);
			pstmt.setInt(1, id);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				post.setId(id);
				post.setTitle(rs.getString("title"));
				post.setUser_id(rs.getString("user_id"));
				post.setContent(rs.getString("content"));
				post.setCreate_at(rs.getTimestamp("create_at"));
				post.setCategory(rs.getInt("category"));

			}
			// pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeStream(con, pstmt, rs);
		}
		return post;
	}
	
	public void delete(int num) {
		Connection con = this.getConnection();
		PreparedStatement pstmt = null;
		String query = null;
		query = "delete from posts where id=?";
		
		try {

			pstmt = (PreparedStatement) con.prepareStatement(query);

			pstmt.setInt(1, num);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeStream(con, pstmt);
		}
	}
	
/*	public Post search(String data){
		
	}
	*/
	public void editFile(Post post){
		Connection con = this.getConnection();
		PreparedStatement pstmt = null;
		String sql = "";
		try{
			con = getConnection();
			sql = "UPDATE posts SET title =?, content =?, category =? where id =?";
			
			pstmt = (PreparedStatement) con.prepareStatement(sql);
			
			pstmt.setInt(1, post.getId());
			pstmt.setString(2, post.getTitle());
			pstmt.setString(3, post.getContent());
			pstmt.setInt(4, post.getCategory());
			
			pstmt.executeUpdate();
						
		}catch (Exception e){
			e.printStackTrace();
		}finally{
			closeStream(con,pstmt);
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
