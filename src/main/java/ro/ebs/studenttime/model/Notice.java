package ro.ebs.studenttime.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

/**
 * Created by Bella on 9/14/2015.
 */
@Entity
public class Notice {
    @Id
    @GeneratedValue
    private int id;

    @ManyToOne
    private User owner;

    private String text;

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
}
