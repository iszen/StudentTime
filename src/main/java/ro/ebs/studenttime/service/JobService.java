package ro.ebs.studenttime.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ro.ebs.studenttime.api.JobAPI;
import ro.ebs.studenttime.dao.JobRepository;
import ro.ebs.studenttime.model.Job;

/**
 * Created by Bella on 9/14/2015.
 */
@Service
public class JobService {
    @Autowired
    JobRepository jobRepo;

    public boolean postJob(JobAPI jobAPI){
        Job job = new Job();
        job.setTitle(jobAPI.getTitle());
        job.setDescription(jobAPI.getDescription());
        job.setLocation(jobAPI.getLocation());
        job.setBeginDate(jobAPI.getBeginDate());
        job.setEndDate(jobAPI.getEndDate());
        job.setNumberRequiredPersons(jobAPI.getNumberRequiredPersons());
        job.setSalary(jobAPI.getSalary());

       if( jobRepo.save(job)!= null){
           return true;
       }
        return false;
    }

}
