package main.lxxmanagement.idao;

import main.lxxmanagement.dao.*;
import main.lxxmanagement.idao.*;

public class DAOFactory
{

    private static iCustomerDAO cusDao;

    private static iMessagesDAO messDao;

    private static iExpressagesDAO expressagesDAO;

    private static iOrdersDAO ordersDAO;

    private static iImgWallDAO imgWallDAO;

    private static iLSpaceDAO lSpaceDAO;

    private static iLSpaceCountDownDAO lSpaceCountDownDAO;

    private static iLSpaceImgWallDAO lSpaceImgWallDAO;

    public static synchronized iCustomerDAO creatCustomerDAO()
    {
        if(null == cusDao)
            cusDao=new CustomerDAO();
        return cusDao;
    }


    public static synchronized iMessagesDAO creatMessagesDAO()
    {
        if(null == messDao)
            messDao=new MessagesDAO();
        return messDao;
    }

    public static synchronized iExpressagesDAO creatExpressagesDAO()
    {
        if(null == expressagesDAO)
            expressagesDAO=new ExpressagesDAO();
        return expressagesDAO;
    }

    public static synchronized iOrdersDAO creatOrdersDAO()
    {
        if(null == ordersDAO)
             ordersDAO=new OrdersDAO();
        return ordersDAO;
    }

    public static synchronized iImgWallDAO creatImgWallDAO()
    {
        if(null == imgWallDAO)
            imgWallDAO=new ImgWallDAO();
        return imgWallDAO;
    }

    public static synchronized iLSpaceDAO creatLSpaceDAO()
    {
        if(null == lSpaceDAO)
            lSpaceDAO=new LSpaceDAO();
        return lSpaceDAO;
    }

    public static synchronized iLSpaceCountDownDAO creatLSpaceCountDownDAO()
    {
        if(null == lSpaceCountDownDAO)
            lSpaceCountDownDAO=new LSpaceCountDownDAO();
        return lSpaceCountDownDAO;
    }

    public static synchronized iLSpaceImgWallDAO creatLSpaceImgWallDAO()
    {
        if(null == lSpaceImgWallDAO)
            lSpaceImgWallDAO=new LSpaceImgWallDAO();
        return lSpaceImgWallDAO;
    }


}
