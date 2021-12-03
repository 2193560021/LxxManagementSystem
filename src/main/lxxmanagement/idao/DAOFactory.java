package main.lxxmanagement.idao;


import main.lxxmanagement.dao.CustomerDAO;
import main.lxxmanagement.dao.FlowersDAO;

public class DAOFactory
{
    private static iCustomerDAO cusDao;

    private  static iFlowersDAO flowerDAO;

    public static synchronized iCustomerDAO creatCustomerDAO()
    {
        if(null == cusDao)
            cusDao=new CustomerDAO();
        return cusDao;
    }


    public static synchronized iFlowersDAO creatflowerDAO()
    {
        if(null == flowerDAO)
            flowerDAO=new FlowersDAO();
        return flowerDAO;
    }

}
