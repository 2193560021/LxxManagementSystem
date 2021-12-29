package main.lxxmanagement.dao;

import main.lxxmanagement.idao.iExpressagesDAO;
import main.lxxmanagement.idao.iImgWallDAO;
import main.lxxmanagement.model.Expressages;
import main.lxxmanagement.model.ImgWall;
import main.util.DBUtil;

import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

public class ImgWallDAO implements iImgWallDAO {


    @Override
    public int delete(int ID)
    {
        int result=0;
        try
        {
            String sql="delete from imgWall where imgWall_id = " + ID;
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
    public List<ImgWall> select(String customerTel, String method)
    {
        DBUtil db=null;
        List<ImgWall> imgWallList=null;
        imgWallList=new LinkedList<ImgWall>();
        try
        {
            customerTel.trim();
            String sql = null;
            System.out.println("method:" + method);
            if(method.equalsIgnoreCase("search")){
                sql="select * from imgWall where imgWall_owner_tel like '%" + customerTel + "%'";
            }else if (method.equalsIgnoreCase("searchByTel")){
                sql="select * from imgWall where imgWall_owner_tel like '" + customerTel + "' order by imgWall_time DESC";
            }
            db=new DBUtil();
            if(!db.openConnection())
            {
                System.out.print("fail to connect database table imgWall");
                return null;
            }
            ResultSet rst=db.execQuery(sql);
            if(rst != null)
            {
                while(rst.next())
                {
                    ImgWall imgWall = new ImgWall();
                    imgWall.setId(rst.getInt("imgWall_id"));
                    imgWall.setImgWall_title(rst.getString("imgWall_title"));
                    imgWall.setImgWall_name(rst.getString("imgWall_name"));
                    imgWall.setImgWall_time(rst.getString("imgWall_time"));
                    imgWall.setImgWall_owner_tel(rst.getString("imgWall_owner_tel"));

                    imgWallList.add(imgWall);
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
            return imgWallList;
        }
    }
}
