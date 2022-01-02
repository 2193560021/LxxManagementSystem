package main.lxxmanagement.controller;

import main.lxxmanagement.model.Messages;
import main.lxxmanagement.service.MessagesSrv;
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

@WebServlet("/MessagesServlet")
public class LSpaceServlet extends HttpServlet
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
        Messages messages=null;
        int id=0;
        try
        {
            String message_send_name=request.getParameter("message_send_name");
            String message_send_tel=request.getParameter("message_send_tel");
            String message_accept_name=request.getParameter("message_accept_name");
            String message_accept_tel=request.getParameter("message_accept_tel");
            String message_time=request.getParameter("message_time");
            String message_send_user_img=request.getParameter("message_send_user_img");
            String message_text=request.getParameter("message_text");
            messages=new Messages( id,  message_send_name,  message_send_tel,  message_accept_name,  message_accept_tel,  message_time,  message_send_user_img,  message_text);

            response.setContentType("text/html;charset=utf-8");
            PrintWriter out=response.getWriter();

            if(new MessagesSrv().add(messages) == 1)
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
            int id=Integer.valueOf(request.getParameter("id"));
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out=response.getWriter();
            out.write("" + new MessagesSrv().delete(id));
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
        String message_accept_tel=request.getParameter("message_accept_tel");
        String method=request.getParameter("method");
        List<Messages> result=null;
        result=new MessagesSrv().Fetch(message_accept_tel ,method);
        String jsonStr="";
        try
        {
            JSONArray array=new JSONArray();
            JSONObject json;
            for(Messages s : result)
            {
                json=new JSONObject();
                json.put("id", s.getID());
                json.put("message_send_name", s.getMessage_send_name());
                json.put("message_send_tel", s.getMessage_send_tel());
                json.put("message_accept_name", s.getMessage_accept_name());
                json.put("message_accept_tel", s.getMessage_accept_tel());
                json.put("message_time", s.getMessage_time());
                json.put("message_send_user_img", s.getMessage_send_user_img());
                json.put("message_text", s.getMessage_text());

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



