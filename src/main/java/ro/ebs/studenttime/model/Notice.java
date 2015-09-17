package ro.ebs.studenttime.model;

import com.sun.istack.internal.NotNull;

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
    @NotNull
    private User owner;
    @NotNull
    private String text;

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
}
