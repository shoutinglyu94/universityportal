package com.shouting.myneu.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "newstable")
public class News {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "news_id", unique = true, nullable = false)
	private int id;
	@Column(name="news_title")
	private String title;
	@Column(name="news_content")
	private String content;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User editor;
	
	@Column(name="news_like")
	private long like;
	
	
	public News() {
		
	}


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


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public User getEditor() {
		return editor;
	}


	public void setEditor(User editor) {
		this.editor = editor;
	}


	public long getLike() {
		return like;
	}


	public void setLike(long like) {
		this.like = like;
	}
	
	
}
