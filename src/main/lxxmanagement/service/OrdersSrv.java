package main.lxxmanagement.service;

import main.lxxmanagement.idao.DAOFactory;
import main.lxxmanagement.idao.iExpressagesDAO;
import main.lxxmanagement.idao.iOrdersDAO;
import main.lxxmanagement.model.Expressages;
import main.lxxmanagement.model.Orders;

import java.util.List;

public class OrdersSrv {

    private iOrdersDAO ordersDAO = DAOFactory.creatOrdersDAO();

    public int add(Orders orders){
        return ordersDAO.insert(orders);
    }
//
//    public int modify(Play play){
//        return employeeDAO.update(play);
//    }
//
    public int delete(int ID){
        return ordersDAO.delete(ID);
    }

    public List<Orders> Fetch(String tel, String method){
        return ordersDAO.select(tel,method);
    }

}
