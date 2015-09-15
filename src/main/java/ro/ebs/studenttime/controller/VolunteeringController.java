package ro.ebs.studenttime.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ro.ebs.studenttime.api.JobAPI;
import ro.ebs.studenttime.api.VolunteeringAPI;
import ro.ebs.studenttime.service.JobService;
import ro.ebs.studenttime.service.VolunteeringService;

/**
 * Created by Bella on 9/14/2015.
 */
@Controller
public class VolunteeringController {
    @Autowired
    VolunteeringService volunteeringService;

    @RequestMapping(value = "/postVolunteering", method = RequestMethod.POST)
    public String postVolunteering(@ModelAttribute("postVol") VolunteeringAPI volAPI) {
        if(volunteeringService.postVolunteering(volAPI))
            return "successPostVol";
        else return "errorPostVol";
    }

    @RequestMapping(value = "/postVolunteering", method = RequestMethod.GET)
    public String getPostVolunteeringForm() {
        return "postVolunteering";
    }
}
