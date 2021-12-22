package main.lxxmanagement.dao;

import main.lxxmanagement.idao.iMessagesDAO;
import main.lxxmanagement.model.Messages;
import main.util.DBUtil;

import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

public class MessagesDAO implements iMessagesDAO {
    @SuppressWarnings("finally")
    @Override
    public int insert(Messages messages)
    {
        int result=0;
        try
        {
            String sql="insert into messages (message_send_name, message_send_tel, message_accept_name, message_accept_tel, message_send_user_img, message_time, message_text)"
                    + " values('" + messages.getMessage_send_name() + "','"+ messages.getMessage_send_tel() +"','" + messages.getMessage_accept_name() + "', '" + messages.getMessage_accept_tel() + "', '" + messages.getMessage_send_user_img() + "', '" + messages.getMessage_time() + "','"+ messages.getMessage_text() +"' )";
            DBUtil db=new DBUtil();
            db.openConnection();
            ResultSet rst=db.getInsertObjectIDs(sql);
            if(rst != null && rst.first())
            {
                messages.setID(rst.getInt(1));
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
            String sql="delete from messages where message_id = " + ID;
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
    public List<Messages> select(String customerTel,String method)
    {
        DBUtil db=null;
        List<Messages> messagesList=null;
        messagesList=new LinkedList<Messages>();
        try
        {
            customerTel.trim();
            String sql = null;
            System.out.println("method:" + method);
            if(method.equalsIgnoreCase("search")){
                sql="select * from messages where message_accept_tel like '%" + customerTel + "%'";
            }else if (method.equalsIgnoreCase("searchByTel")){
                sql="select * from messages where message_accept_tel like '" + customerTel + "'";
            }
            db=new DBUtil();
            if(!db.openConnection())
            {
                System.out.print("fail to connect database table messages");
                return null;
            }
            ResultSet rst=db.execQuery(sql);
            if(rst != null)
            {
                while(rst.next())
                {
                    Messages messages = new Messages();
                    messages.setID(rst.getInt("message_id"));
                    messages.setMessage_send_name(rst.getString("message_send_name"));
                    messages.setMessage_send_tel(rst.getString("message_send_tel"));
                    messages.setMessage_accept_name(rst.getString("message_accept_name"));
                    messages.setMessage_accept_tel(rst.getString("message_accept_tel"));
                    messages.setMessage_time(rst.getString("message_time"));
                    messages.setMessage_send_user_img(rst.getString("message_send_user_img"));
                    messages.setMessage_text(rst.getString("message_text"));

                    messagesList.add(messages);
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
            return messagesList;
        }
    }
}
