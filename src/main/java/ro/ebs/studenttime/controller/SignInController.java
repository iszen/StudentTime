package ro.ebs.studenttime.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ro.ebs.studenttime.api.LoginAPI;
import ro.ebs.studenttime.api.SigninAPI;
import ro.ebs.studenttime.service.SignInService;

/**
 * Created by Dana on 9/14/2015.
 */
@Controller
public class SignInController {

    @Autowired
    private SignInService service;

    @RequestMapping(value = "/signin", method = RequestMethod.GET)
    public String signinPage(Model model){
        model.addAttribute("signin", new SigninAPI());
        return "signIn";
    }

    @RequestMapping(value = "/signin", method = RequestMethod.POST)
    public String signin(@ModelAttribute("signin")SigninAPI signinAPI) {
        if(service.performSignIn(signinAPI))
            return "index";
        else return "errorSignin";
    }
}
