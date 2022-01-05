package main.lxxmanagement.dao;

import main.lxxmanagement.idao.iExpressagesDAO;
import main.lxxmanagement.model.Expressages;
import main.util.DBUtil;

import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

public class ExpressagesDAO implements iExpressagesDAO {
    @SuppressWarnings("finally")
    @Override
    public int insert(Expressages expressages)
    {
        int result=0;
        try
        {
            String sql="insert into expressages(expressage_code, expressage_company, expressage_time, expressage_owner_tel)"
                    + " values('" + expressages.getExpressage_code() + "','"+ expressages.getExpressage_company() +"','" + expressages.getExpressage_time() + "', '" + expressages.getExpressage_owner_tel() + "' )";
            DBUtil db=new DBUtil();
            db.openConnection();
            ResultSet rst=db.getInsertObjectIDs(sql);
            if(rst != null && rst.first())
            {
                expressages.setId(rst.getInt(1));
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
            String sql="delete from expressages where expressage_id = " + ID;
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
    public List<Expressages> select(String customerTel,String method)
    {
        DBUtil db=null;
        List<Expressages> expressagesList=null;
        expressagesList=new LinkedList<Expressages>();
        try
        {
            customerTel.trim();
            String sql = null;
            System.out.println("method:" + method);
            if(method.equalsIgnoreCase("search")){
                sql="select * from expressages where expressage_owner_tel like '%" + customerTel + "%'";
            }else if (method.equalsIgnoreCase("searchByTel")){
                sql="select * from expressages where expressage_owner_tel like '" + customerTel + "' order by expressage_time DESC";
            }
            db=new DBUtil();
            if(!db.openConnection())
            {
                System.out.print("fail to connect database table expressages");
                return null;
            }
            ResultSet rst=db.execQuery(sql);
            if(rst != null)
            {
                while(rst.next())
                {
                    Expressages expressages = new Expressages();
                    expressages.setId(rst.getInt("expressage_id"));
                    expressages.setExpressage_code(rst.getString("expressage_code"));
                    expressages.setExpressage_company(rst.getString("expressage_company"));
                    expressages.setExpressage_time(rst.getString("expressage_time"));
                    expressages.setExpressage_yes_time(rst.getString("expressage_yes_time"));
                    expressages.setExpressage_owner_tel(rst.getString("expressage_owner_tel"));
                    expressages.setExpressage_status(rst.getString("expressage_status"));

                    expressagesList.add(expressages);
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
            return expressagesList;
        }
    }
}
