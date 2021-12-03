package main.lxxmanagement.service;

import main.lxxmanagement.idao.DAOFactory;
import main.lxxmanagement.idao.iFlowersDAO;
import main.lxxmanagement.model.Flowers;

import java.util.List;

public class FlowersSrv {

    private iFlowersDAO flowerDAO= DAOFactory.creatflowerDAO();

    public int add(Flowers flowers){

        return flowerDAO.insert(flowers);
    }

    public int modify(Flowers flowers){

        return flowerDAO.update(flowers);
    }

    public int delete(int ID){

        return flowerDAO.delete(ID);
    }
    public List<Flowers> Fetch(int flower_id){

        return flowerDAO.selectbyID(flower_id);
    }

    public List<Flowers> Fetch(String flowerinformation){

        return flowerDAO.select(flowerinformation);
    }

    public List<Flowers> FetchSale_stock(String flag){

        return flowerDAO.selectsale_stock(flag);
    }

}
