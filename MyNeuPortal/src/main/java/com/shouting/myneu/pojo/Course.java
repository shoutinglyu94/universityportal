package com.shouting.myneu.pojo;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "coursetable")
public class Course {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "course_id", unique = true, nullable = false)
	private int id;
	@Column(name="course_title")
	private String title;
	@Column(name="course_description")
	private String description;
	@ManyToOne
	@JoinColumn(name="user_id")
	private User professor;
	
	@Column(name="course_capacity")
	private int capacity;
	
	@ManyToMany
    @JoinTable (
       name="course_user_table",
       joinColumns = {@JoinColumn(name="course_id", nullable = false, updatable = false)},
       inverseJoinColumns = {@JoinColumn(name="user_id")}
    )
	private Set<User> participants;
	
	public Course(int capacity) {
		this.participants = new HashSet<User>();
		this.capacity = capacity;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public User getProfessor() {
		return professor;
	}

	public void setProfessor(User professor) {
		this.professor = professor;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public Set<User> getParticipants() {
		return participants;
	}

	public void setParticipants(Set<User> participants) {
		this.participants = participants;
	}
	
	
	
	
}
