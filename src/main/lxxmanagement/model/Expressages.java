package main.lxxmanagement.model;

public class Expressages {

    private int id=0      ;
    private String expressage_code="" ;
    private String expressage_company="" ;
    private String expressage_time="" ;
    private String expressage_yes_time="";
    private String expressage_owner_tel="";
    private String expressage_status="";


    public Expressages(int id, String expressage_code, String expressage_company, String expressage_time, String expressage_yes_time, String expressage_owner_tel, String expressage_status) {
        this.id = id;
        this.expressage_code = expressage_code;
        this.expressage_company = expressage_company;
        this.expressage_time = expressage_time;
        this.expressage_yes_time = expressage_yes_time;
        this.expressage_owner_tel = expressage_owner_tel;
        this.expressage_status = expressage_status;
    }

    public Expressages(){
        id = 0;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getExpressage_code() {
        return expressage_code;
    }

    public void setExpressage_code(String expressage_code) {
        this.expressage_code = expressage_code;
    }

    public String getExpressage_company() {
        return expressage_company;
    }

    public void setExpressage_company(String expressage_company) {
        this.expressage_company = expressage_company;
    }

    public String getExpressage_time() {
        return expressage_time;
    }

    public void setExpressage_time(String expressage_time) {
        this.expressage_time = expressage_time;
    }

    public String getExpressage_yes_time() {
        return expressage_yes_time;
    }

    public void setExpressage_yes_time(String expressage_yes_time) {
        this.expressage_yes_time = expressage_yes_time;
    }

    public String getExpressage_owner_tel() {
        return expressage_owner_tel;
    }

    public void setExpressage_owner_tel(String expressage_owner_tel) {
        this.expressage_owner_tel = expressage_owner_tel;
    }

    public String getExpressage_status() {
        return expressage_status;
    }

    public void setExpressage_status(String expressage_status) {
        this.expressage_status = expressage_status;
    }
}

