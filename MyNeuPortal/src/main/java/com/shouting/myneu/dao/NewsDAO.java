package com.shouting.myneu.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;


import com.shouting.myneu.pojo.News;

public class NewsDAO extends DAO{
	public News createNews(News news) throws Exception {
		try {
			begin();
			getSession().save(news);
			commit();
			return news;
		} catch(HibernateException e) {
			rollback();
			throw new Exception("Sorry! We cannot creaet a new news" + e.getMessage());
		}
		
	}
	
	public News getEventById(int newsid) throws Exception{
		try {
			begin();
			Query q = getSession().createQuery("from News where id = :newsid");
			q.setInteger("newsid", newsid);
			News news = (News) q.uniqueResult();
			return news;
		}catch(HibernateException  e){
			rollback();
			System.out.println("Sorry, we can't find news by id" + e.getMessage());
		}
		return null;
	}
	
	public List<News> getOnePageEvent(int pageNumber) throws Exception{
		try {
			begin();
			Criteria crit =  getSession().createCriteria(News.class);
			crit.setFirstResult(0 + (pageNumber-1)*10);
			crit.setMaxResults(10);
			List<News> onePageResult= crit.list();
			return onePageResult;
		}catch(HibernateException  e){
			rollback();
			System.out.println("Sorry, we can't find event by id" + e.getMessage());
		}
		return null;
	}
	
	public List<News> searchEventsByName(String newsTitle){
		try {
			begin();
			Query q = getSession().createQuery("from News where title = :newstitle"); 
			q.setString("newstitle", newsTitle);
			List<News> searchResult= (List<News>)q.list();
			return searchResult;
		}catch(HibernateException e) {
			rollback();
			System.out.println(e.getMessage());
		}
		return null;
	}
	
	public int updateEvent(News news,int id) throws Exception {
		try {
			begin();
			Query q = getSession().createQuery("update News set "
					+ "title = :title, "
					+ "content = :content, "
					+ "like = :like "
					+ "where id = :id");
			q.setInteger("id", id);
			q.setString("content",news.getContent());
			q.setString("title",news.getTitle());
			q.setLong("like", news.getLike());
			int modification = q.executeUpdate();
			commit();
			return modification;
		} catch (HibernateException e) {
			rollback();
			throw new Exception("Sorry! We cannot update the news." + e.getMessage());
		}
	}

	public int deleteEvent(int id) throws Exception {
		try {
			begin();
			Query q = getSession().createQuery("delete from News where id = :id)");
			q.setInteger("id", id);
			int modification = q.executeUpdate();
			commit();
			return modification;
		} catch (HibernateException e) {
			rollback();
			throw new Exception("Sorry! We cannot delete the News" + e.getMessage());
		}
	}
}
