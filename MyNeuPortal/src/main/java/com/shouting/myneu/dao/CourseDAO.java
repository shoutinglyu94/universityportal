package com.shouting.myneu.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.shouting.myneu.pojo.Course;

public class CourseDAO extends DAO{
	public Course createCourse(Course course) throws Exception {
		try {
			begin();
			getSession().save(course);
			commit();
			return course;
		} catch(HibernateException e) {
			rollback();
			throw new Exception("Sorry! We cannot creaet a new Course" + e.getMessage());
		}
		
	}
	
	public Course getEventById(int Courseid) throws Exception{
		try {
			begin();
			Query q = getSession().createQuery("from Course where id = :Courseid");
			q.setInteger("Courseid", Courseid);
			Course Course = (Course) q.uniqueResult();
			return Course;
		}catch(HibernateException  e){
			rollback();
			System.out.println("Sorry, we can't find Course by id" + e.getMessage());
		}
		return null;
	}
	
	public List<Course> getOnePageEvent(int pageNumber) throws Exception{
		try {
			begin();
			Criteria crit =  getSession().createCriteria(Course.class);
			crit.setFirstResult(0 + (pageNumber-1)*10);
			crit.setMaxResults(10);
			List<Course> onePageResult= crit.list();
			return onePageResult;
		}catch(HibernateException  e){
			rollback();
			System.out.println("Sorry, we can't find event by id" + e.getMessage());
		}
		return null;
	}
	
	public List<Course> searchEventsByName(String CourseTitle){
		try {
			begin();
			Query q = getSession().createQuery("from Course where title = :Coursetitle"); 
			q.setString("Coursetitle", CourseTitle);
			List<Course> searchResult= (List<Course>)q.list();
			return searchResult;
		}catch(HibernateException e) {
			rollback();
			System.out.println(e.getMessage());
		}
		return null;
	}
	
	public int updateEvent(Course course,int id) throws Exception {
		try {
			begin();
			Query q = getSession().createQuery("update Course set "
					+ "title = :title, "
					+ "description = :content, "
					+ "capacity = :capacity "
					+ "where id = :id");
			q.setInteger("id", id);
			q.setString("description",course.getDescription());
			q.setString("title",course.getTitle());
			q.setLong("capacity", course.getCapacity());
			int modification = q.executeUpdate();
			commit();
			return modification;
		} catch (HibernateException e) {
			rollback();
			throw new Exception("Sorry! We cannot update the Course." + e.getMessage());
		}
	}

	public int deleteEvent(int id) throws Exception {
		try {
			begin();
			Query q = getSession().createQuery("delete from Course where id = :id)");
			q.setInteger("id", id);
			int modification = q.executeUpdate();
			commit();
			return modification;
		} catch (HibernateException e) {
			rollback();
			throw new Exception("Sorry! We cannot delete the Course" + e.getMessage());
		}
	}
}
