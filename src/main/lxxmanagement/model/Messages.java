package main.lxxmanagement.model;

public class Messages {

    private int id=0      ;
    private String name="" ;
    private String img="" ;
    private String title="" ;
    private String Email="";
    private String time="";
    private String text="";

    public Messages(){
        id = 0;
    }
    public Messages(int ID, String name,String img, String title, String email, String time, String text){
        this.id = ID;
        this.title = title;
        this.name=name;
        this.img=img;
        this.Email = email;
        this.time = time;
        this.text = text;


    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public void setID(int ID){
        this.id=ID;
    }

    public int getID(){
        return id;
    }

    public void setTitle(String tel){
        this.title=tel;
    }

    public String getTitle(){
        return title;
    }

    public void setName(String name){
        this.name=name;
    }

    public String getName(){
        return name;
    }

    public void setImg(String img){
        this.img=img;
    }

    public String getImg(){
        return img;
    }

    public void setEmail(String count){
        this.Email=count;
    }

    public String getEmail(){
        return Email;
    }
    public void setTime(String pwd){
        this.time=pwd;
    }

    public String getTime(){
        return time;
    }

    public void setText(String pwd){
        this.text=pwd;
    }

    public String getText(){
        return text;
    }


}

