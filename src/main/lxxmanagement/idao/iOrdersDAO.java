package main.lxxmanagement.idao;

import main.lxxmanagement.model.Expressages;
import main.lxxmanagement.model.Orders;

import java.util.List;

public interface iOrdersDAO {

//
    public int insert(Orders orders);
//
//    public int update(Play play);
//
    public int delete(int ID);
//

    public List<Orders> select(String tel, String method);
}
