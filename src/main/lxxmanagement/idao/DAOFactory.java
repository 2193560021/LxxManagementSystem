package main.lxxmanagement.idao;

import main.lxxmanagement.dao.*;
import main.lxxmanagement.idao.*;

public class DAOFactory
{

    private static iCustomerDAO cusDao;

    private static iMessagesDAO messDao;

    private static iExpressagesDAO expressagesDAO;


    private static iOrdersDAO ordersDAO;

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
}
