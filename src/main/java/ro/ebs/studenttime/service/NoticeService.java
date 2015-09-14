package ro.ebs.studenttime.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ro.ebs.studenttime.api.NoticeAPI;
import ro.ebs.studenttime.dao.NoticeRepository;
import ro.ebs.studenttime.model.Notice;

/**
 * Created by Bella on 9/14/2015.
 */
@Service
public class NoticeService {
    @Autowired
    NoticeRepository noticeRepo;

    public boolean postNotice(NoticeAPI noticeAPI){
        Notice notice = new Notice();
        notice.setText(noticeAPI.getText());

        if( noticeRepo.save(notice)!= null){
            return true;
        }
        return false;
    }
}
