package ro.ebs.studenttime.api;

/**
 * Created by Bella on 9/22/2015.
 */
public class SearchAPI {
    private String searchJob;
    private String searchVol;
    private String searchNotice;

    public String getSearchVol() {
        return searchVol;
    }

    public void setSearchVol(String searchVol) {
        this.searchVol = searchVol;
    }

    public String getSearchNotice() {
        return searchNotice;
    }

    public void setSearchNotice(String searchNotice) {
        this.searchNotice = searchNotice;
    }

    public String getSearchJob() {
        return searchJob;
    }

    public void setSearchJob(String searchJob) {
        this.searchJob = searchJob;
    }
}
