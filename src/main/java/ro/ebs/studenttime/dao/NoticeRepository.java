package ro.ebs.studenttime.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import ro.ebs.studenttime.model.Notice;

/**
 * Created by Bella on 9/14/2015.
 */
public interface NoticeRepository extends JpaRepository<Notice, Integer>{

    Notice findByText(String text);
}
