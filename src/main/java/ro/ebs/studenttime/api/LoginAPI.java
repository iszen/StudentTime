package ro.ebs.studenttime.api;

/**
 * Created by Bella on 9/8/2015.
 */
public class LoginAPI {
    private String username;
    private String password;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "LoginAPI{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}

