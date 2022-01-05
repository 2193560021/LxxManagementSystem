package main.lxxmanagement.controller;

import main.lxxmanagement.model.LSpace;
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

@WebServlet("/LSpaceServlet")
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
        if(type.equalsIgnoreCase("search"))
            search(request, response);
    }

    private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setCharacterEncoding("UTF-8");
        PrintWriter out=response.getWriter();
        String LSpace_owner_tel=request.getParameter("LSpace_owner_tel");
        List<LSpace> result=null;
        result=new LSpaceSrv().Fetch(LSpace_owner_tel);
        String jsonStr="";
        try
        {
            JSONArray array=new JSONArray();
            JSONObject json;

            for(LSpace s : result)
            {
                json=new JSONObject();
                String LSpace_lovers = s.getLSpace_lovers();
                if(LSpace_owner_tel.equals(LSpace_lovers.split("-")[0]) || LSpace_owner_tel.equals(LSpace_lovers.split("-")[1])){
                    json.put("LSpace_id", s.getLSpace_id());
                    json.put("LSpace_lovers", s.getLSpace_lovers());
                    json.put("LSpace_time", s.getLSpace_time());
                }

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



