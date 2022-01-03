package main.lxxmanagement.model;

public class LSpaceCountDown {

    private int LSpace_countdown_id=0;
    private int LSpace_countdown_owners_id=0;
    private String LSpace_countdown_title="" ;
    private String LSpace_countdown_time="" ;
    private String LSpace_countdown_bg="" ;


    public LSpaceCountDown(int LSpace_countdown_id, int LSpace_countdown_owners_id, String LSpace_countdown_title, String LSpace_countdown_time, String LSpace_countdown_bg) {
        this.LSpace_countdown_id = LSpace_countdown_id;
        this.LSpace_countdown_owners_id = LSpace_countdown_owners_id;
        this.LSpace_countdown_title = LSpace_countdown_title;
        this.LSpace_countdown_time = LSpace_countdown_time;
        this.LSpace_countdown_bg = LSpace_countdown_bg;
    }

    public LSpaceCountDown(){}

    public int getLSpace_countdown_id() {
        return LSpace_countdown_id;
    }

    public void setLSpace_countdown_id(int LSpace_countdown_id) {
        this.LSpace_countdown_id = LSpace_countdown_id;
    }

    public int getLSpace_countdown_owners_id() {
        return LSpace_countdown_owners_id;
    }

    public void setLSpace_countdown_owners_id(int LSpace_countdown_owners_id) {
        this.LSpace_countdown_owners_id = LSpace_countdown_owners_id;
    }

    public String getLSpace_countdown_title() {
        return LSpace_countdown_title;
    }

    public void setLSpace_countdown_title(String LSpace_countdown_title) {
        this.LSpace_countdown_title = LSpace_countdown_title;
    }

    public String getLSpace_countdown_time() {
        return LSpace_countdown_time;
    }

    public void setLSpace_countdown_time(String LSpace_countdown_time) {
        this.LSpace_countdown_time = LSpace_countdown_time;
    }

    public String getLSpace_countdown_bg() {
        return LSpace_countdown_bg;
    }

    public void setLSpace_countdown_bg(String LSpace_countdown_bg) {
        this.LSpace_countdown_bg = LSpace_countdown_bg;
    }
}

