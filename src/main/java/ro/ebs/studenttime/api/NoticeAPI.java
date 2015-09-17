package ro.ebs.studenttime.api;

import ro.ebs.studenttime.model.User;

/**
 * Created by Bella on 9/14/2015.
 */
public class NoticeAPI {
    private String text;


    private User owner;

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {
        this.owner = owner;
    }

    @Override
    public String toString() {
        return "NoticeAPI{" +
                "text='" + text + '\'' +
                ", owner=" + owner +
                '}';
    }
}
