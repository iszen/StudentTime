package ro.ebs.studenttime.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ro.ebs.studenttime.api.NoticeAPI;
import ro.ebs.studenttime.dao.NoticeRepository;
import ro.ebs.studenttime.model.Notice;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Bella on 9/14/2015.
 */
@Service
public class NoticeService {
    @Autowired
    NoticeRepository noticeRepo;

    public boolean postNotice(NoticeAPI noticeAPI){
        Notice notice = new Notice();
        notice.setTitle(noticeAPI.getTitle());
        notice.setText(noticeAPI.getText());
        notice.setOwner(noticeAPI.getOwner());
        if( noticeRepo.save(notice)!= null){
            return true;
        }
        return false;
    }

    public List<Notice> getNotices(){ return noticeRepo.findAll();}

    public Notice returnNotice(String text) {
        return noticeRepo.findByText(text);
    }
    public List<Notice> getMatchingNotices(String search){
        List<Notice> allNotices = getNotices();
        List<Notice> matchingNotices = new ArrayList<>();
        for(Notice notice : allNotices){
            if (notice.getTitle().toLowerCase().contains(search.toLowerCase()))
                matchingNotices.add(notice);
        }
        return matchingNotices;
    }
}
