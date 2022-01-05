package main.lxxmanagement.controller;

import main.lxxmanagement.model.Expressages;
import main.lxxmanagement.service.ExpressagesSrv;
import main.util.DBUtil;
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

@WebServlet("/ExpressagesServlet")
public class ExpressagesServlet extends HttpServlet
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
        else if(type.equalsIgnoreCase("deleteAllYes"))
            deleteAllYes(request, response);
        else if(type.equalsIgnoreCase("search"))
            search(request, response);
        else if(type.equalsIgnoreCase("check"))
            check(request, response);
        else if(type.equalsIgnoreCase("repeat"))
            repeat(request, response);
    }

    private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        Expressages expressages=null;
        int id=0;
        try
        {
            String expressage_code=request.getParameter("expressage_code");
            String expressage_company=request.getParameter("expressage_company");
            String expressage_time=request.getParameter("expressage_time");
            String expressage_yes_time="";
            String expressage_owner_tel=request.getParameter("expressage_owner_tel");
            String expressage_status="";
            expressages=new Expressages( id,  expressage_code,  expressage_company,  expressage_time,  expressage_yes_time,  expressage_owner_tel,  expressage_status);

            response.setContentType("text/html;charset=utf-8");
            PrintWriter out=response.getWriter();

            if(new ExpressagesSrv().add(expressages) == 1)
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
            out.write("" + new ExpressagesSrv().delete(id));
            out.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write("操作错误，请重试");
        }
    }


    private void deleteAllYes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        try
        {
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out=response.getWriter();


            int result = 0;

            String sql="delete from expressages where expressage_status = 1";
            DBUtil db=new DBUtil();
            db.openConnection();
            result=db.execCommand(sql);
            db.close();

            out.println(result);

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
        String expressage_owner_tel=request.getParameter("expressage_owner_tel");
        String method=request.getParameter("method");
        List<Expressages> result=null;
        result=new ExpressagesSrv().Fetch(expressage_owner_tel ,method);
        String jsonStr="";
        try
        {
            JSONArray array=new JSONArray();
            JSONObject json;
            for(Expressages s : result)
            {
                json=new JSONObject();
                json.put("expressage_id", s.getId());
                json.put("expressage_code", s.getExpressage_code());
                json.put("expressage_company", s.getExpressage_company());
                json.put("expressage_time", s.getExpressage_time());
                json.put("expressage_yes_time", s.getExpressage_yes_time());
                json.put("expressage_owner_tel", s.getExpressage_owner_tel());
                json.put("expressage_status", s.getExpressage_status());

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


    private void check(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
        response.setCharacterEncoding("UTF-8");
        PrintWriter out=response.getWriter();
        int expressage_id = Integer.parseInt(request.getParameter("expressage_id"));
        String expressage_yes_time = request.getParameter("expressage_yes_time");
        int result=0;
        try{
            String sql="update expressages set expressage_status = 1,expressage_yes_time = '" + expressage_yes_time;
            sql+="' where expressage_id = " + expressage_id;
            DBUtil db=new DBUtil();
            db.openConnection();
            result=db.execCommand(sql);
            db.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }


    private void repeat(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
        response.setCharacterEncoding("UTF-8");
        PrintWriter out=response.getWriter();
        int expressage_id = Integer.parseInt(request.getParameter("expressage_id"));
        String expressage_yes_time = request.getParameter("expressage_time");
        int result=0;
        try{
            String sql="update expressages set expressage_status = 0,expressage_time = '" + expressage_yes_time;
            sql+="' where expressage_id = " + expressage_id;
            DBUtil db=new DBUtil();
            db.openConnection();
            result=db.execCommand(sql);
            db.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

}



