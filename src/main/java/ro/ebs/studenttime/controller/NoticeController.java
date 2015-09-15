package ro.ebs.studenttime.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ro.ebs.studenttime.api.NoticeAPI;
import ro.ebs.studenttime.api.VolunteeringAPI;
import ro.ebs.studenttime.service.NoticeService;
import ro.ebs.studenttime.service.VolunteeringService;

/**
 * Created by Bella on 9/14/2015.
 */
@Controller
public class NoticeController {
    @Autowired
    NoticeService noticeService;

    @RequestMapping(value = "/postNotice", method = RequestMethod.POST)
    public String postNotice(@ModelAttribute("postNotice") NoticeAPI noticeAPI) {
        if(noticeService.postNotice(noticeAPI))
            return "successPostNotice";
        else return "errorPostNotice";
    }

    @RequestMapping(value = "/postNotice", method = RequestMethod.GET)
    public String getPostNoticeForm() {
        return "postNotice";
    }
}
