package com.shouting.myneu.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shouting.myneu.dao.EventDAO;
import com.shouting.myneu.pojo.Event;
import com.shouting.myneu.pojo.User;

@Controller
public class EventController {

	@Autowired
	@Qualifier("eventDAO")
	EventDAO eventDAO;

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
		User user = (User) session.getAttribute("user");
		event.setFounder(user);
		try {
			//eventDAO.create(event);
			model.addAttribute("message", "Your event has been created! \n" + "Here are the details of the event: \n");
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "Sorry your event can't be created! \n Please try again");
			return "error";
		}

	}
}
