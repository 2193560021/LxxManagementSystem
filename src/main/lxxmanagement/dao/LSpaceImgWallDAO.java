package main.lxxmanagement.dao;

import main.lxxmanagement.idao.iLSpaceImgWallDAO;
import main.lxxmanagement.model.LSpaceImgWall;
import main.util.DBUtil;

import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

public class LSpaceImgWallDAO implements iLSpaceImgWallDAO {

    @Override
    public int delete(int ID)
    {
        int result=0;
        try
        {
            String sql="delete from LSpace_imgWall where LSpace_imgWall_id = " + ID;
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
    public List<LSpaceImgWall> select(String LSpace_ImgWall_owners_id)
    {
        DBUtil db=null;
        List<LSpaceImgWall> lSpaceImgWallList=null;
        lSpaceImgWallList=new LinkedList<LSpaceImgWall>();
        try
        {
            LSpace_ImgWall_owners_id.trim();
            String sql = null;
            sql="select * from LSpace_imgWall where LSpace_imgWall_owners_id like '" + LSpace_ImgWall_owners_id + "' order by LSpace_imgWall_time DESC";

            db=new DBUtil();
            if(!db.openConnection())
            {
                System.out.print("fail to connect database table LSpace_imgWall");
                return null;
            }
            ResultSet rst=db.execQuery(sql);
            if(rst != null)
            {
                while(rst.next())
                {
                    LSpaceImgWall lSpaceImgWall = new LSpaceImgWall();
                    lSpaceImgWall.setLSpace_imgWall_id(rst.getInt("LSpace_imgWall_id"));
                    lSpaceImgWall.setLSpace_imgWall_owners_id(rst.getInt("LSpace_imgWall_owners_id"));
                    lSpaceImgWall.setLSpace_imgWall_title(rst.getString("LSpace_imgWall_title"));
                    lSpaceImgWall.setLSpace_imgWall_name(rst.getString("LSpace_imgWall_name"));
                    lSpaceImgWall.setLSpace_imgWall_time(rst.getString("LSpace_imgWall_time"));

                    lSpaceImgWallList.add(lSpaceImgWall);
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
            return lSpaceImgWallList;
        }
    }
}
