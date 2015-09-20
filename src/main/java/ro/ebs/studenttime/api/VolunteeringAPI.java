package ro.ebs.studenttime.api;

import ro.ebs.studenttime.model.User;

import java.sql.Date;

/**
 * Created by Bella on 9/14/2015.
 */
public class VolunteeringAPI {

    private User owner;
    private String title;
    private String description;
    private String location;
    private Date beginDate;
    private Date endDate;
    private int numberRequiredPersons;
    private boolean active;

    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {
        this.owner = owner;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
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

    public void setBeginDate(Date beginDate) {
        this.beginDate = beginDate;
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
