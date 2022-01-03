package main.lxxmanagement.dao;

import main.lxxmanagement.idao.iLSpaceCountDownDAO;
import main.lxxmanagement.idao.iLSpaceDAO;
import main.lxxmanagement.model.Expressages;
import main.lxxmanagement.model.LSpace;
import main.lxxmanagement.model.LSpaceCountDown;
import main.util.DBUtil;

import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

public class LSpaceCountDownDAO implements iLSpaceCountDownDAO {

    @SuppressWarnings("finally")
    @Override
    public int insert(LSpaceCountDown lSpaceCountDown)
    {
        int result=0;
        try
        {
            String sql="insert into LSpace_countdowns(LSpace_countdown_owners_id, LSpace_countdown_title, LSpace_countdown_time, LSpace_countdown_bg)"
                    + " values(" + lSpaceCountDown.getLSpace_countdown_owners_id() +",'" + lSpaceCountDown.getLSpace_countdown_title() + "', '" + lSpaceCountDown.getLSpace_countdown_time() + "','"+ lSpaceCountDown.getLSpace_countdown_bg() +"' )";
            DBUtil db=new DBUtil();
            db.openConnection();
            ResultSet rst=db.getInsertObjectIDs(sql);
            if(rst != null && rst.first())
            {
                lSpaceCountDown.setLSpace_countdown_id(rst.getInt(1));
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
            String sql="delete from LSpace_countdowns where LSpace_countdown_id = " + ID;
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
    public List<LSpaceCountDown> select(String LSpace_countdown_owners_id)
    {
        DBUtil db=null;
        List<LSpaceCountDown> lSpaceCountDownList=null;
        lSpaceCountDownList=new LinkedList<LSpaceCountDown>();
        try
        {
            LSpace_countdown_owners_id.trim();
            String sql = null;
            sql="select * from LSpace_countdowns where LSpace_countdown_owners_id like '" + LSpace_countdown_owners_id + "'";

            db=new DBUtil();
            if(!db.openConnection())
            {
                System.out.print("fail to connect database table LSpace_countdowns");
                return null;
            }
            ResultSet rst=db.execQuery(sql);
            if(rst != null)
            {
                while(rst.next())
                {
                    LSpaceCountDown lSpaceCountDown = new LSpaceCountDown();
                    lSpaceCountDown.setLSpace_countdown_id(rst.getInt("LSpace_countdown_id"));
                    lSpaceCountDown.setLSpace_countdown_owners_id(rst.getInt("LSpace_countdown_owners_id"));
                    lSpaceCountDown.setLSpace_countdown_title(rst.getString("LSpace_countdown_title"));
                    lSpaceCountDown.setLSpace_countdown_time(rst.getString("LSpace_countdown_time"));
                    lSpaceCountDown.setLSpace_countdown_bg(rst.getString("LSpace_countdown_bg"));

                    lSpaceCountDownList.add(lSpaceCountDown);
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
            return lSpaceCountDownList;
        }
    }
}
