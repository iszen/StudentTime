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
import ro.ebs.studenttime.api.SearchAPI;
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
    public String homePage(@ModelAttribute("login") LoginAPI loginAPI, Model model, @ModelAttribute("search") SearchAPI search) {
        model.addAttribute("login", new LoginAPI());
        showJobs(model, search);
        showNotices(model, search);
        showVolunteers(model, search);
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

    public ModelAndView jobProfile(@RequestParam("jobid") int id, JobAPI jobAPI, @ModelAttribute("login") LoginAPI loginAPI, Model model) {
        System.out.println(id);


        ModelAndView m = new ModelAndView();
        Job job = jobService.getJob(id);
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
    public String getEmailForm(@RequestParam("jobProfileId") String jobProfileId, @ModelAttribute("login") LoginAPI loginAPI, @ModelAttribute("postJob") JobAPI jobAPI, @ModelAttribute("email") EmailAPI emailAPI, HttpSession session, Model model) {
        if (session.getAttribute("loggedUserName") != null) {
            Job job = jobService.returnJob(jobProfileId);
            model.addAttribute("jobProfileId", job);
            return "email";
        }
        return "login";

    }

    @RequestMapping(value = "/email", method = RequestMethod.POST)
    public String sendEmail(@ModelAttribute("email") EmailAPI emailAPI, HttpSession session, @ModelAttribute JobAPI jobAPI, Model model) throws MessagingException {
        jobAPI.setOwner(loginService.getUserByUsername(session.getAttribute("loggedUserName").toString()));
        emailAPI.setName(jobAPI.getOwner().getUsername().toString());
        emailAPI.setSubject("Studenttime Registration");
        emailAPI.setTo(jobAPI.getOwner().getEmail().toString());
        if (emailService.sendEmail(emailAPI)) {
            jobAPI.setNumberRequiredPersons(jobAPI.getNumberRequiredPersons() - 1);
            System.out.println(emailAPI.toString());
            return "email";
        }
        return "error";

    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }

    public void showJobs(Model model, SearchAPI search) {
        List<Job> jobList;
        if (search == null || search.getSearchJob() == null || search.getSearchJob().isEmpty())
            jobList = jobService.getJobs();
        else
            jobList = jobService.getMatchingJobs(search.getSearchJob());
        for (Job job : jobList) {
            if (job.getImage() != null) {
                String attribute = "image" + job.getId().toString();
                String encodedImage = new String(org.apache.commons.codec.binary.Base64.encodeBase64(jobService.getJob(job.getId()).getImage()));
                model.addAttribute(attribute, encodedImage);
            }
        }
        model.addAttribute("jobList", jobList);
    }


    public void showVolunteers(Model model, SearchAPI search) {
        List<Volunteering> volunteerList;
        if (search == null || search.getSearchVol() == null || search.getSearchVol().isEmpty())
            volunteerList = volService.getVolunteers();
        else
            volunteerList = volService.getMatchingVolunteers(search.getSearchVol());

        for (Volunteering vol : volunteerList) {
            if (vol.getImage() != null) {
                String attribute = "image" + vol.getId().toString();
                String encodedImage = new String(org.apache.commons.codec.binary.Base64.encodeBase64(volService.getVolunteering(vol.getId()).getImage()));
                model.addAttribute(attribute, encodedImage);
            }
        }
        model.addAttribute("volunteerList", volunteerList);
    }

    public void showNotices(Model model, SearchAPI search) {
        List<Notice> noticeList;
        if (search == null || search.getSearchNotice() == null || search.getSearchNotice().isEmpty())
            noticeList = noticeService.getNotices();
        else
            noticeList = noticeService.getMatchingNotices(search.getSearchNotice());
        model.addAttribute("noticeList", noticeList);
    }
}
