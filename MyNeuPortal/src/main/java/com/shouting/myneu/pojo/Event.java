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
import javax.persistence.Transient;

@Entity
@Table(name="eventtable")
public class Event {
	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="event_id",unique=true,nullable=false)
	private int id;
	@Column(name="event_title")
	private String title;
	@Column(name="event_descript")
	private String description;
	@Column(name="event_date")
	private String date;
	@Column(name="event_address")
	private String address;
	@Transient
	private boolean isFree;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User founder;
	
	@ManyToMany
    @JoinTable (
       name="event_user_table",
       joinColumns = {@JoinColumn(name="event_id", nullable = false, updatable = false)},
       inverseJoinColumns = {@JoinColumn(name="user_id")}
    )
	private Set<User> participants = new HashSet<User>();

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


	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public boolean isFree() {
		return isFree;
	}

	public void setFree(boolean isFree) {
		this.isFree = isFree;
	}

	public User getFounder() {
		return founder;
	}

	public void setFounder(User founder) {
		this.founder = founder;
	}

	public Set<User> getParticipants() {
		return participants;
	}

	public void setParticipants(Set<User> participants) {
		this.participants = participants;
	}
	
	
}
