package main.lxxmanagement.controller;


import main.lxxmanagement.model.ImgWall;
import main.lxxmanagement.service.ExpressagesSrv;
import main.lxxmanagement.service.ImgWallSrv;
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

@WebServlet("/ImgWallServlet")
public class ImgWallServlet extends HttpServlet
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
            System.out.println("id" + id);
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out=response.getWriter();
            out.write("" + new ImgWallSrv().delete(id));
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
        String imgWall_owner_tel=request.getParameter("imgWall_owner_tel");
        String method=request.getParameter("method");
        List<ImgWall> result=null;
        result=new ImgWallSrv().Fetch(imgWall_owner_tel ,method);
        String jsonStr="";
        try
        {
            JSONArray array=new JSONArray();
            JSONObject json;
            for(ImgWall s : result)
            {
                json=new JSONObject();
                json.put("imgWall_id", s.getId());
                json.put("imgWall_title", s.getImgWall_title());
                json.put("imgWall_name", s.getImgWall_name());
                json.put("imgWall_time", s.getImgWall_time());
                json.put("imgWall_owner_tel", s.getImgWall_owner_tel());

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



