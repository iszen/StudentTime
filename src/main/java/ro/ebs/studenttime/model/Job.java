package ro.ebs.studenttime.model;

import com.sun.istack.internal.NotNull;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import ro.ebs.studenttime.dao.JobRepository;

import javax.persistence.*;
import javax.validation.constraints.Future;
import javax.validation.constraints.Min;
import javax.validation.constraints.Past;
import java.sql.Date;

/**
 * Created by Bella on 9/14/2015.
 */
@Entity
public class Job{
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
    @Future
    private Date beginDate;
    @NotNull
    @DateTimeFormat(iso=DateTimeFormat.ISO.DATE)
    @Future
    private Date endDate;
    @Min(1)
    private int numberRequiredPersons;
    @Min(5)
    private double salary;

    @Lob
    private byte[] image;

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

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
