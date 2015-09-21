package ro.ebs.studenttime.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import ro.ebs.studenttime.api.*;
import ro.ebs.studenttime.model.Job;
import ro.ebs.studenttime.model.User;
import ro.ebs.studenttime.service.*;

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
    @Autowired
    private JobService jobService;
    @Autowired
    private LoginService loginService;
    @Autowired
    private VolunteeringService volService;
    @Autowired
    private NoticeService noticeService;
    @Autowired
    private SignInService signInService;

    @RequestMapping(value = "/", method = RequestMethod.POST)
    public String returnHome(@ModelAttribute("signin") SigninAPI signinAPI, @ModelAttribute("login") LoginAPI login, @ModelAttribute("logout") String logout, HttpSession session, Model model) {
        if(signinAPI.getFirstname()!=null) {
            session.setAttribute("loggedUserName", signinAPI.getUsername());
            if (!signInService.performSignIn(signinAPI)) {
                return "errorSignin";
            }
        }else if (login.getPassword() != null && login.getUsername() != null) {
            if (service.performLogin(login)) {
                session.setAttribute("loggedUserName", login.getUsername());
            } else return "errorLogin";
        }else{
            session.invalidate();
        }
        showJobs(model);
        return "index";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String getLoginForm() {
        return "login";
    }

    public void showJobs(Model model) {
        List<Job> jobList;
        jobList = jobService.getJobs();
        model.addAttribute("jobList", jobList);
    }
}
