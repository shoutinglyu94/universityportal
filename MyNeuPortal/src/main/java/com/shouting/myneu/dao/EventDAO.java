package com.shouting.myneu.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.shouting.myneu.pojo.Event;



public class EventDAO extends DAO{
	
	public Event create(Event event) throws Exception {
		try {
			begin();
			getSession().save(event);
			commit();
			return event;
		} catch(HibernateException e) {
			rollback();
			throw new Exception("Sorry! We cannot creaet a new event" + e.getMessage());
		}
		
	}
	
	public Event getEventById(int eventId) throws Exception{
		try {
			begin();
			Query q = getSession().createQuery("from Event where id = :eventId");
			q.setInteger("eventId", eventId);
			Event event = (Event) q.uniqueResult();
			return event;
		}catch(HibernateException  e){
			rollback();
			System.out.println("Sorry, we can't find event by id" + e.getMessage());
		}
		return null;
	}
	
	public List<Event> getOnePageEvent(int pageNumber) throws Exception{
		try {
			begin();
			Criteria crit =  getSession().createCriteria(Event.class);
			crit.setFirstResult(1 + (pageNumber-1)*10);
			crit.setMaxResults(10);
			List<Event> onePageResult= (List<Event>)crit.list();
			return onePageResult;
		}catch(HibernateException  e){
			rollback();
			System.out.println("Sorry, we can't find event by id" + e.getMessage());
		}
		return null;
	}
	
	public List<Event> searchEventsByName(String eventTitle){
		try {
			begin();
			Query q = getSession().createQuery("from Event where title = :eventTitle"); 
			q.setString("eventTitle", eventTitle);
			List<Event> searchResult= (List<Event>)q.list();
			return searchResult;
		}catch(HibernateException e) {
			rollback();
			System.out.println(e.getMessage());
		}
		return null;
	}
	
	public int updateEvent(Event event,int id) throws Exception {
		try {
			begin();
			Query q = getSession().createQuery("update Event set "
					+ "address = :address, "
					+ "date = :date, "
					+ "title = :title, "
					+ "description = :description "
					+ "where id = :id");
			q.setInteger("id", id);
			q.setString("address", event.getAddress());
			q.setString("date", event.getDate());
			q.setString("title",event.getTitle());
			q.setString("description",event.getDescription());
			int modification = q.executeUpdate();
			commit();
			return modification;
		} catch (HibernateException e) {
			rollback();
			throw new Exception("Sorry! We cannot update the event." + e.getMessage());
		}
	}

	public int deleteEvent(int id) throws Exception {
		try {
			begin();
			Query q = getSession().createQuery("delete from Event where id = :id)");
			q.setInteger("id", id);
			int modification = q.executeUpdate();
			commit();
			return modification;
		} catch (HibernateException e) {
			rollback();
			throw new Exception("Sorry! We cannot delete the event" + e.getMessage());
		}
	}
	
	
	
}
