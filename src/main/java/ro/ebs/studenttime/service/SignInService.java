package ro.ebs.studenttime.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ro.ebs.studenttime.api.SigninAPI;
import ro.ebs.studenttime.dao.UserRepository;
import ro.ebs.studenttime.model.User;

/**
 * Created by Dana on 9/14/2015.
 */
@Service
public class SignInService {

    @Autowired
    UserRepository userRepo;

    public boolean performSignIn(SigninAPI signinAPI){
        User foundUser = userRepo.findByUsername(signinAPI.getUsername());
        if(foundUser != null){
            userRepo.save(foundUser);
            return true;
        }
        return false;
    }
}
