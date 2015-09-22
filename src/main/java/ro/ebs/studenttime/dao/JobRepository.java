package ro.ebs.studenttime.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import ro.ebs.studenttime.model.Job;

import java.util.List;

/**
 * Created by Bella on 9/14/2015.
 */
public interface JobRepository extends JpaRepository<Job, Integer> {

    Job findByTitle(String title);

    Job findById(int id);
}
