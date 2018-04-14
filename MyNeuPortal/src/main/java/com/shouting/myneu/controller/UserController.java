package com.shouting.myneu.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.shouting.myneu.dao.UserDAO;
import com.shouting.myneu.pojo.User;

@Controller
public class UserController {
	
	@RequestMapping(value = "user/register.htm", method = RequestMethod.POST)
	public String registerNewUser(HttpServletRequest request, UserDAO userDao, ModelMap map) {
		HttpSession session = request.getSession();
		String fullname = request.getParameter("userfullname");
		String useremail = request.getParameter("useremail");
		String password = request.getParameter("userpassword");
		
		
		User user = new User();
		user.setUseremail(useremail);
		user.setPassword(password);
		user.setFullname(fullname);
		user.setStatus(0);
		try {
			User u = userDao.register(user);
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
    public String validateEmail(HttpServletRequest request, UserDAO userDao, ModelMap map) {

        // The user will be sent the following link when the use registers
        // This is the format of the email
        // http://hostname:8080/lab11/user/validateemail.htm?email=useremail&key1=<random_number>&key2=<body
        // of the email that when user registers>
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        int key1 = Integer.parseInt(request.getParameter("key1"));
        int key2 = Integer.parseInt(request.getParameter("key2"));
        System.out.println(session.getAttribute("key1") );
        System.out.println(session.getAttribute("key2") );
        
        
        if ((Integer)(session.getAttribute("key1")) == key1 && ((Integer)session.getAttribute("key2"))== key2) {
            try {
                System.out.println("HI________");
                boolean updateStatus = userDao.updateUser(email);
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
	
	@RequestMapping(value = "user/home.htm", method = RequestMethod.GET)
	public String loginUser(HttpServletRequest request,Model model) {
		HttpSession session  = request.getSession();
		if((User)session.getAttribute("user")!=null) return "user-home";
		model.addAttribute("message","User has been expired");
		return "error";
	}
	@RequestMapping(value = "user/home.htm", method = RequestMethod.POST)
    public String loginUser(HttpServletRequest request,UserDAO userDao, ModelMap map) {

        String username = request.getParameter("login_username");
        String password = request.getParameter("login_password");
        try {
            User u = userDao.get(username, password);
            HttpSession session  = request.getSession();
            session.setAttribute("user", u);
            if (u != null && u.getStatus() == 1) {
                return "user-home";
            } else if (u != null && u.getStatus() == 0) {
                map.addAttribute("errorMessage", "Please activate your account to login!");
                return "error";
            } else {
                map.addAttribute("errorMessage", "Invalid username/password!");
                return "error";
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return null;
    }

	
	@RequestMapping(value="user/contact.htm",method = RequestMethod.GET)
	public String editContactInformation() {
		return "user-contact";
	}
	
	@RequestMapping(value="user/savecontact.htm", method= RequestMethod.POST)
	public String showConatactInformation() {
		return "user-home";
	}
	
	public void sendEmail(String useremail, String message) {
        try {
            Email email = new SimpleEmail();
            email.setHostName("smtp.googlemail.com");
            email.setSmtpPort(465);
            email.setAuthenticator(new DefaultAuthenticator("shoutinglyuprogram@gmail.com", "846140499lst"));
            email.setSSLOnConnect(true);
            email.setFrom("no-reply@msis.neu.edu"); // This user email does not                                    // exist
            email.setSubject("Password Reminder");
            email.setMsg(message); // Retrieve email from the DAO and send this
            email.addTo(useremail);
            email.send();
        } catch (EmailException e) {
            System.out.println("Email cannot be sent");
        }
    }
}
