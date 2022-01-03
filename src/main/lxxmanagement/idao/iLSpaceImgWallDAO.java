package main.lxxmanagement.idao;

import main.lxxmanagement.model.LSpaceImgWall;

import java.util.List;

public interface iLSpaceImgWallDAO {

    public int delete(int ID);

    public List<LSpaceImgWall> select(String customerId);
}
