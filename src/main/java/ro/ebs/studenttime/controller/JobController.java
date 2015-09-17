package ro.ebs.studenttime.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import ro.ebs.studenttime.api.JobAPI;
import ro.ebs.studenttime.api.LoginAPI;
import ro.ebs.studenttime.model.Job;
import ro.ebs.studenttime.service.JobService;
import ro.ebs.studenttime.service.LoginService;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Bella on 9/14/2015.
 */
@Controller
public class JobController {

    @Autowired
    private JobService jobService;


    @RequestMapping(value = "/")
    public String homePage(Model model) {
        model.addAttribute("login", new LoginAPI());
        List<Job> jobList;
        jobList = jobService.getJobs();
        model.addAttribute("jobList", jobList);
        return "index";
    }

    @RequestMapping(value = "/postJob", method = RequestMethod.GET)
    public String getPostJobForm(@ModelAttribute("login") LoginAPI loginAPI, @ModelAttribute("postJob") JobAPI jobAPI, HttpSession session) {
        if (session.getAttribute("loggedUserName") != null)
            return "postJob";
        else return "login";
    }

    @RequestMapping(value = "/postJob", method = RequestMethod.POST)
    public String postJob(@ModelAttribute("postJob") JobAPI jobAPI, HttpSession session) {
        jobAPI.setOwner(new LoginService().getUserByUsername(session.getAttribute("loggedUserName").toString()));
        if (jobService.postJob(jobAPI))
            return "index";
        else return "postJob";
    }

    @RequestMapping(value = "/jobProfile")
    public ModelAndView jobProfile(JobAPI jobAPI) {
        ModelAndView m = new ModelAndView();
        Job job = jobService.getJob(jobAPI.getTitle());
        m.addObject("job", job);
        m.addObject("jobProfile");
        return m;
    }
}
