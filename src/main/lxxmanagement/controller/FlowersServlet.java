package main.lxxmanagement.controller;

import main.lxxmanagement.model.Flowers;
import main.lxxmanagement.service.FlowersSrv;
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

@WebServlet("/FlowersServlet")
public class FlowersServlet extends HttpServlet{
    private static final long serialVersionUID=2L;

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
        else if(type.equalsIgnoreCase("update"))
            update(request, response);
        else if(type.equalsIgnoreCase("searchByName"))
            searchByName(request, response);
        else if(type.equalsIgnoreCase("searchByImg"))
            searchByImg(request,response);
        else if(type.equalsIgnoreCase("searchId"))
            searchId(request, response);
        else if(type.equalsIgnoreCase("sale_stock"))
            sale_stock(request, response);
        else if(type.equalsIgnoreCase("sale_stock_search"))
            sale_stock_search(request, response);
    }

    private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        Flowers flowers =null;
        int id=0;
        try
        {
            String flower_name=request.getParameter("flower_name");
            String flower_kind=request.getParameter("flower_kind");
            String flower_introduction=request.getParameter("flower_introduction");
            String flower_image1="";
            String flower_image2="";
            String flower_image3="";
            String flower_image4="";
            int flower_price=Integer.valueOf(request.getParameter("flower_price"));
            int flower_sale=0;
            int flower_stock=1000;
            flowers =new Flowers(id, flower_name, flower_kind,flower_introduction,null,null,null,null,flower_price,flower_sale,flower_stock);
            PrintWriter out=response.getWriter();
            if(new FlowersSrv().add(flowers) == 1)
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
            int id=Integer.valueOf(request.getParameter("flower_id"));
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out=response.getWriter();
            out.write("" + new FlowersSrv().delete(id));
            out.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write("操作错误，请重试");
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        Flowers flowers =null;
        int id=Integer.valueOf(request.getParameter("flower_id"));
        try
        {

            String flower_name=request.getParameter("flower_name");
            String flower_kind=request.getParameter("flower_kind");
            String flower_introduction=request.getParameter("flower_introduction");
            int flower_price=Integer.valueOf(request.getParameter("flower_price"));
            int flower_sale=0;
            int flower_stock=1000;
            flowers =new Flowers(id, flower_name, flower_kind,flower_introduction,null,null,null,null,flower_price,flower_sale,flower_stock);
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out=response.getWriter();
            if(new FlowersSrv().modify(flowers) == 1)
                out.write("数据修改成功");
            else
                out.write("数据修改失败，请重试");
            out.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write("操作错误，请重试");
        }
    }

    private void searchId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

        response.setCharacterEncoding("UTF-8");
        PrintWriter out=response.getWriter();
        int id=Integer.valueOf(request.getParameter("flower_id"));
        List<Flowers> result=null;
        result=new FlowersSrv().Fetch(id);

        String jsonStr="";
        try
        {
            JSONArray array=new JSONArray();
            JSONObject json;
            for(Flowers s : result)
            {
                json=new JSONObject();
                json.put("flower_id", s.getFlower_id());
                json.put("flower_name", s.getFlower_name());
                json.put("flower_kind", s.getFlower_kind());
                json.put("flower_introduction", s.getFlower_introduction());
                json.put("flower_image1", s.getFlower_image1());
                json.put("flower_image2", s.getFlower_image2());
                json.put("flower_image3", s.getFlower_image3());
                json.put("flower_image4", s.getFlower_image4());
                json.put("flower_price", s.getFlower_price());
                json.put("flower_sale", s.getFlower_sale());
                json.put("flower_stock", s.getFlower_stock());
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


    private void searchByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setCharacterEncoding("UTF-8");
        PrintWriter out=response.getWriter();
        String flowerinformation=request.getParameter("flower_name");
        List<Flowers> result=null;
        result=new FlowersSrv().Fetch(flowerinformation);
        String jsonStr="";
        try
        {
            JSONArray array=new JSONArray();
            JSONObject json;
            for(Flowers s : result)
            {
                json=new JSONObject();
                json.put("flower_id", s.getFlower_id());
                json.put("flower_name", s.getFlower_name());
                json.put("flower_kind", s.getFlower_kind());
                json.put("flower_introduction", s.getFlower_introduction());
                json.put("flower_image1", s.getFlower_image1());
                json.put("flower_image2", s.getFlower_image2());
                json.put("flower_image3", s.getFlower_image3());
                json.put("flower_image4", s.getFlower_image4());
                json.put("flower_price", s.getFlower_price());
                json.put("flower_sale", s.getFlower_sale());
                json.put("flower_stock", s.getFlower_stock());
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

    private void searchByImg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setCharacterEncoding("UTF-8");
        PrintWriter out=response.getWriter();
        String flowerinformation=request.getParameter("flower_image1");
        List<Flowers> result=null;
        result=new FlowersSrv().Fetch(flowerinformation);

        String jsonStr="";
        try
        {
            JSONArray array=new JSONArray();
            JSONObject json;
            for(Flowers s : result)
            {
                json=new JSONObject();
                json.put("flower_id", s.getFlower_id());
                json.put("flower_name", s.getFlower_name());
                json.put("flower_kind", s.getFlower_kind());
                json.put("flower_introduction", s.getFlower_introduction());
                json.put("flower_image1", s.getFlower_image1());
                json.put("flower_image2", s.getFlower_image2());
                json.put("flower_image3", s.getFlower_image3());
                json.put("flower_image4", s.getFlower_image4());
                json.put("flower_price", s.getFlower_price());
                json.put("flower_sale", s.getFlower_sale());
                json.put("flower_stock", s.getFlower_stock());
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


    private void sale_stock(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        try
        {
            int result=0;
            int flower_id=Integer.valueOf(request.getParameter("flower_id"));
            response.setContentType("text/html;charset=utf-8");
            String sql="update flowers set flower_sale = flower_sale + 1 , flower_stock = flower_stock - 1";
            sql+=" where flower_id = " + flower_id;
            DBUtil db=new DBUtil();
            db.openConnection();
            result=db.execCommand(sql);
            db.close();
            PrintWriter out=response.getWriter();
            if(result == 1)
                out.write("销量修改成功");
            else
                out.write("销量修改失败，请重试");
            out.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write("操作错误，请重试");
        }
    }


    private void sale_stock_search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setCharacterEncoding("UTF-8");
        String flag = request.getParameter("flag");
        PrintWriter out=response.getWriter();
        List<Flowers> result=null;
        result=new FlowersSrv().FetchSale_stock(flag);
        String jsonStr="";
        try
        {
            JSONArray array=new JSONArray();
            JSONObject json;
            for(Flowers s : result)
            {
                json=new JSONObject();
                json.put("flower_id", s.getFlower_id());
                json.put("flower_name", s.getFlower_name());
                json.put("flower_sale", s.getFlower_sale());
                json.put("flower_stock", s.getFlower_stock());
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
