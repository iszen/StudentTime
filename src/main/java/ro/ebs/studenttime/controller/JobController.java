package ro.ebs.studenttime.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ro.ebs.studenttime.api.JobAPI;
import ro.ebs.studenttime.service.JobService;

/**
 * Created by Bella on 9/14/2015.
 */
@Controller
public class JobController {

    @Autowired
    JobService jobService;

    @RequestMapping(value = "/postJob", method = RequestMethod.GET)
    public String getPostJobForm(@ModelAttribute("postJob") JobAPI jobAPI) {
        return "postJob";
    }
    @RequestMapping(value = "/postJob", method = RequestMethod.POST)
    public String postJob(@ModelAttribute("postJob") JobAPI jobAPI) {
        if(jobService.postJob(jobAPI))
            return "successPostJob";
        else return "errorPostJob";
    }
}
