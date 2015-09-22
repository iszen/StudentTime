package ro.ebs.studenttime.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ro.ebs.studenttime.api.JobAPI;
import ro.ebs.studenttime.api.VolunteeringAPI;
import ro.ebs.studenttime.dao.JobRepository;
import ro.ebs.studenttime.dao.VolunteeringRepository;
import ro.ebs.studenttime.model.Job;
import ro.ebs.studenttime.model.Volunteering;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Bella on 9/14/2015.
 */
@Service
public class VolunteeringService {
    @Autowired
    VolunteeringRepository volRepo;

    public boolean postVolunteering(VolunteeringAPI volAPI) {
        Volunteering vol = new Volunteering();
        vol.setOwner(volAPI.getOwner());
        vol.setTitle(volAPI.getTitle());
        vol.setDescription(volAPI.getDescription());
        vol.setLocation(volAPI.getLocation());
        vol.setBeginDate(volAPI.getBeginDate());
        vol.setEndDate(volAPI.getEndDate());
        vol.setNumberRequiredPersons(volAPI.getNumberRequiredPersons());
        vol.setActive(volAPI.isActive());

        File file = new File(new String(volAPI.getImage()));

        byte[] bFile = new byte[(int) file.length()];

        try {

            FileInputStream fileInputStream = new FileInputStream(file);
            fileInputStream.read(bFile);
            fileInputStream.close();
        } catch (Exception e) {
            e.printStackTrace();

        }
        vol.setImage(bFile);
        if (volRepo.save(vol) != null) {
            return true;
        }
        return false;
    }

    public List<Volunteering> getVolunteers() {
        return volRepo.findAll();
    }

    public Volunteering getVolunteering(int id) {
        return volRepo.findById(id);
    }

    public Volunteering returnVolunteer(String title) {
        return volRepo.findByTitle(title);
    }

    public List<Volunteering> getMatchingVolunteers(String search) {
        List<Volunteering> allVolunteerings = getVolunteers();
        List<Volunteering> matchingVolunteerings = new ArrayList<>();
        for (Volunteering vol : allVolunteerings) {
            if(vol.getTitle()!=null)
            if (vol.getTitle().toLowerCase().contains(search.toLowerCase()))
                matchingVolunteerings.add(vol);
        }
        return matchingVolunteerings;
    }
}
