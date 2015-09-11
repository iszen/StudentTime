package ro.ebs.studenttime.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;


/**
 * Created by Bella on 9/10/2015.
 */
@Entity
public class User {
    @Id
    @GeneratedValue
    private Integer id;

    private String username;
    private String password;

    public Integer getId(){
        return id;
    }
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
