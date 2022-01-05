package main.lxxmanagement.controller;

import main.lxxmanagement.model.LSpaceImgWall;
import main.lxxmanagement.service.LSpaceImgWallSrv;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/LSpaceImgWallServlet")
public class LSpaceImgWallServlet extends HttpServlet
{
    private static final long serialVersionUID=1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String type=request.getParameter("type");

        // 根据请求操作类型，执行相应的增、删、该、查
        if(type.equalsIgnoreCase("delete"))
            delete(request, response);
        else if(type.equalsIgnoreCase("search"))
            search(request, response);
    }


    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        try
        {
            int id=Integer.parseInt(request.getParameter("id"));
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out=response.getWriter();
            out.write("" + new LSpaceImgWallSrv().delete(id));
            out.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write("操作错误，请重试");
        }
    }


    private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setCharacterEncoding("UTF-8");
        PrintWriter out=response.getWriter();
        String LSpaceImgWall_owners_id=request.getParameter("LSpaceImgWall_owners_id");
        List<LSpaceImgWall> result=null;
        result=new LSpaceImgWallSrv().Fetch(LSpaceImgWall_owners_id);
        String jsonStr="";
        try
        {
            JSONArray array=new JSONArray();
            JSONObject json;

            for(LSpaceImgWall s : result)
            {
                json=new JSONObject();
                json.put("LSpace_imgWall_id", s.getLSpace_imgWall_id());
                json.put("LSpace_imgWall_owners_id", s.getLSpace_imgWall_owners_id());
                json.put("LSpace_imgWall_title", s.getLSpace_imgWall_title());
                json.put("LSpace_imgWall_name", s.getLSpace_imgWall_name());
                json.put("LSpace_imgWall_time", s.getLSpace_imgWall_time());

                array.put(json);
            }
            jsonStr=array.toString();
        }
        catch(JSONException e)
        {
            e.printStackTrace();
        }
        finally
        {
            out.println(jsonStr);
            out.flush();
            out.close();
        }
    }
}



