package main.lxxmanagement.idao;

import main.lxxmanagement.model.Flowers;

import java.util.List;

public interface iFlowersDAO {

    public int insert(Flowers flowers);

    public int update(Flowers flowers);

    public int delete(int ID);

    public List<Flowers> selectbyID(int flower_id);

    public List<Flowers> select(String flowerinformation);

    public List<Flowers> selectsale_stock(String flag);
}
