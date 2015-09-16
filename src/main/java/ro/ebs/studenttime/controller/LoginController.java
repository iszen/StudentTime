package ro.ebs.studenttime.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import ro.ebs.studenttime.api.LoginAPI;
import ro.ebs.studenttime.model.Job;
import ro.ebs.studenttime.model.User;
import ro.ebs.studenttime.service.JobService;
import ro.ebs.studenttime.service.LoginService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Izabella on 9/8/2015.
 */
@Controller
public class LoginController {

    @Autowired
    private LoginService service;


    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String returnHome() {
       return "index";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@ModelAttribute("login") LoginAPI loginAPI, HttpSession session) {
        if (service.performLogin(loginAPI)) {
            session.setAttribute("loggedUserName", loginAPI.getUsername());
            return "index";
        }
        else return "errorLogin";
    }


}
