package main.lxxmanagement.dao;

import main.lxxmanagement.idao.iOrdersDAO;
import main.lxxmanagement.model.Orders;
import main.util.DBUtil;

import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

public class OrdersDAO implements iOrdersDAO {
    @SuppressWarnings("finally")
    @Override
    public int insert(Orders orders)
    {
        int result=0;
        try
        {
            String sql="insert into orders(order_text, order_kind, order_amount, order_amount_sum, order_owner_tel, order_time)"
                    + " values('" + orders.getOrder_text() + "',"+ orders.getOrder_kind() +"," + orders.getOrder_amount() + ", '"+ orders.getOrder_amount_sum() +"', '" + orders.getOrder_owner_tel() + "','"+ orders.getOrder_time() +"' )";
            DBUtil db=new DBUtil();
            db.openConnection();
            ResultSet rst=db.getInsertObjectIDs(sql);
            if(rst != null && rst.first())
            {
                orders.setId(rst.getInt(1));
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

    @Override
    public int delete(int ID)
    {
        int result=0;
        try
        {
            String sql="delete from orders where order_id = " + ID;
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
    public List<Orders> select(String customerTel, String method)
    {
        DBUtil db=null;
        List<Orders> ordersList=null;
        ordersList=new LinkedList<Orders>();
        try
        {
            customerTel.trim();
            String sql = null;
            System.out.println("method:" + method);
            if(method.equalsIgnoreCase("search")){
                sql="select * from orders where order_owner_tel like '%" + customerTel + "%'";
            }else if (method.equalsIgnoreCase("searchByTel")){
                sql="select * from orders where order_owner_tel like '" + customerTel + "' order by order_time DESC";
            }
            db=new DBUtil();
            if(!db.openConnection())
            {
                System.out.print("fail to connect database table orders");
                return null;
            }
            ResultSet rst=db.execQuery(sql);
            if(rst != null)
            {
                while(rst.next())
                {
                    Orders orders = new Orders();
                    orders.setId(rst.getInt("order_id"));
                    orders.setOrder_text(rst.getString("order_text"));
                    orders.setOrder_kind(rst.getInt("order_kind"));
                    orders.setOrder_amount(rst.getFloat("order_amount"));
                    orders.setOrder_amount_sum(rst.getFloat("order_amount_sum"));
                    orders.setOrder_owner_tel(rst.getString("order_owner_tel"));
                    orders.setOrder_time(rst.getString("order_time"));

                    ordersList.add(orders);
                }
            }
            db.close(rst);
            db.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }finally {
            return ordersList;
        }
    }
}
