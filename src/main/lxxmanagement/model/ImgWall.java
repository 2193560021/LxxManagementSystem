package main.lxxmanagement.model;

public class ImgWall {

    private int id=0      ;
    private String imgWall_title="" ;
    private String imgWall_name="" ;
    private String imgWall_time="" ;
    private String imgWall_owner_tel="";

    public ImgWall(int id, String imgWall_title, String imgWall_name, String imgWall_time, String imgWall_owner_tel) {
        this.id = id;
        this.imgWall_title = imgWall_title;
        this.imgWall_name = imgWall_name;
        this.imgWall_time = imgWall_time;
        this.imgWall_owner_tel = imgWall_owner_tel;
    }

    public ImgWall(){
        id = 0;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImgWall_title() {
        return imgWall_title;
    }

    public void setImgWall_title(String imgWall_title) {
        this.imgWall_title = imgWall_title;
    }

    public String getImgWall_name() {
        return imgWall_name;
    }

    public void setImgWall_name(String imgWall_name) {
        this.imgWall_name = imgWall_name;
    }

    public String getImgWall_time() {
        return imgWall_time;
    }

    public void setImgWall_time(String imgWall_time) {
        this.imgWall_time = imgWall_time;
    }

    public String getImgWall_owner_tel() {
        return imgWall_owner_tel;
    }

    public void setImgWall_owner_tel(String imgWall_owner_tel) {
        this.imgWall_owner_tel = imgWall_owner_tel;
    }
}

