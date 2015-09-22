package ro.ebs.studenttime.service;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ro.ebs.studenttime.api.JobAPI;
import ro.ebs.studenttime.dao.JobRepository;
import ro.ebs.studenttime.model.Job;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Bella on 9/14/2015.
 */
@Service
public class JobService {
    @Autowired
    JobRepository jobRepo;

    public boolean postJob(JobAPI jobAPI) {
        Job job = new Job();
        job.setOwner(jobAPI.getOwner());
        job.setTitle(jobAPI.getTitle());
        job.setDescription(jobAPI.getDescription());
        job.setLocation(jobAPI.getLocation());
        job.setBeginDate(jobAPI.getBeginDate());
        job.setEndDate(jobAPI.getEndDate());
        job.setNumberRequiredPersons(jobAPI.getNumberRequiredPersons());
        job.setSalary(jobAPI.getSalary());

        File file = new File(new String(jobAPI.getImage()));

        byte[] bFile = new byte[(int) file.length()];

        try {

            FileInputStream fileInputStream = new FileInputStream(file);
            fileInputStream.read(bFile);
            fileInputStream.close();
        } catch (Exception e) {
            e.printStackTrace();

        }
        System.out.println("image to save "+bFile.toString());
        job.setImage(bFile);

        if (jobRepo.save(job) != null) {
            return true;
        }
        return false;
    }

    public List<Job> getJobs() {
        return jobRepo.findAll();
    }
    public List<Job> getMatchingJobs(String searchstring) {
        List<Job> allJobs = getJobs();
        List<Job> matchingJobs = new ArrayList<>();
        for(Job job : allJobs){
            if(job.getTitle().toLowerCase().contains(searchstring.toLowerCase()))
                matchingJobs.add(job);
        }
        return matchingJobs;
    }

    public Job getJob(int id) {
        return jobRepo.findById(id);
    }

    public Job returnJob(String title) {
        return jobRepo.findByTitle(title);
    }

}
