package ro.ebs.studenttime.model;

import com.sun.istack.internal.NotNull;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.sql.Date;

/**
 * Created by Bella on 9/14/2015.
 */
@Entity
public class Volunteering {
    @Id
    @GeneratedValue
    private int id;

    @ManyToOne
    @NotNull
    private User owner;
    @NotNull
    private String title;
    @NotNull
    private String description;
    @NotNull
    private String location;
    @NotNull
    @DateTimeFormat(iso=DateTimeFormat.ISO.DATE)
    private Date beginDate;
    @NotNull
    @DateTimeFormat(iso=DateTimeFormat.ISO.DATE)
    private Date endDate;
    private boolean active;

    public boolean getActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    private int numberRequiredPersons;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {
        this.owner = owner;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Date getBeginDate() {
        return beginDate;
    }

    public void setBeginDate(Date beginDatel) {
        this.beginDate = beginDatel;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public int getNumberRequiredPersons() {
        return numberRequiredPersons;
    }

    public void setNumberRequiredPersons(int numberRequiredPersons) {
        this.numberRequiredPersons = numberRequiredPersons;
    }

}
