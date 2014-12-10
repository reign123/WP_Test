package model.dto;

import java.sql.Timestamp;

public class Post {

	private int id;
	private String title;
	private String user_id;
	private String content;
	private Timestamp create_at;
	private int category;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getCreate_at() {
		return create_at;
	}

	public void setCreate_at(Timestamp create_at) {
		this.create_at = create_at;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

}
