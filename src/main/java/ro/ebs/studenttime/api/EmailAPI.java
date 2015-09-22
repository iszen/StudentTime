package ro.ebs.studenttime.api;

import org.springframework.core.io.FileSystemResource;

import java.io.File;

/**
 * Created by Ioana on 9/21/2015.
 */
public class EmailAPI {
    private final String from = "studenttime2015@gmail.com";
    private String name;
    private String to;
    private String subject;
    private String text;
    private File file;

    public String getFrom() {
        return from;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    @Override
    public String toString() {
        return "EmailAPI{" +
                "from='" + from + '\'' +
                ", name='" + name + '\'' +
                ", to='" + to + '\'' +
                ", subject='" + subject + '\'' +
                ", text='" + text + '\'' +
                ", file=" + file +
                '}';
    }
}
