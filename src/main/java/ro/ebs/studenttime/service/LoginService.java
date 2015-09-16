package ro.ebs.studenttime.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import ro.ebs.studenttime.api.LoginAPI;
import ro.ebs.studenttime.model.User;
import ro.ebs.studenttime.dao.UserRepository;

import java.util.List;

/**
 * Created by Bella on 9/9/2015.
 */
@Service

public class LoginService {
    @Autowired
    UserRepository userRepo;

    public boolean performLogin(LoginAPI loginAPI) {
        User foundUser = userRepo.findByUsername(loginAPI.getUsername());
        if (foundUser != null && foundUser.getPassword().equals(loginAPI.getPassword())){
            return true;
        }
        return false;
    }
    public List<User> getUsers(){
        return userRepo.findAll();
    }
}
