package com.shouting.myneu.dao;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.shouting.myneu.pojo.Event;
import com.shouting.myneu.pojo.User;

public class UserDAO extends DAO {

	public User register(User user) throws Exception {
		try {
			User u = get(user.getUseremail());
//			if (u.getUseremail().equals(user.getUseremail())) return null;
			begin();
			getSession().save(user);
			commit();
			return user;
		} catch (HibernateException e) {
			rollback();
			throw new Exception("Sorry! We cannot register new User" + e.getMessage());
		}

	}

	public boolean updateUserState(String email) throws Exception {
		// TODO Auto-generated method stub
		try {
			begin();
			Query q = getSession().createQuery("from User where useremail = :useremail");
			q.setString("useremail", email);
			User user = (User) q.uniqueResult();
			if (user != null) {
				user.setStatus(1);
				getSession().update(user);
				commit();
				return true;
			} else {
				return false;
			}
		} catch (HibernateException e) {
			rollback();
			throw new Exception("Sorry! We cannot update the user for some reason!" + e.getMessage());
		}
	}

	public User get(String userEmail, String password) throws Exception {
		try {
			begin();
			Query q = getSession().createQuery("from User where useremail = :useremail and password = :password");
			q.setString("useremail", userEmail);
			q.setString("password", password);
			User user = (User) q.uniqueResult();
			return user;
		} catch (HibernateException e) {
			rollback();
			throw new Exception("Could not get user " + userEmail, e);
		}
	}

	public User get(String userEmail) {
		try {
			begin();
			Query q = getSession().createQuery("from User where useremail = :useremail");
			q.setString("useremail", userEmail);
			User user = (User) q.uniqueResult();
			return user;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;

	}

	public User getUserByFullName(String fullName) {
		try {
			begin();
			Query q = getSession().createQuery("from User where fullname = :fullname");
			q.setString("fullname", fullName);
			User user = (User) q.uniqueResult();
			return user;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;

	}

	public int updateUserPersonalInformation(User user) throws Exception {
		try {
			begin();
			int id = user.getId();
			String address = user.getAddress();
			String city = user.getCity();
			String firstName = user.getFirstname();
			String lastName= user.getLastname();
			String phone = user.getPhone();
			String state =user.getState();
			Query q = getSession().createQuery("update User set "
					+ "address = :address, "
					+ "city = :city, "
					+ "state = :state, "
					+ "firstname = :firstname, "
					+ "lastname = :lastname, "
					+ "phone = :phone "
					+ "where id = :id");
			q.setInteger("id", id);
			q.setString("address", address);
			q.setString("city", city);
			q.setString("state",state);
			q.setString("firstname",firstName);
			q.setString("lastname",lastName);
			q.setString("phone",phone);
			int modification = q.executeUpdate();
			commit();
			return modification;
		} catch (HibernateException e) {
			rollback();
			throw new Exception("Sorry! We cannot register new User" + e.getMessage());
		}
		
	}
	
	
	public void addUserIntoEvent(Event event, User user) throws Exception {
		try {
			begin();
			user.getParticipatedEvents().add(event);
			event.getParticipants().add(user);
			getSession().save(user);
			commit();
		} catch (HibernateException e) {
			rollback();
			throw new Exception("Sorry! We cannot delete the event" + e.getMessage());
		}
	}

	public void quitEvent(Event event, User user) throws Exception {
		try {
			begin();
			event.getParticipants().remove(user);
			user.getParticipatedEvents().remove(event);
			getSession().save(user);
			commit();
		} catch (HibernateException e) {
			rollback();
			throw new Exception("Sorry! We cannot delete the event" + e.getMessage());
		}
	}
}
