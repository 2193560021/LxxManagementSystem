package main.lxxmanagement.model;

public class LSpaceImgWall {

    private int LSpace_imgWall_id=0;
    private int LSpace_imgWall_owners_id=0;
    private String LSpace_imgWall_title="" ;
    private String LSpace_imgWall_name="" ;
    private String LSpace_imgWall_time="" ;


    public LSpaceImgWall(int LSpace_imgWall_id, int LSpace_imgWall_owners_id, String LSpace_imgWall_title, String LSpace_imgWall_name, String LSpace_imgWall_time) {
        this.LSpace_imgWall_id = LSpace_imgWall_id;
        this.LSpace_imgWall_owners_id = LSpace_imgWall_owners_id;
        this.LSpace_imgWall_title = LSpace_imgWall_title;
        this.LSpace_imgWall_name = LSpace_imgWall_name;
        this.LSpace_imgWall_time = LSpace_imgWall_time;
    }

    public LSpaceImgWall(){}

    public int getLSpace_imgWall_id() {
        return LSpace_imgWall_id;
    }

    public void setLSpace_imgWall_id(int LSpace_imgWall_id) {
        this.LSpace_imgWall_id = LSpace_imgWall_id;
    }

    public int getLSpace_imgWall_owners_id() {
        return LSpace_imgWall_owners_id;
    }

    public void setLSpace_imgWall_owners_id(int LSpace_imgWall_owners_id) {
        this.LSpace_imgWall_owners_id = LSpace_imgWall_owners_id;
    }

    public String getLSpace_imgWall_title() {
        return LSpace_imgWall_title;
    }

    public void setLSpace_imgWall_title(String LSpace_imgWall_title) {
        this.LSpace_imgWall_title = LSpace_imgWall_title;
    }

    public String getLSpace_imgWall_name() {
        return LSpace_imgWall_name;
    }

    public void setLSpace_imgWall_name(String LSpace_imgWall_name) {
        this.LSpace_imgWall_name = LSpace_imgWall_name;
    }

    public String getLSpace_imgWall_time() {
        return LSpace_imgWall_time;
    }

    public void setLSpace_imgWall_time(String LSpace_imgWall_time) {
        this.LSpace_imgWall_time = LSpace_imgWall_time;
    }
}

