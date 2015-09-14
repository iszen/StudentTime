package ro.ebs.studenttime.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ro.ebs.studenttime.api.JobAPI;
import ro.ebs.studenttime.api.VolunteeringAPI;
import ro.ebs.studenttime.dao.JobRepository;
import ro.ebs.studenttime.dao.VolunteeringRepository;
import ro.ebs.studenttime.model.Job;
import ro.ebs.studenttime.model.Volunteering;

/**
 * Created by Bella on 9/14/2015.
 */
@Service
public class VolunteeringService {
    @Autowired
    VolunteeringRepository volRepo;

    public boolean postVolunteering(VolunteeringAPI volAPI){
        Volunteering vol = new Volunteering();
        vol.setTitle(volAPI.getTitle());
        vol.setDescription(volAPI.getDescription());
        vol.setLocation(volAPI.getLocation());
        vol.setBeginDate(volAPI.getBeginDate());
        vol.setEndDate(volAPI.getEndDate());
        vol.setNumberRequiredPersons(volAPI.getNumberRequiredPersons());
        vol.setCertificate(volAPI.isCertificate());

        if( volRepo.save(vol)!= null){
            return true;
        }
        return false;
    }
}
