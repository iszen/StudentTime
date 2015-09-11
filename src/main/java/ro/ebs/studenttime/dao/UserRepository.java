package ro.ebs.studenttime.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import ro.ebs.studenttime.model.User;

/**
 * Created by Bella on 9/10/2015.
 */
public interface UserRepository extends JpaRepository<User, Integer> {

    User findByUsernameAndPassword(String username, String password);
}
