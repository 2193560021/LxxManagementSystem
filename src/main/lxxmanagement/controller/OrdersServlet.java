package main.lxxmanagement.controller;

import main.lxxmanagement.model.Orders;
import main.lxxmanagement.service.OrdersSrv;
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

@WebServlet("/OrdersServlet")
public class OrdersServlet extends HttpServlet
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
    }

    private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        Orders orders=null;
        int id=0;
        try
        {
            String order_text=request.getParameter("order_text");
            int order_kind=Integer.parseInt(request.getParameter("order_kind"));
            float order_amount=Float.parseFloat(request.getParameter("order_amount"));
            float order_amount_sum_new=Float.parseFloat(request.getParameter("order_amount_sum_new"));
            float order_amount_sum = 0;

            if(order_kind == 0){
                order_amount_sum = order_amount_sum_new - order_amount;
            }else if (order_kind == 1){

                order_amount_sum = order_amount_sum_new + order_amount;
            }


            String order_owner_tel=request.getParameter("order_owner_tel");
            String order_time=request.getParameter("order_time");
            orders=new Orders( id,  order_text,  order_kind,  order_amount,  order_amount_sum,  order_owner_tel,  order_time);

            response.setContentType("text/html;charset=utf-8");
            PrintWriter out=response.getWriter();

            if(new OrdersSrv().add(orders) == 1)
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
            out.write("" + new OrdersSrv().delete(id));
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
        String order_owner_tel=request.getParameter("order_owner_tel");
        String method=request.getParameter("method");
        List<Orders> result=null;
        result=new OrdersSrv().Fetch(order_owner_tel ,method);
        String jsonStr="";
        try
        {
            JSONArray array=new JSONArray();
            JSONObject json;
            for(Orders s : result)
            {
                json=new JSONObject();
                json.put("order_id", s.getId());
                json.put("order_text", s.getOrder_text());
                json.put("order_kind", s.getOrder_kind());
                json.put("order_amount", s.getOrder_amount());
                System.out.println(s.getOrder_amount());
                json.put("order_amount_sum", s.getOrder_amount_sum());
                json.put("order_owner_tel", s.getOrder_owner_tel());
                json.put("order_time", s.getOrder_time());

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



