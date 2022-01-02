package main.lxxmanagement.model;

public class LSpace {

    private int id=0      ;
    private String message_send_name="" ;
    private String message_send_tel="" ;
    private String message_accept_name="" ;
    private String message_accept_tel="";
    private String message_time="";
    private String message_send_user_img="";
    private String message_text="";

    public LSpace(int id, String message_send_name, String message_send_tel, String message_accept_name, String message_accept_tel, String message_time, String message_send_user_img, String message_text) {
        this.id = id;
        this.message_send_name = message_send_name;
        this.message_send_tel = message_send_tel;
        this.message_accept_name = message_accept_name;
        this.message_accept_tel = message_accept_tel;
        this.message_time = message_time;
        this.message_send_user_img = message_send_user_img;
        this.message_text = message_text;
    }

    public LSpace(){
        id = 0;
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


    public String getMessage_send_name() {
        return message_send_name;
    }

    public void setMessage_send_name(String message_send_name) {
        this.message_send_name = message_send_name;
    }

    public String getMessage_send_tel() {
        return message_send_tel;
    }

    public void setMessage_send_tel(String message_send_tel) {
        this.message_send_tel = message_send_tel;
    }

    public String getMessage_accept_name() {
        return message_accept_name;
    }

    public void setMessage_accept_name(String message_accept_name) {
        this.message_accept_name = message_accept_name;
    }

    public String getMessage_accept_tel() {
        return message_accept_tel;
    }

    public void setMessage_accept_tel(String message_accept_tel) {
        this.message_accept_tel = message_accept_tel;
    }

    public String getMessage_time() {
        return message_time;
    }

    public void setMessage_time(String message_time) {
        this.message_time = message_time;
    }

    public String getMessage_send_user_img() {
        return message_send_user_img;
    }

    public void setMessage_send_user_img(String message_send_user_img) {
        this.message_send_user_img = message_send_user_img;
    }

    public String getMessage_text() {
        return message_text;
    }

    public void setMessage_text(String message_text) {
        this.message_text = message_text;
    }



}

