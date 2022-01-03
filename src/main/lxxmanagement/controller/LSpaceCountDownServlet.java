package main.lxxmanagement.controller;

import main.lxxmanagement.model.Expressages;
import main.lxxmanagement.model.LSpace;
import main.lxxmanagement.model.LSpaceCountDown;
import main.lxxmanagement.service.ExpressagesSrv;
import main.lxxmanagement.service.LSpaceCountDownSrv;
import main.lxxmanagement.service.LSpaceSrv;
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

@WebServlet("/LSpaceCountDownServlet")
public class LSpaceCountDownServlet extends HttpServlet
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
        if(type.equalsIgnoreCase("add"))
            add(request, response);
        else if(type.equalsIgnoreCase("delete"))
            delete(request, response);
        else if(type.equalsIgnoreCase("search"))
            search(request, response);
    }


    private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        LSpaceCountDown lSpaceCountDown=null;
        int id=0;
        try
        {
            int LSpace_countdown_owners_id=Integer.parseInt(request.getParameter("LSpace_countdown_owners_id"));
            String LSpace_countdown_title=request.getParameter("LSpace_countdown_title");
            String LSpace_countdown_time=request.getParameter("LSpace_countdown_time");
            String LSpace_countdown_bg=request.getParameter("LSpace_countdown_bg");
            lSpaceCountDown=new LSpaceCountDown( id,  LSpace_countdown_owners_id,  LSpace_countdown_title,  LSpace_countdown_time,  LSpace_countdown_bg);

            response.setContentType("text/html;charset=utf-8");
            PrintWriter out=response.getWriter();

            if(new LSpaceCountDownSrv().add(lSpaceCountDown) == 1)
                out.write("数据添加成功");
            else
                out.write("数据添加失败，请重试");

            out.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write("操作错误，请重试");
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        try
        {
            int id=Integer.parseInt(request.getParameter("id"));
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out=response.getWriter();
            out.write("" + new LSpaceCountDownSrv().delete(id));
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
        String LSpace_countdown_owners_id=request.getParameter("LSpace_countdown_owners_id");
        List<LSpaceCountDown> result=null;
        result=new LSpaceCountDownSrv().Fetch(LSpace_countdown_owners_id);
        String jsonStr="";
        try
        {
            JSONArray array=new JSONArray();
            JSONObject json;

            for(LSpaceCountDown s : result)
            {
                json=new JSONObject();
                json.put("LSpace_countdown_id", s.getLSpace_countdown_id());
                json.put("LSpace_countdown_owners_id", s.getLSpace_countdown_owners_id());
                json.put("LSpace_countdown_title", s.getLSpace_countdown_title());
                json.put("LSpace_countdown_time", s.getLSpace_countdown_time());
                json.put("LSpace_countdown_bg", s.getLSpace_countdown_bg());

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



