package com.shouting.myneu.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.shouting.myneu.dao.EventDAO;
import com.shouting.myneu.dao.UserDAO;
import com.shouting.myneu.pojo.Event;
import com.shouting.myneu.pojo.User;

@Controller
public class EventController {

	@Autowired
	@Qualifier("eventDAO")
	EventDAO eventDAO;
	
	@Autowired
	@Qualifier("userDAO")
	UserDAO userDAO;
	
	
	@RequestMapping(value="/discover.htm",method = RequestMethod.GET)
	protected String discoverEvent(HttpServletRequest request,ModelMap map) throws Exception {
		int page = Integer.parseInt(request.getParameter("page"));
		
		try {
			ArrayList<Event> eventList = new ArrayList<Event>();
			eventList = (ArrayList<Event>) eventDAO.getOnePageEvent(page);
			System.out.println(eventList.size());
			map.addAttribute("eventList",eventList);
			map.addAttribute("page",page);
			return "discover";
		}catch(Exception e) {
			e.printStackTrace();
			map.addAttribute("message", "Sorry!Can not go through all events \n Please try again");
			return "error";
		}
		
	}
	@RequestMapping(value="/event/join.htm",method = RequestMethod.GET)
	protected String joinEvent(HttpServletRequest request, Model model,@RequestParam("event_id") int id) {
		HttpSession session = request.getSession();
		User webUser = (User) session.getAttribute("user");
		try {
			User user = userDAO.get(webUser.getUseremail());
			Event event = eventDAO.getEventById(id);
			userDAO.addUserIntoEvent(event, user);
			System.out.println(user.getParticipatedEvents().size());
			model.addAttribute("user",user);
			session.setAttribute("user", user);
			return "user-account";
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "Sorry you cannot join in the event!");
			return "error";
		}
		
		
	}
	
	@RequestMapping(value="/event/quit.htm",method = RequestMethod.GET)
	protected String quitEvent(HttpServletRequest request, Model model,@RequestParam("event_id") int id) {
		HttpSession session = request.getSession();
		User webUser = (User) session.getAttribute("user");
		try {
			User user = userDAO.get(webUser.getUseremail());
			Event event = eventDAO.getEventById(id);
			userDAO.quitEvent(event,user);
			model.addAttribute("user",user);
			session.setAttribute("user", user);
			return "user-account";
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "Sorry! You cannot quit the event \n Please try again");
			return "error";
		}
	}
	
	@RequestMapping(value = "/event/new.htm", method = RequestMethod.GET)
	protected String createNewEvent(HttpServletRequest request) {
		return "event-create";

	}

	@RequestMapping(value = "/event/new.htm", method = RequestMethod.POST)
	protected String saveNewEvent(HttpServletRequest request, Model model) throws Exception {
		// Create a new Event
		String eventTitle = request.getParameter("event_title");
		String eventDescrip = request.getParameter("event_description");
		String eventAddress = request.getParameter("event_address");
		String eventDate = request.getParameter("event_date");
		Event event = new Event();
		event.setTitle(eventTitle);
		event.setAddress(eventAddress);
		event.setDescription(eventDescrip);
		event.setDate(eventDate);	
		HttpSession session = request.getSession();
		User webUser = (User) session.getAttribute("user");
		User user = userDAO.get(webUser.getUseremail());
		user.createEvent(event);
		try {
			eventDAO.create(event);
			model.addAttribute("message", "Your event has been created! \n" + "Here are the details of the event: \n");
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "Sorry your event can't be created! \n Please try again");
			return "error";
		}

	}
	@RequestMapping(value = "/event/details.htm", method = RequestMethod.GET)
	protected String  showEventDetails(HttpServletRequest request,@RequestParam("event_id") int id,ModelMap model) {
		HttpSession session = request.getSession();
		User webUser= (User) session.getAttribute("user");
		User currentUser = userDAO.get(webUser.getUseremail());
		String from = request.getParameter("from");
		try {
			Event event = eventDAO.getEventById(id);
			if(event == null) {
				model.addAttribute("message", "Sorry your event can not be retreived from the database \n Please try again");
				return "error"; 
			}else {
//				System.out.println("Event Founder:" + event.getFounder());
				if(event.getFounder().equals(currentUser)) {
					model.addAttribute("from",from);
					model.addAttribute("event", event);
					model.addAttribute("readonly",false);
					return "event-details";
				}else {
					if(event.getParticipants().contains(currentUser)) {
						model.addAttribute("event_join",false);
					}else {
						model.addAttribute("event_join",true);
					}
					model.addAttribute("from",from);
					model.addAttribute("event", event);
					model.addAttribute("readonly",true);
					return "event-details";
				}
				
			}
		}catch(Exception e) {
			model.addAttribute("message", "Sorry your event can not be retreived from the database \n Please try again");
			return "error";
		}
		
	}
	@RequestMapping(value = "/event/edit.htm", method = RequestMethod.GET)
	protected String  editEventDetails(@RequestParam("event_id") int id,Model model) {
		try {
			Event event = eventDAO.getEventById(id);
			if(event == null) {
				model.addAttribute("message", "Sorry your event can not be retreived from the database \n Please try again");
				return "error"; 
			}else {
				model.addAttribute("event", event);
				return "event-edit";
			}
		}catch(Exception e) {
			model.addAttribute("message", "Sorry your event can not be retreived from the database \n Please try again");
			return "error";
		}
	}
	@RequestMapping(value = "/event/edit.htm", method = RequestMethod.POST)
	protected String editEventDetails(@RequestParam("event_id") int id,HttpServletRequest request, Model model) throws Exception {
		// Create a new Event
		String eventTitle = request.getParameter("event_title");
		String eventDescrip = request.getParameter("event_description");
		String eventAddress = request.getParameter("event_address");
		String eventDate = request.getParameter("event_date");
		Event event = new Event();
		event.setTitle(eventTitle);
		event.setAddress(eventAddress);
		event.setDescription(eventDescrip);
		event.setDate(eventDate);	
		try {
			eventDAO.updateEvent(event,id);
			model.addAttribute("message", "Your event has been created! \n" + "Here are the details of the event: \n");
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "Sorry your event can't be created! \n Please try again");
			return "error";
		}

	}
	
	@RequestMapping(value = "/event/delete.htm", method = RequestMethod.GET)
	protected String deleteEvent(@RequestParam("event_id") int id,HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		try {
			Event event = eventDAO.getEventById(id);
			event.clearParticipants();
			User user = event.getFounder();
			user.deleteEvent(event);
			session.setAttribute("user", user);
			model.addAttribute("user",user);
			int modification = eventDAO.deleteEvent(id);
			return "user-account";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "Sorry your event can't be deleted! \n Please try again");
			return "error";
		}
	}
	@RequestMapping(value="/event/search.htm",method=RequestMethod.GET)
	protected String showSearchResult(HttpServletRequest request,@RequestParam("keyword")String keyword,ModelMap model) {
		return "event-search";
		
	}
}
