package ro.ebs.studenttime.api;

import ro.ebs.studenttime.model.User;

import java.util.Date;

/**
 * Created by Bella on 9/14/2015.
 */
public class JobAPI {
    private User owner;


    private String title;
    private String description;
    private String location;
    private Date beginDate;
    private Date endDate;
    private int numberRequiredPersons;
    private double salary;

    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {
        this.owner = owner;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
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

    @Override
    public String toString() {
        return "JobAPI{" +
                "title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", location='" + location + '\'' +
                ", beginDate=" + beginDate +
                ", endDate=" + endDate +
                ", numberRequiredPersons=" + numberRequiredPersons +
                ", salary=" + salary +
                '}';
    }
}
