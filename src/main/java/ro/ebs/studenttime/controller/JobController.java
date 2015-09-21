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
import ro.ebs.studenttime.model.Job;
import ro.ebs.studenttime.model.Notice;
import ro.ebs.studenttime.model.Volunteering;
import ro.ebs.studenttime.service.JobService;
import ro.ebs.studenttime.service.LoginService;
import ro.ebs.studenttime.service.NoticeService;
import ro.ebs.studenttime.service.VolunteeringService;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Bella on 9/14/2015.
 */
@Controller
public class JobController {

    @Autowired
    private JobService jobService;
    @Autowired
    private LoginService loginService;
    @Autowired
    private VolunteeringService volService;
    @Autowired
    private NoticeService noticeService;


    @RequestMapping(value = "/", method=RequestMethod.GET)
    public String homePage(@ModelAttribute("login") LoginAPI loginAPI,Model model) {
        model.addAttribute("login", new LoginAPI());
        showJobs(model);
        showNotices(model);
        showVolunteers(model);
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
        jobAPI.setOwner(loginService.getUserByUsername(session.getAttribute("loggedUserName").toString()));
        if (jobService.postJob(jobAPI))
            return "postJob";
        else return "error";
    }

    @RequestMapping(value = "/jobProfile", method = RequestMethod.GET)
    public ModelAndView jobProfile(@RequestParam("jobtitle") String title, JobAPI jobAPI, @ModelAttribute("login") LoginAPI loginAPI) {
        System.out.println(title);
        ModelAndView m = new ModelAndView();
        Job job = jobService.returnJob(title);
        m.addObject("job", job);
        m.addObject("jobProfile");

        return m;
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }

    public void showJobs(Model model) {
        List<Job> jobList;
        jobList = jobService.getJobs();
        model.addAttribute("jobList", jobList);
    }


    public void showVolunteers(Model model){
        List<Volunteering> volunteerList= volService.getVolunteers();
        model.addAttribute("volunteerList", volunteerList);
    }

    public void showNotices(Model model) {
        List<Notice> noticeList = noticeService.getNotices();
        model.addAttribute("noticeList", noticeList);
    }
}
