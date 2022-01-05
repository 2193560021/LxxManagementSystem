package main.lxxmanagement.controller;


import main.lxxmanagement.model.Customer;
import main.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;

@MultipartConfig(maxFileSize = 1024 * 1024 * 10)
@WebServlet("/ImgWallUploadServlet")
public class ImgWallUploadServlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;
    private static final MultipartConfig config;

    // 得到注解信息
    static
    {
        config = ImgWallUploadServlet.class.getAnnotation(MultipartConfig.class);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        Customer customer = new Customer();
        Part part;
        try
        {
            request.setCharacterEncoding("UTF-8");
            // 接收文本
            String imgWall_title = request.getParameter("imgWall_title");
            String imgWall_time = request.getParameter("imgWall_time");
            String imgWall_owner_tel = request.getParameter("imgWall_owner_tel");
            System.out.println("电话：" + imgWall_owner_tel);
            System.out.println("时间：" + imgWall_time);
            // 接收图片:图片封装在part对象中
            part = request.getPart("imgWall_image");
            System.out.println(part);
            String fileName = getFileName(part);
//            customer.setImg(fileName);
            // 保存图片
            part.write(getServletContext().getRealPath("/img/ImgWall_img/") + fileName);
            //向数据库中存入路径
            updateImgWall(imgWall_title,imgWall_time,imgWall_owner_tel,fileName);

            System.out.println(fileName);
            System.out.println(part.getSize());
            // 带着play对象转发到result.java页
            request.setAttribute("play", customer);
            request.getRequestDispatcher("/html/ImgWallUploadComplete.html").forward(request, response);
        }
        catch(Exception e)
        {
            if(config.maxRequestSize() == -1L || config.maxFileSize() == -1L)
            {
                System.out.println("上传文件过大!");
            }
            request.setAttribute("desc", "上传文件过大(限制10M)，或存在异常!");
        }

    }

    /**
     * 从Part的Header信息中提取上传文件的文件名
     * @param part
     * @return 上传文件的文件名，如果如果没有则返回null
     */
    private String getFileName(Part part)
    {
        // 获取header信息中的content-disposition，如果为文件，则可以从其中提取出文件名
        // IE下文件名带路径，而火狐、chrome文件名不带
        String header = part.getHeader("content-disposition");
        System.out.println("header : " + header);
        String[] params = header.split(";");
        String[] temp = params[2].split("=");
        // 获取文件名，兼容各种浏览器的写法，去掉文件名前路径和双引号
        String fileName = "";
        if(temp[1].lastIndexOf("\\") < 0)
            fileName = temp[1].substring(1, temp[1].length() - 1);
        else
            fileName = temp[1].substring(temp[1].lastIndexOf("\\") + 1, temp[1].length() - 1);
        return fileName;
    }


    public void updateImgWall(String imgWall_title,String imgWall_time,String imgWall_owner_tel,String fileName)
    {
        int result=0;
        try
        {

            String sql="insert into imgWall(imgWall_title, imgWall_name, imgWall_time, imgWall_owner_tel) VALUES";
            sql+="('"+ imgWall_title +"','"+ fileName +"','"+ imgWall_time +"','"+ imgWall_owner_tel +"')";
            DBUtil db=new DBUtil();
            db.openConnection();
            result=db.execCommand(sql);
            db.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }


}