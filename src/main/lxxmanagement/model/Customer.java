package main.lxxmanagement.model;

public class Customer {

    private int id=0;
    private String name="" ;
    private String tel="" ;
    private String Email="";
    private String Pwd="";
    private String PayPwd="";
    private String img="";
    private String img_bg="";
    private String address="";
    private String orders="";
    private String friends="";

    public Customer(){
        id = 0;
    }
    public Customer(int ID,String tel,String name, String email, String pwd,String PayPwd,String img_bg,String address){
        this.id = ID;
        this.tel = tel;
        this.name=name;
        this.Email = email;
        this.Pwd = pwd;
        this.PayPwd = PayPwd;
        this.img_bg = img_bg;
        this.address = address;
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

    public void setName(String name){
        this.name=name;
    }

    public String getName(){
        return name;
    }

    public void setTel(String tel){
        this.tel=tel;
    }

    public String getTel(){
        return tel;
    }

    public void setEmail(String count){
        this.Email=count;
    }

    public String getEmail(){
        return Email;
    }
    public void setPwd(String pwd){
        this.Pwd=pwd;
    }

    public String getPwd(){
        return Pwd;
    }

    public void setPayPwd(String pwd){
        this.PayPwd=pwd;
    }

    public String getPayPwd(){
        return PayPwd;
    }

    public void setImg(String pwd){
        this.img=pwd;
    }

    public String getImg(){
        return img;
    }

    public void setImg_bg(String pwd){
        this.img_bg=pwd;
    }

    public String getImg_bg(){
        return img_bg;
    }

    public void setAddress(String pwd){
        this.address=pwd;
    }

    public String getAddress(){
        return address;
    }

    public void setOrders(String pwd){
        this.orders=pwd;
    }

    public String getOrders(){
        return orders;
    }

    public void setFriends(String pwd){
        this.friends=pwd;
    }

    public String getFriends(){
        return friends;
    }


}

