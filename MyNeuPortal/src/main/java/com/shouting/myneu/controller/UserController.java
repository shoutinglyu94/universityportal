package com.shouting.myneu.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.shouting.myneu.dao.UserDAO;
import com.shouting.myneu.pojo.User;

@Controller
public class UserController {

	@Autowired
	@Qualifier("userDAO")
	UserDAO userDao;

	@RequestMapping(value = "/home.htm", method = RequestMethod.GET)
	public String loginUser(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		if ((User) session.getAttribute("user") != null)
			return "user-home";
		else {
			model.addAttribute("message", "User has been expired");
			return "index";
		}
	}

	@RequestMapping(value = "/home.htm", method = RequestMethod.POST)
	public String loginUser(HttpServletRequest request, ModelMap map) {

		String username = request.getParameter("login_username");
		String password = request.getParameter("login_password");
		try {
			User u = userDao.get(username, password);
			if (u == null) {
				map.addAttribute("errorMessage", "Invalid username/password!");
				return "error";
			}
			System.out.println(u.getStatus());
			HttpSession session = request.getSession();
			session.setAttribute("user", u);
			if (u != null && u.getStatus() == 1) {
				return "user-home";
			} else if (u != null && u.getStatus() == 0) {
				map.addAttribute("errorMessage", "Please activate your account to login!");
				return "error";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	@RequestMapping(value = "/logout.htm", method = RequestMethod.GET)
	protected String logoutUser(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "index";
	}

	@RequestMapping(value = "user/register.htm", method = RequestMethod.POST)
	public String registerNewUser(HttpServletRequest request, ModelMap map) {
		HttpSession session = request.getSession();
		String useremail = request.getParameter("useremail");
		String password = request.getParameter("userpassword");
		String role = request.getParameter("send_updates");
		User user = new User();
		if (role != null)
			user.setRole("professor");
		else
			user.setRole("student");
		user.setUseremail(useremail);
		user.setPassword(password);
		user.setStatus(0);

		try {
			User u = userDao.register(user);
			if (u == null) {
				map.addAttribute("message", "There is a user who use this email, please choose another one.");
				return "error";
			}
			Random rand = new Random();
			int randomNum1 = rand.nextInt(5000000);
			int randomNum2 = rand.nextInt(5000000);
			try {
				String str = "http://localhost:8080/myneu/user/validateemail.htm?email=" + useremail + "&key1="
						+ randomNum1 + "&key2=" + randomNum2;
				session.setAttribute("key1", randomNum1);
				session.setAttribute("key2", randomNum2);
				sendEmail(useremail, "Click on this link to activate your account : " + str);
			} catch (Exception e) {
				System.out.println("Email cannot be sent");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "user-created";
	}

	@RequestMapping(value = "user/validateemail.htm", method = RequestMethod.GET)
	public String validateEmail(HttpServletRequest request, ModelMap map) {
		HttpSession session = request.getSession();
		String email = request.getParameter("email");
		int key1 = Integer.parseInt(request.getParameter("key1"));
		int key2 = Integer.parseInt(request.getParameter("key2"));
		System.out.println(session.getAttribute("key1"));
		System.out.println(session.getAttribute("key2"));

		if ((Integer) (session.getAttribute("key1")) == key1 && ((Integer) session.getAttribute("key2")) == key2) {
			try {
				System.out.println("HI________");
				boolean updateStatus = userDao.updateUserState(email);
				if (updateStatus) {
					return "user-home";
				} else {
					return "error";
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			map.addAttribute("errorMessage", "Link expired , generate new link");
			map.addAttribute("resendLink", true);
			return "error";
		}
		return "index";
	}

	@RequestMapping(value = "user/account.htm", method = RequestMethod.GET)
	public String showPersonalInformation(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		User webUser = (User) session.getAttribute("user");
		User user = userDao.get(webUser.getUseremail());
		model.addAttribute("user", user);
		return "user-account";
	}

	@RequestMapping(value = "user/personalinformation/edit.htm", method = RequestMethod.GET)
	public String editPersonalInformation() {
		return "user-personalinformation-edit";
	}

	@RequestMapping(value = "user/personalinformation/savecontact.htm", method = RequestMethod.POST)
	public String showConatactInformation(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		User webUser = (User) session.getAttribute("user");
		User user = userDao.get(webUser.getUseremail());
		user.setFirstname(request.getParameter("first_name"));
		user.setLastname(request.getParameter("last_name"));
		user.setAddress(request.getParameter("address"));
		user.setCity(request.getParameter("city"));
		user.setState(request.getParameter("state"));
		user.setPhone(request.getParameter("phone"));
		int modification = 0;
		try {
			modification = userDao.updateUserPersonalInformation(user);
			model.addAttribute("message", "Successfully update the infomation!");
			if (modification == 1)
				return "success";
			else
				return "error";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}

	@RequestMapping(value = "/filter-error", method = RequestMethod.GET)
	public String sqlError() {
		return "filter-error";
	}

	public void sendEmail(String useremail, String message) {
		try {
			Email email = new SimpleEmail();
			email.setHostName("smtp.googlemail.com");
			email.setSmtpPort(465);
			email.setAuthenticator(new DefaultAuthenticator("shoutinglyuprogram@gmail.com", "846140499lst"));
			email.setSSLOnConnect(true);
			email.setFrom("no-reply@msis.neu.edu"); // This user email does not // exist
			email.setSubject("Password Reminder");
			email.setMsg(message); // Retrieve email from the DAO and send this
			email.addTo(useremail);
			email.send();
		} catch (EmailException e) {
			System.out.println("Email cannot be sent");
		}
	}

}
