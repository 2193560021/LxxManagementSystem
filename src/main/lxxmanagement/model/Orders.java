package main.lxxmanagement.model;

public class Orders {

    private int id=0;
    private String order_text="" ;
    private int order_kind=0 ;
    private float order_amount=0 ;
    private float order_amount_sum=0 ;
    private String order_owner_tel="";
    private String order_time="";

    public Orders(int id, String order_text, int order_kind, float order_amount, float order_amount_sum, String order_owner_tel, String order_time) {
        this.id = id;
        this.order_text = order_text;
        this.order_kind = order_kind;
        this.order_amount = order_amount;
        this.order_amount_sum = order_amount_sum;
        this.order_owner_tel = order_owner_tel;
        this.order_time = order_time;
    }

    public Orders(){
        id = 0;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOrder_text() {
        return order_text;
    }

    public void setOrder_text(String order_text) {
        this.order_text = order_text;
    }

    public int getOrder_kind() {
        return order_kind;
    }

    public void setOrder_kind(int order_kind) {
        this.order_kind = order_kind;
    }

    public float getOrder_amount() {
        return order_amount;
    }

    public void setOrder_amount(float order_amount) {
        this.order_amount = order_amount;
    }

    public float getOrder_amount_sum() {
        return order_amount_sum;
    }

    public void setOrder_amount_sum(float order_amount_sum) {
        this.order_amount_sum = order_amount_sum;
    }

    public String getOrder_owner_tel() {
        return order_owner_tel;
    }

    public void setOrder_owner_tel(String order_owner_tel) {
        this.order_owner_tel = order_owner_tel;
    }

    public String getOrder_time() {
        return order_time;
    }

    public void setOrder_time(String order_time) {
        this.order_time = order_time;
    }
}

