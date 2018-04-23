package com.shouting.myneu.pojo;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "usertable")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "userid", unique = true, nullable = false)
	private int id;
	@Column(name = "user_firstname")
	private String firstname;
	@Column(name = "user_lastname")
	private String lastname;
	@Column(name = "user_phone")
	private String phone;
	@Column(name = "user_address")
	private String address;
	@Column(name = "user_city")
	private String city;
	@Column(name = "user_state")
	private String state;
	@Column(name = "user_email")
	private String useremail;
	@Column(name = "user_password")
	private String password;
	@Column(name = "user_status")	
	private int status;

	@OneToMany(mappedBy = "founder", cascade = CascadeType.ALL, orphanRemoval = true)
	private Set<Event> createdEvents;

	@ManyToMany(mappedBy = "participants")
	private Set<Event> participatedEvents;

	public User() {
		this.createdEvents = new HashSet<Event>();
		this.participatedEvents = new HashSet<Event>();
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUseremail() {
		return useremail;
	}

	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public void createEvent(Event event) {
		if(event==null) return;
		createdEvents.add(event);
		event.setFounder(this);
	}

	public void deleteEvent(Event event) {
		if (event == null) return;
		createdEvents.remove(event);
	}
	
	public void participateEvent(Event event) {
		if(event ==null) return;
		this.participatedEvents.add(event);
		event.getParticipants().add(this);
	}
	
	public void quitEvent(Event event) {
		if(event ==null) return;
		this.participatedEvents.remove(event);
		event.getParticipants().remove(this);
	}

	public Set<Event> getCreatedEvents() {
		return createdEvents;
	}

	public void setCreatedEvents(Set<Event> createdEvents) {
		this.createdEvents = createdEvents;
	}

	public Set<Event> getParticipatedEvents() {
		return participatedEvents;
	}

	public void setParticipatedEvents(Set<Event> participatedEvents) {
		this.participatedEvents = participatedEvents;
	}
	
	

}
