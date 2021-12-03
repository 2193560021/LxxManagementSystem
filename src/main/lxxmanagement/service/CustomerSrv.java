package main.lxxmanagement.service;

import main.lxxmanagement.idao.DAOFactory;
import main.lxxmanagement.idao.iCustomerDAO;
import main.lxxmanagement.model.Customer;

import java.util.List;

public class CustomerSrv {

    private iCustomerDAO customerDAO= DAOFactory.creatCustomerDAO();

    public int add(Customer customer){
        return customerDAO.insert(customer);
    }

    public int modify(Customer customer){
        return customerDAO.update(customer);
    }

    public int delete(int ID){
        return customerDAO.delete(ID);
    }

    public List<Customer> Fetch(String email,String method,String path){
        return customerDAO.select(email,method,path);
    }
}
