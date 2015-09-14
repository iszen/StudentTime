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
        User newUser = new User();
        newUser.setEmail(signinAPI.getEmail());
        newUser.setFirstname(signinAPI.getFirstname());
        newUser.setLastname(signinAPI.getLastname());
        newUser.setPassword(signinAPI.getPassword());
        newUser.setUsername(signinAPI.getUsername());
        newUser.setWorkplace(signinAPI.getWorkplace());

        if(userRepo.findByUsername(newUser.getUsername()) == null){
            userRepo.save(newUser);
            return true;
        }
        return false;
    }
}
