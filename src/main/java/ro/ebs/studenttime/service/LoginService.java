package ro.ebs.studenttime.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ro.ebs.studenttime.api.LoginAPI;
import ro.ebs.studenttime.model.User;
import ro.ebs.studenttime.dao.UserRepository;

/**
 * Created by Bella on 9/9/2015.
 */
@Service
public class LoginService {
    @Autowired
    UserRepository userRepo;

    public boolean performLogin(LoginAPI loginAPI) {
        User user = new User();
        user.setUsername(loginAPI.getUsername());
        user.setPassword(loginAPI.getPassword());
        if(userRepo.findByUsername(user.getUsername())==null){
            return false;
        }
        return true;
    }
}
