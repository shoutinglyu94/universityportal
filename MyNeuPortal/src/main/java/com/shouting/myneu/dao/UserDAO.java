package com.shouting.myneu.dao;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.shouting.myneu.pojo.User;

public class UserDAO extends DAO{

	public User register(User user) throws Exception {
		try {
			begin();
			getSession().save(user);
			commit();
			return user;
		} catch(HibernateException e) {
			rollback();
			throw new Exception("Sorry! We cannot register new User" + e.getMessage());
		}
		
	}

	public boolean updateUser(String email) throws Exception {
		// TODO Auto-generated method stub
		try {
			begin();
			Query q = getSession().createQuery("from User where useremail = :useremail");
			q.setString("useremail", email);
			User user = (User) q.uniqueResult();
			if(user!=null) {
				user.setStatus(1);
				getSession().update(user);
				commit();
				return true;
			}else {
				return false;
			}
		}catch(HibernateException e) {
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

	public User get(String userEmail){
		try {
			begin();
			Query q = getSession().createQuery("from User where userEmail = :useremail");
			q.setString("useremail", userEmail);
			User user = (User) q.uniqueResult();
			return user;
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
			return null;
		
	}
	
	public User getUserByFullName(String fullName){
		try {
			begin();
			Query q = getSession().createQuery("from User where fullname = :fullname");
			q.setString("fullname", fullName);
			User user = (User) q.uniqueResult();
			return user;
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
			return null;
		
	}
}
