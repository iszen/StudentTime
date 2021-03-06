package ro.ebs.studenttime.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import ro.ebs.studenttime.api.LoginAPI;
import ro.ebs.studenttime.api.NoticeAPI;
import ro.ebs.studenttime.api.VolunteeringAPI;
import ro.ebs.studenttime.model.Notice;
import ro.ebs.studenttime.service.LoginService;
import ro.ebs.studenttime.service.NoticeService;
import ro.ebs.studenttime.service.VolunteeringService;

import javax.servlet.http.HttpSession;

/**
 * Created by Bella on 9/14/2015.
 */
@Controller
public class NoticeController {
    @Autowired
    NoticeService noticeService;
    @Autowired
    LoginService logService;

    @RequestMapping(value = "/postNotice", method = RequestMethod.POST)
    public String postNotice(@ModelAttribute("postNotice") NoticeAPI noticeAPI, HttpSession session) {
        noticeAPI.setOwner(logService.getUserByUsername((String)session.getAttribute("loggedUserName")));
        if(noticeService.postNotice(noticeAPI))
            return "postNotice";
        else return "error";
    }

    @RequestMapping(value = "/postNotice", method = RequestMethod.GET)
    public String getPostNoticeForm(@ModelAttribute("login") LoginAPI loginAPI,@ModelAttribute("postNotice") NoticeAPI noticeAPI,HttpSession session) {
        if(session.getAttribute("loggedUserName")!=null)
        return "postNotice";
        else return "login";
    }

    @RequestMapping(value = "/noticeProfile", method = RequestMethod.GET)
    public ModelAndView jobProfile(@RequestParam("noticeText") String text, NoticeAPI noticeAPI, @ModelAttribute("login") LoginAPI loginAPI) {
        ModelAndView m = new ModelAndView();
        Notice notice = noticeService.returnNotice(text);
        m.addObject("notice", notice);
        m.addObject("noticeProfile");

        return m;
    }
}
