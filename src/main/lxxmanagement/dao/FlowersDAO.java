package main.lxxmanagement.dao;

import main.lxxmanagement.idao.iFlowersDAO;
import main.lxxmanagement.model.Flowers;
import main.util.DBUtil;

import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

public class FlowersDAO implements iFlowersDAO {
    @SuppressWarnings("finally")
    @Override
    public int insert(Flowers flowers)
    {
        int result=0;
        try
        {
            String sql="insert into flowers(flower_name, flower_kind, flower_introduction, flower_image1, flower_image2,flower_image3,flower_image4,flower_price)"
                    + " values('" + flowers.getFlower_name() + "', '" + flowers.getFlower_kind() + "', '" + flowers.getFlower_introduction() + "', '"
                    + flowers.getFlower_image1() + "', '"+ flowers.getFlower_image2()+"','"+ flowers.getFlower_image3()+"','"+ flowers.getFlower_image4()+
                    "',"+ flowers.getFlower_price()+" )";
            DBUtil db=new DBUtil();
            db.openConnection();
            ResultSet rst=db.getInsertObjectIDs(sql);
            if(rst != null && rst.first())
            {
                flowers.setFlower_id(rst.getInt(1));
            }
            db.close(rst);
            db.close();
            result=1;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            return result;
        }
    }

    @SuppressWarnings("finally")
    @Override
    public int update(Flowers flowers)
    {
        int result=0;
        try
        {

            String sql="update flowers set " + " flower_name  ='" + flowers.getFlower_name()+ "', " + " flower_kind  = '"
                    + flowers.getFlower_kind() + "', " + " flower_introduction  = '" + flowers.getFlower_introduction() + "', "
                    +""+"flower_price ="+ flowers.getFlower_price();
            sql+=" where flower_id = " + flowers.getFlower_id();
            DBUtil db=new DBUtil();
            db.openConnection();
            result=db.execCommand(sql);
            db.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            return result;
        }
    }

    @Override
    public int delete(int ID)
    {
        int result=0;
        try
        {
            String sql="delete from flowers where flower_id  = " + ID;
            DBUtil db=new DBUtil();
            db.openConnection();
            result=db.execCommand(sql);
            db.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return result;
    }


   @SuppressWarnings("finally")
   @Override
   public List<Flowers> selectbyID(int flower_id)
   {
       System.out.println("hello");
       DBUtil db=null;
       List<Flowers> stuList=null;
       stuList=new LinkedList<Flowers>();
       try
       {
           String sql="select * from flowers where flower_id= " + flower_id;
           db=new DBUtil();
           if(!db.openConnection())
           {
               System.out.print("fail to connect database table flowers");
               return null;
           }
           ResultSet rst=db.execQuery(sql);
           if(rst != null)
           {
               while(rst.next())
               {
                   Flowers flowers = new Flowers();
                   flowers.setFlower_id(rst.getInt("flower_id"));
                   flowers.setFlower_name(rst.getString("flower_name"));
                   flowers.setFlower_kind(rst.getString("flower_kind"));
                   flowers.setFlower_introduction(rst.getString("flower_introduction"));
                   flowers.setFlower_image1(rst.getString("flower_image1"));
                   flowers.setFlower_image2(rst.getString("flower_image2"));
                   flowers.setFlower_image3(rst.getString("flower_image3"));
                   flowers.setFlower_image4(rst.getString("flower_image4"));
                   flowers.setFlower_price(rst.getInt("flower_price"));
                   flowers.setFlower_sale(rst.getInt("flower_sale"));
                   flowers.setFlower_stock(rst.getInt("flower_stock"));

                   stuList.add(flowers);
               }
           }
           db.close(rst);
           db.close();
       }
       catch(Exception e)
       {
           e.printStackTrace();
       }
       finally
       {
           return stuList;
       }
   }

    @SuppressWarnings("finally")
    @Override
    public List<Flowers> select(String flowerinformation)
    {
        DBUtil db=null;
        List<Flowers> flowersList =null;
        flowersList =new LinkedList<Flowers>();
        try
        {
            flowerinformation.trim();
            String sql = null;
            /*查询函数的参数是花信息，如果花的信息是图片，将执行第一条SQL语句，否则，执行第二条SQL语句默认按照花的名字搜索*/
            if(flowerinformation.contains("..")){
                 sql="select * from flowers where flower_image1 ='" + flowerinformation+ "' ";
            }
            else{
                 sql="select * from flowers where flower_name like '%" + flowerinformation+ "%' ";
            }

            db=new DBUtil();
            if(!db.openConnection())
            {
                System.out.print("fail to connect database table flowers");
                return null;
            }
            ResultSet rst=db.execQuery(sql);
            if(rst != null)
            {
                while(rst.next())
                {
                    Flowers flowers = new Flowers();
                    flowers.setFlower_id(rst.getInt("flower_id"));
                    flowers.setFlower_name(rst.getString("flower_name"));
                    flowers.setFlower_kind(rst.getString("flower_kind"));
                    flowers.setFlower_introduction(rst.getString("flower_introduction"));
                    flowers.setFlower_image1(rst.getString("flower_image1"));
                    flowers.setFlower_image2(rst.getString("flower_image2"));
                    flowers.setFlower_image3(rst.getString("flower_image3"));
                    flowers.setFlower_image4(rst.getString("flower_image4"));
                    flowers.setFlower_price(rst.getInt("flower_price"));
                    flowers.setFlower_sale(rst.getInt("flower_sale"));
                    flowers.setFlower_stock(rst.getInt("flower_stock"));

                    flowersList.add(flowers);
                }
            }
            db.close(rst);
            db.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            return flowersList;
        }
    }


    @SuppressWarnings("finally")
    @Override
    public List<Flowers> selectsale_stock(String flag)
    {
        DBUtil db=null;
        List<Flowers> flowersDescList=null;
        flowersDescList=new LinkedList<Flowers>();
        try
        {

            String sql="";
            if(flag.equalsIgnoreCase("sale")){

                sql="select * from flowers order by flower_sale DESC;";
            }else if(flag.equalsIgnoreCase("stock")){
                sql="select * from flowers order by flower_stock ASC;";
            }

            db=new DBUtil();
            if(!db.openConnection())
            {
                System.out.print("fail to connect database table flowers");
                return null;
            }
            ResultSet rst=db.execQuery(sql);
            if(rst != null)
            {
                while(rst.next())
                {
                    Flowers stu=new Flowers();
                    stu.setFlower_id(rst.getInt("flower_id"));
                    stu.setFlower_name(rst.getString("flower_name"));
                    stu.setFlower_sale(rst.getInt("flower_sale"));
                    stu.setFlower_stock(rst.getInt("flower_stock"));
                    flowersDescList.add(stu);
                }
            }
            db.close(rst);
            db.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            return flowersDescList;
        }
    }

}

