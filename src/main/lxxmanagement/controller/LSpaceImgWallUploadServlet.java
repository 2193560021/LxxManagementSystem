package main.lxxmanagement.controller;


import main.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;

@MultipartConfig(maxFileSize = 1024 * 1024 * 15)
@WebServlet("/LSpaceImgWallUploadServlet")
public class LSpaceImgWallUploadServlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;
    private static final MultipartConfig config;

    // 得到注解信息
    static
    {
        config = LSpaceImgWallUploadServlet.class.getAnnotation(MultipartConfig.class);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        Part part;
        try
        {
            request.setCharacterEncoding("UTF-8");
            // 接收文本
            String LSpaceImgWall_title = request.getParameter("LSpaceImgWall_title");
            String LSpaceImgWall_time = request.getParameter("LSpaceImgWall_time");
            String LSpaceImgWall_owners_id = request.getParameter("LSpaceImgWall_owners_id");
            System.out.println("id：" + LSpaceImgWall_owners_id);
            System.out.println("时间：" + LSpaceImgWall_time);
            // 接收图片:图片封装在part对象中
            part = request.getPart("LSpaceImgWall_image");
            System.out.println(part);
            String fileName = getFileName(part);
//            customer.setImg(fileName);
            // 保存图片
            part.write(getServletContext().getRealPath("/img/LSpace_imgWall/") + fileName);
            //向数据库中存入路径
            updateLSpaceImgWall(LSpaceImgWall_title,LSpaceImgWall_owners_id,LSpaceImgWall_time,fileName);

            System.out.println(fileName);
            System.out.println(part.getSize());
            // 带着play对象转发到result.java页
            request.getRequestDispatcher("/html/LSpaceImgWallUploadComplete.html").forward(request, response);
        }
        catch(Exception e)
        {
            if(config.maxRequestSize() == -1L || config.maxFileSize() == -1L)
            {
                System.out.println("上传文件过大!");
            }
            request.setAttribute("desc", "上传文件过大(限制15M)，或存在异常!");
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


    public void updateLSpaceImgWall(String LSpaceImgWall_title,String LSpaceImgWall_owners_id,String LSpaceImgWall_time,String fileName)
    {
        int result=0;
        try
        {

            String sql="insert into LSpace_imgWall(LSpace_imgWall_owners_id,LSpace_imgWall_title, LSpace_imgWall_name, LSpace_imgWall_time) values";
            sql+="('"+ LSpaceImgWall_owners_id +"','"+ LSpaceImgWall_title +"','../img/LSpace_imgWall/"+ fileName +"','"+ LSpaceImgWall_time +"')";
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