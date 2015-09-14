package ro.ebs.studenttime.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import ro.ebs.studenttime.model.Job;

/**
 * Created by Bella on 9/14/2015.
 */
public interface JobRepository extends JpaRepository<Job, Integer> {

}
