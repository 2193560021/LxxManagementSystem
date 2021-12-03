package main.lxxmanagement.idao;


import main.lxxmanagement.model.Customer;

import java.util.List;

public interface iCustomerDAO {

//
    public int insert(Customer customer);
//
    public int update(Customer customer);
//
    public int delete(int ID);
//

    public List<Customer> select(String customerEmail,String method,String path);
}
