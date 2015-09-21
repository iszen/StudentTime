package ro.ebs.studenttime.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import ro.ebs.studenttime.model.Volunteering;

/**
 * Created by Bella on 9/14/2015.
 */
public interface VolunteeringRepository extends JpaRepository<Volunteering, Integer> {
    Volunteering findByTitle(String title);

    Volunteering findById(int id);
}
