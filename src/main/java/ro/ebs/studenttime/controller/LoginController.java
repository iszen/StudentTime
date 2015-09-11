package ro.ebs.studenttime.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ro.ebs.studenttime.api.LoginAPI;
import ro.ebs.studenttime.service.LoginService;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Izabella on 9/8/2015.
 */
@Controller
public class LoginController {

    @Autowired
    private LoginService service;

    @RequestMapping(value = "/")
    public String homePage(Model model) {
        model.addAttribute("login", new LoginAPI());
        System.out.println("Login hihi");
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@ModelAttribute("login") LoginAPI loginAPI) {
        if(service.performLogin(loginAPI))
            return "successLogin";
        else return "errorLogin";
    }
}
