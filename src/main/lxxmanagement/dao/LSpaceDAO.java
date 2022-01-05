package main.lxxmanagement.dao;

import main.lxxmanagement.idao.iLSpaceDAO;
import main.lxxmanagement.model.LSpace;
import main.util.DBUtil;

import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

public class LSpaceDAO implements iLSpaceDAO {


    @SuppressWarnings("finally")
    @Override
    public List<LSpace> select(String customerTel)
    {
        DBUtil db=null;
        List<LSpace> lSpaceList=null;
        lSpaceList=new LinkedList<LSpace>();
        try
        {
            customerTel.trim();
            String sql = null;
            sql="select * from LSpace where LSpace_lovers like '%" + customerTel + "%'";

            db=new DBUtil();
            if(!db.openConnection())
            {
                System.out.print("fail to connect database table LSpace");
                return null;
            }
            ResultSet rst=db.execQuery(sql);
            if(rst != null)
            {
                while(rst.next())
                {
                    LSpace lSpace = new LSpace();
                    lSpace.setLSpace_id(rst.getInt("LSpace_id"));
                    lSpace.setLSpace_lovers(rst.getString("LSpace_lovers"));
                    lSpace.setLSpace_time(rst.getString("LSpace_time"));

                    lSpaceList.add(lSpace);
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
            return lSpaceList;
        }
    }
}
