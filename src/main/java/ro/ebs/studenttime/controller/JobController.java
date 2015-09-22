package ro.ebs.studenttime.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import ro.ebs.studenttime.api.EmailAPI;
import ro.ebs.studenttime.api.JobAPI;
import ro.ebs.studenttime.api.LoginAPI;
import ro.ebs.studenttime.model.Job;
import ro.ebs.studenttime.model.Notice;
import ro.ebs.studenttime.model.Volunteering;
import ro.ebs.studenttime.service.*;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Base64;
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
    @Autowired
    private EmailService emailService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String homePage(@ModelAttribute("login") LoginAPI loginAPI, Model model) {
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
    public ModelAndView jobProfile(@RequestParam("jobtitle") String title, JobAPI jobAPI, @ModelAttribute("login") LoginAPI loginAPI, Model model) {
        System.out.println(title);
        ModelAndView m = new ModelAndView();
        Job job = jobService.returnJob(title);
        m.addObject("job", job);
        m.addObject("jobProfile");
        if (job.getImage() != null) {
            String attribute = "image" + job.getId().toString();
            String encodedImage = new String(org.apache.commons.codec.binary.Base64.encodeBase64(jobService.getJob(job.getId()).getImage()));
            model.addAttribute(attribute, encodedImage);
        }
        return m;
    }

    @RequestMapping(value = "/email", method = RequestMethod.GET)
    public String getEmailForm(@ModelAttribute("login") LoginAPI loginAPI, @ModelAttribute("postJob") JobAPI jobAPI, @ModelAttribute("email") EmailAPI emailAPI, HttpSession session) {
        if (session.getAttribute("loggedUserName") != null)
            return "email";
        return "login";

    }

    @RequestMapping(value = "/email", method = RequestMethod.POST)
    public String sendEmail(@ModelAttribute("email") EmailAPI emailAPI, HttpSession session, @ModelAttribute LoginAPI loginAPI) throws MessagingException {
        emailAPI.setName(loginAPI.getUsername());
        if (emailService.sendEmail(emailAPI)) {
            System.out.println(emailAPI.toString());
            return "successSentEmail";
        }
        return "errorSentEmail";

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
        for (Job job : jobList) {
            if (job.getImage() != null) {
                String attribute = "image" + job.getId().toString();
                String encodedImage = new String(org.apache.commons.codec.binary.Base64.encodeBase64(jobService.getJob(job.getId()).getImage()));
                model.addAttribute(attribute, encodedImage);
            }
        }
        model.addAttribute("jobList", jobList);
    }


    public void showVolunteers(Model model) {
        List<Volunteering> volunteerList = volService.getVolunteers();
        for (Volunteering vol : volunteerList) {
            if (vol.getImage() != null) {
                String attribute = "image" + vol.getId().toString();
                String encodedImage = new String(org.apache.commons.codec.binary.Base64.encodeBase64(volService.getVolunteering(vol.getId()).getImage()));
                System.out.println(encodedImage);
                model.addAttribute(attribute, encodedImage);
            }
        }
        model.addAttribute("volunteerList", volunteerList);
    }

    public void showNotices(Model model) {
        List<Notice> noticeList = noticeService.getNotices();
        model.addAttribute("noticeList", noticeList);
    }
}
