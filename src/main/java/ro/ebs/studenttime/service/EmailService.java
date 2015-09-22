package ro.ebs.studenttime.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import ro.ebs.studenttime.api.EmailAPI;
import ro.ebs.studenttime.api.JobAPI;
import ro.ebs.studenttime.conf.AppConfig;
import ro.ebs.studenttime.conf.PersistenceContext;

/**
 * Created by Ioana on 9/21/2015.
 */
@Service
public class EmailService {

    @Autowired
    JavaMailSender javaMailSender;

//    @Autowired
//    public void setMailSender(JavaMailSenderImpl mailSender) {
//        this.javaMailSender = mailSender;
//    }

    public boolean sendEmail(EmailAPI emailAPI) throws MessagingException {

        MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        MimeMessageHelper mailMsg = new MimeMessageHelper(mimeMessage);
        mailMsg.setFrom(emailAPI.getFrom());
        mailMsg.setTo(emailAPI.getTo());
        mailMsg.setSubject(emailAPI.getSubject());
        mailMsg.setText(emailAPI.getText());
        javaMailSender.send(mimeMessage);
        if (mimeMessage != null) {
            System.out.println("---Done---");
            return true;
        } else return false;
    }
}

