package ro.ebs.studenttime.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import ro.ebs.studenttime.api.JobAPI;
import ro.ebs.studenttime.api.LoginAPI;
import ro.ebs.studenttime.api.VolunteeringAPI;
import ro.ebs.studenttime.model.Volunteering;
import ro.ebs.studenttime.service.JobService;
import ro.ebs.studenttime.service.LoginService;
import ro.ebs.studenttime.service.VolunteeringService;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Bella on 9/14/2015.
 */
@Controller
public class VolunteeringController {
    @Autowired
    VolunteeringService volunteeringService;
    @Autowired
    private LoginService loginService;

    @RequestMapping(value = "/postVolunteering", method = RequestMethod.POST)
    public String postVolunteering(@ModelAttribute("postVolunteering") VolunteeringAPI volAPI, HttpSession session) {
        volAPI.setOwner(loginService.getUserByUsername(session.getAttribute("loggedUserName").toString()));
        if (volunteeringService.postVolunteering(volAPI))
            return "postVolunteering";
        else return "error";
    }

    @RequestMapping(value = "/postVolunteering", method = RequestMethod.GET)
    public String getPostVolunteeringForm(@ModelAttribute("login") LoginAPI loginAPI, @ModelAttribute("postVolunteering") VolunteeringAPI volAPI, HttpSession session) {
        if (session.getAttribute("loggedUserName") != null)
            return "postVolunteering";
        else return "login";
    }

    @RequestMapping(value = "/volunteerProfile", method = RequestMethod.GET)
    public ModelAndView jobProfile(@RequestParam("volunteerTitle") String title, VolunteeringAPI volunteeringAPI, @ModelAttribute("login") LoginAPI loginAPI, Model model) {
        ModelAndView m = new ModelAndView();
        Volunteering vol = volunteeringService.returnVolunteer(title);
        m.addObject("volunteer", vol);
        m.addObject("volunteerProfile");
        if (vol.getImage() != null) {
            String attribute = "image" + vol.getId().toString();
            String encodedImage = new String(org.apache.commons.codec.binary.Base64.encodeBase64(volunteeringService.getVolunteering(vol.getId()).getImage()));
            model.addAttribute(attribute, encodedImage);
        }
        return m;
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }

}
