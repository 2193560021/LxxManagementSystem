package main.lxxmanagement.model;

public class LSpace {

    private int LSpace_id=0;
    private String LSpace_lovers="" ;
    private String LSpace_time="" ;


    public LSpace(int LSpace_id, String LSpace_lovers, String LSpace_time) {
        this.LSpace_id = LSpace_id;
        this.LSpace_lovers = LSpace_lovers;
        this.LSpace_time = LSpace_time;
    }

    public LSpace(){}

    public int getLSpace_id() {
        return LSpace_id;
    }

    public void setLSpace_id(int LSpace_id) {
        this.LSpace_id = LSpace_id;
    }

    public String getLSpace_lovers() {
        return LSpace_lovers;
    }

    public void setLSpace_lovers(String LSpace_lovers) {
        this.LSpace_lovers = LSpace_lovers;
    }

    public String getLSpace_time() {
        return LSpace_time;
    }

    public void setLSpace_time(String LSpace_time) {
        this.LSpace_time = LSpace_time;
    }
}

