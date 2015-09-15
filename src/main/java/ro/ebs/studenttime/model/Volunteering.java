package ro.ebs.studenttime.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import java.util.Date;

/**
 * Created by Bella on 9/14/2015.
 */
@Entity
public class Volunteering{
    @Id
    @GeneratedValue
    private int id;

    @ManyToOne
    private User owner;

    private String title;

    private String description;

    private String location;

    private Date beginDate;

    private Date endDate;

    public boolean isCertificate() {
        return certificate;
    }

    public void setCertificate(boolean certificate) {
        this.certificate = certificate;
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
    private boolean certificate;
}